module NetboxExtractor
  module Controllers
    # Orchestrates Ansible work per site: generating inventory YAML files and
    # gathering facts. A `site` of `"all"` fans out over every configured site
    # with per-fiber failure isolation.
    module Ansible
      Log = ::Log.for("netbox-extractor.ansible")

      # Generates Ansible inventory files for the selected site, or for every
      # configured site (isolated per fiber) when `nbe_site` is `"all"`. Raises
      # when a specific, non-`"all"` site id is unknown.
      #
      # `"all"` is a reserved site selector meaning "every configured site"; a
      # site whose id is literally "all" can therefore not be selected alone (D4).
      def self.generate_ansible_inventories(nbe_site)
        if nbe_site == "all"
          NetboxExtractor::Concurrency.each_isolated(NetboxExtractor.config.sites, "Ansible generation") do |site|
            generate_ansible_inventory(site)
          end
        else
          if site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
            generate_ansible_inventory(site)
          else
            raise "Unknown site: #{nbe_site}"
          end
        end
      end

      # Gathers Ansible facts for the selected site, or for every configured site
      # (isolated per fiber) when `nbe_site` is `"all"`. Wipes the shared fact
      # cache once up front, then delegates each site to
      # `NetboxExtractor::FactsFetcher::Ansible`. Raises on an unknown site id.
      def self.fetch_ansible_facts(nbe_site)
        # Wipe the shared fact cache once, before the per-site fan-out: doing it
        # inside each site's run would let concurrent sites erase each other's
        # freshly-written cache (K2).
        wipe_facts_cache!

        if nbe_site == "all"
          NetboxExtractor::Concurrency.each_isolated(NetboxExtractor.config.sites, "Ansible facts") do |site|
            fetch_ansible_fact(site)
          end
        else
          if site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
            fetch_ansible_fact(site)
          else
            raise "Unknown site: #{nbe_site}"
          end
        end
      end

      private def self.wipe_facts_cache!
        cache = NetboxExtractor.config.ansible.fetch_facts.cache_path
        FileUtils.rm_rf cache
        FileUtils.mkdir_p cache
      end

      private def self.generate_ansible_inventory(site)
        NetboxExtractor::Generators::Ansible.run(site)
      end

      private def self.fetch_ansible_fact(site)
        NetboxExtractor::FactsFetcher::Ansible.run(site)
      end
    end
  end
end
