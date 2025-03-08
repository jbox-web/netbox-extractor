module NetboxExtractor
  # :nodoc:
  module Presenters
    class IcingaHost < Base
      include IcingaChecksConfig

      Log = ::Log.for("netbox-extractor.icinga_host")

      @icinga_dest_file : Path
      @ansible_facts : Hash(String, JSON::Any)?

      def initialize(@site, @host)
        super
        @icinga_dest_file = @host.icinga_dest_file(@site)
        @ansible_facts = @host.ansible_facts(@site)
      end

      def save!
        load_template_locals!

        data = render_icinga_config(@template_locals)
        write_file(@icinga_dest_file, data)

        Log.debug { "[#{@site.id}] Icinga config file generated: #{@icinga_dest_file}" }
      end

      private def render_icinga_config(template_locals)
        unless file = NetboxExtractor::Controllers::TemplatesManager.get?("icinga/#{@host.netbox_role}.j2")
          file = NetboxExtractor::Controllers::TemplatesManager.get("icinga/generic-host.j2")
        end

        template = file.gets_to_end
        NetboxExtractor::Utils.render_template(template, template_locals)
      end

      private def write_file(file, data)
        dirname = File.dirname(file)
        FileUtils.mkdir_p dirname unless Dir.exists?(dirname)

        File.open(file, "w") do |f|
          f.puts data
        end
      end
    end
  end
end
