module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_opensearch:` under a host's `checks_config` entry:
        # credentials for the OpenSearch check.
        class Opensearch
          include YAML::Serializable

          property username : String
          property password : String

          # String-keyed hash of this check's parameters for template rendering.
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
