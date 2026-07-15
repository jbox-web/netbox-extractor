module NetboxExtractor
  module Controllers
    module Icinga
      Log = ::Log.for("netbox-extractor.icinga")

      # `"all"` is a reserved site selector meaning "every configured site"; a
      # site whose id is literally "all" can therefore not be selected alone (D4).
      def self.generate_icinga_inventories(nbe_site)
        if nbe_site == "all"
          NetboxExtractor::Concurrency.each_isolated(NetboxExtractor.config.sites, "Icinga generation") do |site|
            generate_icinga_inventory(site)
          end
        else
          if site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
            generate_icinga_inventory(site)
          else
            raise "Unknown site: #{nbe_site}"
          end
        end
      end

      def self.generate_icinga_inventory(site)
        NetboxExtractor::Generators::Icinga.run(site)
      end
    end
  end
end
