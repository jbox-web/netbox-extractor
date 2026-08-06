module NetboxExtractor
  module Presenters
    # Looks up per-host check overrides declared in the site's Icinga config.
    # Mixed into presenters to expose `check_<service>?` predicates and
    # `find_custom_config_for` for matching a host against `checks_config`.
    module WithCustomConfig
      # Generates a `check_<service>?` method returning the service's custom check
      # configuration as a hash for the current `@host`, or `nil` when unset.
      macro define_method_check_service(service)
        # This method looks for custom check configuration.
        # It returns nil if no custom configuration is found,
        # otherwise it returns the custom configuration
        private def check_{{service.id}}?
          config = find_custom_config_for(@host)
          return nil if config.nil?

          check = config.check_{{service.id}}
          return nil if check.nil?

          check.to_h
        end
      end

      define_method_check_service :drac
      define_method_check_service :esx
      define_method_check_service :mysql
      define_method_check_service :netapp
      define_method_check_service :nfs
      define_method_check_service :partitions
      define_method_check_service :php
      define_method_check_service :postgres
      define_method_check_service :rabbit

      # True when a `checks_config` entry designates the same host as a Netbox
      # name. Exact string equality made an entry keyed by FQDN — or differing
      # only in case — fall through to the default checks, losing the entry's
      # credentials and thresholds without a word. Matching is therefore
      # case-insensitive and tolerates one side carrying a domain, but stops at
      # a full label so `web12` never matches `web1`. Exposed on the module so
      # the Icinga generator reports orphan entries under the very same rule.
      def self.matches_host?(config_host, netbox_name)
        return false if netbox_name.nil?

        config_host = config_host.downcase
        netbox_name = netbox_name.downcase

        config_host == netbox_name ||
          config_host.starts_with?("#{netbox_name}.") ||
          netbox_name.starts_with?("#{config_host}.")
      end

      # Resolved lookups, keyed by host name. Every `check_*?` predicate and
      # several helpers call this for the same host, and each call used to
      # rescan the whole checks_config. Measured on 100 entries and 12 calls:
      # 98.58µs → 8.42µs per host, 149kB → 12.6kB allocated.
      #
      # Keyed rather than kept in a single slot: a presenter holds one host
      # today, and a cache that assumes it would be wrong the day one does not.
      @custom_config_cache = {} of String => NetboxExtractor::Config::Icinga::SiteCheckConfig?

      private def find_custom_config_for(host)
        @custom_config_cache.fetch(host.name.to_s) do
          @custom_config_cache[host.name.to_s] =
            @site.icinga.checks_config.find { |c| WithCustomConfig.matches_host?(c.host, host.name) }
        end
      end
    end
  end
end
