module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_mysql:` under a host's `checks_config` entry: credentials
        # for the MySQL check, with `check_slave` enabling replication monitoring.
        class Mysql
          include YAML::Serializable

          property username : String
          property password : String
          property? check_slave : Bool = false

          # String-keyed hash of this check's parameters for template rendering.
          def to_h
            {
              "username"    => username,
              "password"    => password,
              "check_slave" => check_slave?,
            }
          end
        end
      end
    end
  end
end
