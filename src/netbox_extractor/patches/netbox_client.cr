module NetboxExtractor
  module Patches
    # Domain helpers mixed into both device and VM Netbox types (`netbox_*`
    # methods) covering roles, tags, OS detection and power state. Type-specific
    # behavior (physical vs. virtual, SNMP forcing) lives in `netbox_device.cr`
    # and `netbox_vm.cr`.
    module NetboxClient
      # Role slug of the object. The nilability is asymmetric and the type says
      # so per receiver: a device's role is non-nullable in Netbox, so this
      # returns a `String` there and nil-handling on a device is dead code; a
      # VM's role is optional, so it returns `String?`.
      def netbox_role
        role.try &.slug
      end

      # True when the object's role slug equals `role`.
      def netbox_has_role?(role)
        netbox_role == role
      end

      # Primary IP address without its CIDR mask, falling back to the object's
      # `name` when no primary IP is set.
      def netbox_primary_ip
        primary_ip.try &.address.split("/").first || name
      end

      # Sorted list of the object's effective tags: the Netbox tag slugs plus the
      # role slug, with any `source-*` provenance tags stripped out. Netbox
      # returns a null tags array (not an empty one) for an object that was
      # never tagged, so the list is seeded empty rather than threaded as nil:
      # otherwise the role slug was dropped and the SNMP/ping predicates
      # answered nil instead of false.
      def netbox_tags
        netbox_tags = tags.try(&.map(&.slug)) || [] of String
        role_slug = netbox_role

        netbox_tags.push(role_slug) if role_slug
        netbox_tags.reject!(&.starts_with?("source-"))
        netbox_tags.sort
      end

      # True when the object carries the `check-by-snmp` tag, requesting SNMP
      # monitoring. Devices override this to also force SNMP for storage/network
      # roles.
      def netbox_check_by_snmp?
        netbox_tags.includes?("check-by-snmp")
      end

      # True when the object carries the `check-only-ping` tag, restricting
      # monitoring to a ping check.
      def netbox_check_by_ping?
        netbox_tags.includes?("check-only-ping")
      end

      # Platform slug from Netbox (e.g. `debian-12`), or `"unknown"` when no
      # platform is assigned. Basis for all OS detection helpers.
      def netbox_os_name
        platform.try &.slug || "unknown"
      end

      # Substrings that classify a platform slug. Exposed rather than inlined so
      # the config checker can flag a slug carrying markers of both families
      # under the very rule that classifies it — duplicating the list would let
      # the two drift apart.
      LINUX_MARKERS   = %w[linux debian ubuntu vmkernel vmware]
      WINDOWS_MARKERS = %w[microsoft-windows windows]

      # True when the slug indicates a Linux-family OS (including Debian/Ubuntu
      # and VMware ESXi/vmkernel).
      def self.linux_slug?(slug)
        LINUX_MARKERS.any? { |marker| slug.includes?(marker) }
      end

      # True when the slug indicates a Windows OS.
      def self.windows_slug?(slug)
        WINDOWS_MARKERS.any? { |marker| slug.includes?(marker) }
      end

      # True when the platform slug indicates a Linux-family OS (including
      # Debian/Ubuntu and VMware ESXi/vmkernel).
      def netbox_linux?
        NetboxClient.linux_slug?(netbox_os_name)
      end

      # True when the platform slug indicates a Windows OS.
      def netbox_windows?
        NetboxClient.windows_slug?(netbox_os_name)
      end

      # Dispatches an OS-family check by name: `"linux"` or `"windows"`; any other
      # value returns `false`.
      def netbox_is_os?(os)
        case os
        when "linux"
          netbox_linux?
        when "windows"
          netbox_windows?
        else
          false
        end
      end

      # Normalized OS family: `"linux"` or `"windows"` when detected, otherwise
      # the raw platform slug from `netbox_os_name`.
      def netbox_os_family
        return "linux" if netbox_linux?
        return "windows" if netbox_windows?

        netbox_os_name
      end

      # Relative Icinga config file path for this object. The directory is the
      # type-specific `netbox_icinga_subdir` unless the role's config supplies a
      # `filename`, which overrides it — the key the example config has always
      # carried and which nothing read until now.
      def netbox_icinga_filename(subdir = nil)
        File.join(subdir || netbox_icinga_subdir, "#{name}.conf")
      end

      # True for physical hosts, based on the type-specific `netbox_host_type`.
      def netbox_physical?
        netbox_host_type == "physical"
      end

      # True for virtual hosts, based on the type-specific `netbox_host_type`.
      def netbox_virtual?
        netbox_host_type == "virtual"
      end

      # True when the object's Netbox status is `active`, treated as powered on.
      # A null status counts as not powered on, so the object is filtered out;
      # `netbox_status_known?` tells that case apart from an explicit non-active
      # status, which is what the filters warn about.
      def netbox_powered_on?
        status.try(&.value) == "active"
      end

      # False when Netbox holds no status for the object at all. Distinguishes a
      # missing value (a data problem worth reporting) from a deliberate
      # non-active status.
      def netbox_status_known?
        !status.nil?
      end

      # False when Netbox holds no platform for the object, in which case
      # `netbox_os_name` falls back to `"unknown"` and no OS-family check can
      # match.
      def netbox_platform_known?
        !platform.nil?
      end
    end
  end
end
