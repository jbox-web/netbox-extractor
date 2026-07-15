module NetboxExtractor
  module Config
    class Base
      include YAML::Serializable

      property logger : Logger
      property netbox : Netbox
      property ansible : Ansible::Global
      property icinga : Icinga::Global = Icinga::Global.from_yaml("")
      property sites : Array(Site) = [] of Site
      property sites_config : Array(String) = [] of String

      def after_initialize
        @sites_config.each do |config_file|
          file = File.expand_path(config_file)
          if File.exists?(file)
            @sites << Site.from_yaml(File.read(file))
          end
        end
      end

      # Fails fast on configurations that would make concurrent generation
      # clobber output: sites sharing an id resolve to the same zones/inventory
      # directory, and roles sharing a filename overwrite each other's file.
      def validate!
        validate_unique_site_ids!
        sites.each(&.validate!)
      end

      private def validate_unique_site_ids!
        ids = sites.map(&.id)
        dupes = ids.select { |id| ids.count(id) > 1 }.uniq!
        return if dupes.empty?

        raise ValidationError.new("Duplicate site id(s): #{dupes.join(", ")}")
      end
    end
  end
end
