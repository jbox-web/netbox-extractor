module NetboxExtractor
  module Controllers
    module Ansible
      Log = ::Log.for("netbox-extractor.ansible")

      def self.generate_ansible_inventories(nbe_site)
        if nbe_site == "all"
          WaitGroup.wait do |wg|
            NetboxExtractor.config.sites.each do |site|
              wg.spawn { generate_ansible_inventory(site) }
            end
          end
        else
          if site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
            generate_ansible_inventory(site)
          else
            Log.error { "Unknown site: #{nbe_site}" }
          end
        end
      end

      def self.fetch_ansible_facts(nbe_site)
        if nbe_site == "all"
          WaitGroup.wait do |wg|
            NetboxExtractor.config.sites.each do |site|
              wg.spawn { fetch_ansible_fact(site) }
            end
          end
        else
          if site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
            fetch_ansible_fact(site)
          else
            Log.error { "Unknown site: #{nbe_site}" }
          end
        end
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
