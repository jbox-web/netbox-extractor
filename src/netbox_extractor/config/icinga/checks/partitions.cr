module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_partitions:` under a host's `checks_config` entry: disk
        # partition check, listing volumes to exclude from monitoring.
        class Partitions
          include YAML::Serializable

          property exclude_volumes : Array(String) = [] of String

          # String-keyed hash of this check's parameters for template rendering.
          def to_h
            {"exclude_volumes" => exclude_volumes}
          end
        end
      end
    end
  end
end
