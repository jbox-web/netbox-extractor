module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class NFS
          include YAML::Serializable

          property mountpoints : Array(String)

          def to_h
            {"mountpoints" => mountpoints}
          end
        end
      end
    end
  end
end
