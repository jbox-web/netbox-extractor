module NetboxExtractor
  module Config
    module Icinga
      class Global
        include YAML::Serializable

        property zones_dir : String = "./generated/icinga2/zones.d"

        def zones_path
          Path.new(File.expand_path(zones_dir))
        end
      end
    end
  end
end
