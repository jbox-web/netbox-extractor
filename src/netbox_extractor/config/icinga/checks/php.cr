module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Php
          include YAML::Serializable

          property version : String

          def to_h
            {"version" => version}
          end
        end
      end
    end
  end
end
