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
        filter_objects @vms.select(&.netbox_has_role?(role)).select(&.netbox_is_os?(os))
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
