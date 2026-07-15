module NetboxExtractor
  module Controllers
    module Ansible
      Log = ::Log.for("netbox-extractor.ansible")

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
