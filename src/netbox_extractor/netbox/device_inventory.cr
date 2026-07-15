require "./concerns/*"

module NetboxExtractor
  module Netbox
    # Loads the site's DCIM devices from Netbox and exposes them filtered by role
    # and by the shared host filters (`InventoryFilters`).
    class DeviceInventory
      include NetboxExtractor::Netbox::InventoryMacros
      include NetboxExtractor::Netbox::InventoryFilters

      Log = ::Log.for("netbox-extractor.device_inventory")

      # Binds the inventory to a site and Netbox client; the client defaults to
      # the shared `NetboxExtractor.client` but is injectable for testing.
      def initialize(@site : NetboxExtractor::Config::Site, @client : NetboxClient::Client = NetboxExtractor.client)
        Log.context.set site: @site.id

        @devices = [] of NetboxClient::DeviceWithConfigContext
      end

      # Fetches every device for the site into memory; re-raises on load failure.
      def load!
        load_devices
      end

      # Returns the loaded devices having the given `role`, after applying the
      # shared host filters (name safety, include/exclude lists, powered-on).
      def fetch_devices(role)
        filter_objects @devices.select(&.netbox_has_role?(role))
      end

      define_netbox_load name: :devices,
        klass: NetboxClient::DeviceWithConfigContext,
        method: "fetch_dcim_devices_list",
        ivar: "@devices",
        log: "Loaded devices"

      private def fetch_dcim_devices_list(limit, offset)
        @client.dcim.devices.list(limit: limit, offset: offset, site: [@site.id])
      end
    end
  end
end
