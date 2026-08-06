module NetboxExtractor
  module Config
    # Top-level configuration deserialized from `netbox-extractor.yml`. Holds the
    # global `logger`/`netbox`/`ansible`/`icinga` settings plus the per-site
    # configs, which may be inlined under `sites:` or loaded from external files
    # listed in `sites_config:`.
    class Base
      include YAML::Serializable

      property logger : Logger
      property netbox : Netbox
      property ansible : Ansible::Global
      property icinga : Icinga::Global = Icinga::Global.from_yaml("")
      property sites : Array(Site) = [] of Site
      property sites_config : Array(String) = [] of String

      # Loads each external site file referenced by `sites_config:` and appends
      # the parsed `Site` to `sites`. Raises `ValidationError` if a referenced
      # file is missing.
      def after_initialize
        @sites_config.each do |config_file|
          file = File.expand_path(config_file)
          raise ValidationError.new("sites_config file not found: #{config_file}") unless File.exists?(file)

          site = Site.from_yaml(File.read(file))
          # The path as written, not the expanded one: it is meant to be read
          # back by whoever has to edit the file.
          site.source_path = config_file
          @sites << site
        end
      end

      # Attributes the sites declared inline to the file they were read from.
      # Sites pulled in from `sites_config:` already know their own file, so
      # they are left alone.
      def source_path=(path : String)
        @sites.each { |site| site.source_path ||= path }
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
