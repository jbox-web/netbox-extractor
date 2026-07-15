module NetboxExtractor
  module Patches
    # Domain helpers mixed into both device and VM Netbox types (`netbox_*`
    # methods) covering roles, tags, OS detection and power state. Type-specific
    # behavior (physical vs. virtual, SNMP forcing) lives in `netbox_device.cr`
    # and `netbox_vm.cr`.
    module NetboxClient
      # Role slug of the object, or `nil` when it has no assigned role.
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
      # role slug, with any `source-*` provenance tags stripped out. Returns
      # `nil` when the object has no tags.
      def netbox_tags
        netbox_tags = tags.try &.map(&.slug)
        role_slug = netbox_role

        if netbox_tags
          netbox_tags.push(role_slug) if role_slug
          netbox_tags.reject!(&.starts_with?("source-"))
        end
        netbox_tags.try &.sort
      end

      # True when the object carries the `check-by-snmp` tag, requesting SNMP
      # monitoring. Devices override this to also force SNMP for storage/network
      # roles.
      def netbox_check_by_snmp?
        netbox_tags.try &.includes?("check-by-snmp")
      end

      # True when the object carries the `check-only-ping` tag, restricting
      # monitoring to a ping check.
      def netbox_check_by_ping?
        netbox_tags.try &.includes?("check-only-ping")
      end

      # Platform slug from Netbox (e.g. `debian-12`), or `"unknown"` when no
      # platform is assigned. Basis for all OS detection helpers.
      def netbox_os_name
        platform.try &.slug || "unknown"
      end

      # True when the platform slug indicates a Linux-family OS (including
      # Debian/Ubuntu and VMware ESXi/vmkernel).
      def netbox_linux?
        netbox_os_name.includes?("linux") || netbox_os_name.includes?("debian") || netbox_os_name.includes?("ubuntu") || netbox_os_name.includes?("vmkernel") || netbox_os_name.includes?("vmware")
      end

      # True when the platform slug indicates a Windows OS.
      def netbox_windows?
        netbox_os_name.includes?("microsoft-windows") || netbox_os_name.includes?("windows")
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

      # True for physical hosts, based on the type-specific `netbox_host_type`.
      def netbox_physical?
        netbox_host_type == "physical"
      end

      # True for virtual hosts, based on the type-specific `netbox_host_type`.
      def netbox_virtual?
        netbox_host_type == "virtual"
      end

      # True when the object's Netbox status is `active`, treated as powered on.
      def netbox_powered_on?
        status.try(&.value) == "active"
      end
    end
  end
end
