module NetboxExtractor
  module Config
    module Icinga
      # Maps to the top-level `icinga:` block: global Icinga2 settings, currently
      # just the base directory under which per-site zone files are generated.
      class Global
        include YAML::Serializable

        property zones_dir : String = "./generated/icinga2/zones.d"

        # Absolute, expanded form of `zones_dir`.
        def zones_path
          Path.new(File.expand_path(zones_dir))
        end
      end
    end
  end
end
