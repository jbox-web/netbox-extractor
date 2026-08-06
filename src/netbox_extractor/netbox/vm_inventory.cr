require "./concerns/*"

module NetboxExtractor
  module Netbox
    # Loads the site's virtual machines from Netbox and exposes them filtered by
    # role, OS, and the shared host filters (`InventoryFilters`).
    class VmInventory
      include NetboxExtractor::Netbox::InventoryMacros
      include NetboxExtractor::Netbox::InventoryFilters

      Log = ::Log.for("netbox-extractor.vm_inventory")

      # Binds the inventory to a site and Netbox client; the client defaults to
      # the shared `NetboxExtractor.client` but is injectable for testing.
      def initialize(@site : NetboxExtractor::Config::Site, @client : NetboxClient::Client = NetboxExtractor.client)
        Log.context.set site: @site.id

        @vms = [] of NetboxClient::VirtualMachineWithConfigContext
      end

      # Fetches every VM for the site into memory; re-raises on load failure.
      def load!
        load_vms
      end

      # Returns the loaded VMs matching `role` and `os`, after applying the shared
      # host filters (name safety, include/exclude lists, powered-on).
      def fetch_vms(role, os)
        filter_objects @vms.select(&.netbox_has_role?(role)).select { |vm| object_matches_os?(vm, os) }
      end

      # Names of every loaded VM, unfiltered. Used to report config entries that
      # designate a host the site does not have.
      def object_names
        @vms.compact_map(&.name)
      end

      # Role slugs carried by the loaded VMs. Used to report a configured role
      # that no object carries.
      def object_roles
        @vms.compact_map(&.netbox_role)
      end

      # Platform slugs carried by the loaded VMs, for reporting slugs the OS
      # detection cannot classify unambiguously.
      def object_platforms
        @vms.select(&.netbox_platform_known?).map(&.netbox_os_name)
      end

      # Names of loaded VMs Netbox holds no platform for. These match no OS
      # family, so they are absent from every output.
      def objects_without_platform
        @vms.reject(&.netbox_platform_known?).compact_map(&.name)
      end

      define_netbox_load name: :vms,
        klass: NetboxClient::VirtualMachineWithConfigContext,
        method: "fetch_virtualization_virtual_machines_list",
        ivar: "@vms",
        log: "Loaded vms"

      private def fetch_virtualization_virtual_machines_list(limit, offset)
        @client.virtualization.virtual_machines.list(limit: limit, offset: offset, site: [@site.id])
      end
    end
  end
end
