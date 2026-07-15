module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_esx:` under a host's `checks_config` entry: credentials
        # for the VMware ESX/vSphere check.
        class Esx
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
