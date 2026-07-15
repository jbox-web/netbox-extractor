module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_netapp:` under a host's `checks_config` entry: NetApp
        # storage check covering volume usage, optional aggregate thresholds, and
        # optional REST API access.
        class Netapp
          include YAML::Serializable

          # Warning/critical usage thresholds (percentage strings) for NetApp
          # aggregates, under `check_netapp.aggregates:`.
          class Aggregates
            include YAML::Serializable

            property warning : String = "80%"
            property critical : String = "85%"
          end

          # Connection details for the NetApp REST API, under
          # `check_netapp.check_api:`.
          class CheckApi
            include YAML::Serializable

            property base_url : String
            property username : String
            property password : String
          end

          property volumes : Array(String)
          property exclude_checks : Array(String) = [] of String
          property aggregates : Aggregates?
          property check_api : CheckApi?

          # String-keyed hash of this check's parameters for template rendering.
          # Nested `aggregates` and `check_api` are only included when configured.
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
