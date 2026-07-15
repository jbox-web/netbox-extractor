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

      private def find_custom_config_for(host)
        @site.icinga.checks_config.find { |c| c.host == host.name }
      end
    end
  end
end
