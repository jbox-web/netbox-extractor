require "./concerns/*"

module NetboxExtractor
  module Netbox
    # Loads every IPAM IP address from Netbox (not scoped to a site) and exposes
    # the raw list; unlike the device/VM inventories it applies no host filtering.
    class IpamInventory
      include NetboxExtractor::Netbox::InventoryMacros

      Log = ::Log.for("netbox-extractor.ipam_inventory")

      # Binds the inventory to a Netbox client; defaults to the shared
      # `NetboxExtractor.client` but is injectable for testing.
      def initialize(@client : NetboxClient::Client = NetboxExtractor.client)
        @ips = [] of NetboxClient::IPAddress
      end

      # Fetches all IP addresses into memory; re-raises on load failure.
      def load!
        load_ip_addresses
      end

      # Returns the loaded IP addresses as-is (no filtering applied).
      def fetch_ips
        @ips
      end

      define_netbox_load name: :ip_addresses,
        klass: NetboxClient::IPAddress,
        method: "fetch_ipam_ip_addresses_list",
        ivar: "@ips",
        log: "Loaded ip addresses"

      private def fetch_ipam_ip_addresses_list(limit, offset)
        @client.ipam.ip_addresses.list(limit: limit, offset: offset)
      end
    end
  end
end
