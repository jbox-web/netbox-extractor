module NetboxExtractor
  module Controllers
    module Bind
      Log = ::Log.for("netbox-extractor.bind")

      def self.generate_bind_zones
        NetboxExtractor::Generators::Bind.run
      end
    end
  end
end
