module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Netapp
          include YAML::Serializable

          class Aggregates
            include YAML::Serializable

            property warning : String = "80%"
            property critical : String = "85%"
          end

          class CheckApi
            include YAML::Serializable

            property base_url : String
            property username : String
            property password : String
          end

          property volumes : Array(String)
          property exclude_checks : Array(String)
          property aggregates : Aggregates?
          property check_api : CheckApi?

          def to_h
            hash = {
              "volumes"        => volumes,
              "exclude_checks" => exclude_checks,
            }

            if aggr = aggregates
              hash = hash.merge({
                "aggregates" => {
                  "warning"  => aggr.warning,
                  "critical" => aggr.critical,
                },
              })
            end

            if check = check_api
              hash = hash.merge({
                "check_api" => {
                  "base_url" => check.base_url,
                  "username" => check.username,
                  "password" => check.password,
                },
              })
            end

            hash
          end
        end
      end
    end
  end
end
