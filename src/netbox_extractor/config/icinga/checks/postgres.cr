module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_postgres:` under a host's `checks_config` entry:
        # credentials plus the list of PostgreSQL instances to monitor.
        class Postgres
          include YAML::Serializable

          # One monitored PostgreSQL instance (an entry of
          # `check_postgres.instances:`), identifying its version, port, and DB.
          class Instance
            include YAML::Serializable

            property name : String
            property version : Int32
            property port : Int32
            property dbname : String

            # String-keyed hash of this instance's fields for template rendering.
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

          # String-keyed hash of this check's parameters for template rendering,
          # with each instance flattened via `Instance#to_h`.
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
