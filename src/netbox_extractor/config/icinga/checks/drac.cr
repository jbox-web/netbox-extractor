module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_drac:` under a host's `checks_config` entry: parameters
        # for the Dell DRAC hardware check, listing sub-checks to skip.
        class Drac
          include YAML::Serializable

          property exclude_checks : Array(String) = [] of String

          # String-keyed hash of this check's parameters for template rendering.
          def to_h
            {"exclude_checks" => exclude_checks}
          end
        end
      end
    end
  end
end
