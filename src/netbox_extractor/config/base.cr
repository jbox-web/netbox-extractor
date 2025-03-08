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
    end
  end
end
