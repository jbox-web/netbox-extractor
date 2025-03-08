module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Mysql
          include YAML::Serializable

          property username : String
          property password : String
          property check_slave : Bool? = false

          def to_h
            {
              "username"    => username,
              "password"    => password,
              "check_slave" => check_slave,
            }
          end
        end
      end
    end
  end
end
