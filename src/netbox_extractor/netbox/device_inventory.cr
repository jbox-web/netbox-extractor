require "./concerns/*"

module NetboxExtractor
  module Netbox
    class DeviceInventory
      include NetboxExtractor::Netbox::InventoryMacros
      include NetboxExtractor::Netbox::InventoryFilters

      Log = ::Log.for("netbox-extractor.device_inventory")

      def initialize(@site : NetboxExtractor::Config::Site)
        Log.context.set site: @site.id

        @dcim_api = NetboxClient::DcimApi.new
        @devices = [] of NetboxClient::DeviceWithConfigContext
      end

      def load!
        load_devices
      end

      def fetch_devices(role)
        filter_objects @devices.select(&.netbox_has_role?(role))
      end

      define_netbox_load name: :devices,
        klass: NetboxClient::DeviceWithConfigContext,
        method: "fetch_dcim_devices_list",
        ivar: "@devices",
        log: "Loaded devices"

      private def fetch_dcim_devices_list(limit, offset)
        @dcim_api.dcim_devices_list(limit: limit, offset: offset, site: [@site.id])
      end
    end
  end
end
