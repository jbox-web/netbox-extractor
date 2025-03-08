module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Drac
          include YAML::Serializable

          property exclude_checks : Array(String)

          def to_h
            {"exclude_checks" => exclude_checks}
          end
        end
      end
    end
  end
end
