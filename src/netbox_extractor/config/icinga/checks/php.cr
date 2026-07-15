module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_php:` under a host's `checks_config` entry: the expected
        # PHP version to verify.
        class Php
          include YAML::Serializable

          property version : String

          # String-keyed hash of this check's parameters for template rendering.
          def to_h
            {"version" => version}
          end
        end
      end
    end
  end
end
