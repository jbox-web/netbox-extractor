module NetboxExtractor
  module Controllers
    module Icinga
      Log = ::Log.for("netbox-extractor.icinga")

      def self.generate_icinga_inventories(nbe_site)
        if nbe_site == "all"
          WaitGroup.wait do |wg|
            NetboxExtractor.config.sites.each do |site|
              wg.spawn { generate_icinga_inventory(site) }
            end
          end
        else
          if site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
            generate_icinga_inventory(site)
          else
            Log.error { "Unknown site: #{nbe_site}" }
          end
        end
      end

      def self.generate_icinga_inventory(site)
        NetboxExtractor::Generators::Icinga.run(site)
      end
    end
  end
end
