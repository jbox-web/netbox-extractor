module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_nfs:` under a host's `checks_config` entry: the list of
        # NFS mountpoints to verify.
        class NFS
          include YAML::Serializable

          property mountpoints : Array(String)

          # String-keyed hash of this check's parameters for template rendering.
          def to_h
            {"mountpoints" => mountpoints}
          end
        end
      end
    end
  end
end
