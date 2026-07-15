module NetboxExtractor
  module Controllers
    # Orchestrates Bind DNS zone file generation. Unlike the Ansible and Icinga
    # controllers, zone generation is not site-scoped and runs across all data
    # in a single pass.
    module Bind
      Log = ::Log.for("netbox-extractor.bind")

      # Generates the Bind DNS zone files by delegating to
      # `NetboxExtractor::Generators::Bind`.
      def self.generate_bind_zones
        NetboxExtractor::Generators::Bind.run
      end
    end
  end
end
