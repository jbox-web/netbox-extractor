module NetboxExtractor
  module Patches
    module NetboxClient
      def netbox_role
        role.try &.slug
      end

      def has_role?(role)
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

      def check_by_snmp?
        netbox_tags.try &.includes?("check-by-snmp")
      end

      def check_by_ping?
        netbox_tags.try &.includes?("check-only-ping")
      end

      def netbox_os_name
        platform.try &.slug || "unknown"
      end

      def linux?
        netbox_os_name.includes?("linux") || netbox_os_name.includes?("debian") || netbox_os_name.includes?("ubuntu") || netbox_os_name.includes?("vmkernel") || netbox_os_name.includes?("vmware")
      end

      def windows?
        netbox_os_name.includes?("microsoft-windows") || netbox_os_name.includes?("windows")
      end

      def is_os?(os) # ameba:disable Naming/PredicateName
        case os
        when "linux"
          linux?
        when "windows"
          windows?
        else
          false
        end
      end

      def physical?
        netbox_host_type == "physical"
      end

      def virtual?
        netbox_host_type == "virtual"
      end

      def powered_on?
        status.try &.value == "active"
      end

      def ansible_facts_file(site)
        NetboxExtractor.config.ansible.fetch_facts.cache_path.join("#{site.id}.#{name}")
      end

      def ansible_facts(site)
        return nil unless File.exists?(ansible_facts_file(site))

        JSON.parse(File.read(ansible_facts_file(site))).as_h
      end
    end
  end
end
