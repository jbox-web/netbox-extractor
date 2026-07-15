require "./concerns/*"

module NetboxExtractor
  module Netbox
    class VmInventory
      include NetboxExtractor::Netbox::InventoryMacros
      include NetboxExtractor::Netbox::InventoryFilters

      Log = ::Log.for("netbox-extractor.vm_inventory")

      def initialize(@site : NetboxExtractor::Config::Site, @client : NetboxClient::Client = NetboxExtractor.client)
        Log.context.set site: @site.id

        @vms = [] of NetboxClient::VirtualMachineWithConfigContext
      end

      def load!
        load_vms
      end

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
