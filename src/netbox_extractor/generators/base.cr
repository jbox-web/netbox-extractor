module NetboxExtractor
  # :nodoc:
  module Generators
    class Base
      Log = ::Log.for(self)

      def self.run(site)
        inventory_loader = NetboxExtractor::InventoryLoader.new(site)
        inventory_generator = new(site, inventory_loader)
        inventory_generator.run
      end

      def initialize(@site : NetboxExtractor::Config::Site, @inventory_loader : NetboxExtractor::InventoryLoader)
      end

      def run
        @inventory_loader.load_inventory
        generate_files
      end
    end
  end
end
