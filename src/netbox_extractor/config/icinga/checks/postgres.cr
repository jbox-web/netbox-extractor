module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Postgres
          include YAML::Serializable

          class Instance
            include YAML::Serializable

            property name : String
            property version : Int32
            property port : Int32
            property dbname : String

            def to_h
              {
                "name"    => name,
                "version" => version,
                "port"    => port,
                "dbname"  => dbname,
              }
            end
          end

          property username : String
          property password : String
          property instances : Array(Instance)

          def to_h
            {
              "username"  => username,
              "password"  => password,
              "instances" => instances.map(&.to_h),
            }
          end
        end
      end
    end
  end
end
