module NetboxExtractor
  module Patches
    module NetboxClient
      def netbox_role
        role.try &.slug
      end

      def netbox_has_role?(role)
        netbox_role == role
      end

      def netbox_primary_ip
        primary_ip.try &.address.split("/").first || name
      end

      def netbox_tags
        netbox_tags = tags.try &.map(&.slug)
        role_slug = netbox_role

        if netbox_tags
          netbox_tags.push(role_slug) if role_slug
          netbox_tags.reject!(&.starts_with?("source-"))
        end
        netbox_tags.try &.sort
      end

      def netbox_check_by_snmp?
        netbox_tags.try &.includes?("check-by-snmp")
      end

      def netbox_check_by_ping?
        netbox_tags.try &.includes?("check-only-ping")
      end

      def netbox_os_name
        platform.try &.slug || "unknown"
      end

      def netbox_linux?
        netbox_os_name.includes?("linux") || netbox_os_name.includes?("debian") || netbox_os_name.includes?("ubuntu") || netbox_os_name.includes?("vmkernel") || netbox_os_name.includes?("vmware")
      end

      def netbox_windows?
        netbox_os_name.includes?("microsoft-windows") || netbox_os_name.includes?("windows")
      end

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

      def netbox_os_family
        return "linux" if netbox_linux?
        return "windows" if netbox_windows?

        netbox_os_name
      end

      def netbox_physical?
        netbox_host_type == "physical"
      end

      def netbox_virtual?
        netbox_host_type == "virtual"
      end

      def netbox_powered_on?
        status.try &.value == "active"
      end
    end
  end
end
