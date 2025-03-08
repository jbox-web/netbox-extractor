module NetboxExtractor
  module Generators
    class Bind
      Log = ::Log.for("netbox-extractor.bind")

      def self.run
        ipam_inventory = NetboxExtractor::Netbox::IpamInventory.new
        inventory_generator = new(ipam_inventory)
        inventory_generator.run
      end

      def initialize(@ipam_inventory : NetboxExtractor::Netbox::IpamInventory)
      end

      def run
        @ipam_inventory.load!
        generate_files
      end

      private def generate_files
        ips = @ipam_inventory.fetch_ips.map(&.display)
        puts YAML.dump(ips)
      end
    end
  end
end
