require "./concerns/*"

module NetboxExtractor
  module Netbox
    class IpamInventory
      include NetboxExtractor::Netbox::InventoryMacros

      Log = ::Log.for("netbox-extractor.ipam_inventory")

      def initialize
        @ips = [] of NetboxClient::IPAddress
      end

      def load!
        load_ip_addresses
      end

      def fetch_ips
        @ips
      end

      define_netbox_load name: :ip_addresses,
        klass: NetboxClient::IPAddress,
        method: "fetch_ipam_ip_addresses_list",
        ivar: "@ips",
        log: "Loaded ip addresses"

      private def fetch_ipam_ip_addresses_list(limit, offset)
        NetboxExtractor.client.ipam.ip_addresses.list(limit: limit, offset: offset)
      end
    end
  end
end
