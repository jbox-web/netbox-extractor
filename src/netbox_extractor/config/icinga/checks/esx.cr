module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Esx
          include YAML::Serializable

          property username : String
          property password : String

          def to_h
            {
              "username" => username,
              "password" => password,
            }
          end
        end
      end
    end
  end
end
