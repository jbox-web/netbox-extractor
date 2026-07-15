module NetboxExtractor
  module Controllers
    # Orchestrates Icinga2 configuration generation per site. A `site` of `"all"`
    # fans out over every configured site with per-fiber failure isolation.
    module Icinga
      Log = ::Log.for("netbox-extractor.icinga")

      # Generates Icinga2 config for the selected site, or for every configured
      # site (isolated per fiber) when `nbe_site` is `"all"`. Raises when a
      # specific, non-`"all"` site id is unknown.
      #
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

      # Generates the Icinga2 config for a single `site` by delegating to
      # `NetboxExtractor::Generators::Icinga`.
      def self.generate_icinga_inventory(site)
        NetboxExtractor::Generators::Icinga.run(site)
      end
    end
  end
end
