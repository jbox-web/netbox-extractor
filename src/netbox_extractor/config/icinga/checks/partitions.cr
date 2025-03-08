module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Partitions
          include YAML::Serializable

          property exclude_volumes : Array(String)

          def to_h
            {"exclude_volumes" => exclude_volumes}
          end
        end
      end
    end
  end
end
