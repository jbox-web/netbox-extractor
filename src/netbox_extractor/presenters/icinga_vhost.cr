module NetboxExtractor
  # :nodoc:
  module Presenters
    class IcingaVhost
      Log = ::Log.for("netbox-extractor.icinga_vhost")

      @host : NetboxExtractor::Config::Icinga::SiteCheckVhosts::Vhost
      @subdir : String
      @template : String
      @icinga_dest_file : Path

      alias TemplateLocals = NetboxExtractor::RecursiveHash

      def initialize(@site : NetboxExtractor::Config::Site, @host, @subdir)
        @template = NetboxExtractor::Controllers::TemplatesManager.get("icinga/generic-vhost.j2").gets_to_end
        @template_locals = TemplateLocals.new
        @icinga_dest_file = @host.icinga_dest_file(@site, @subdir)
      end

      def save!
        @template_locals.merge!(@host.to_h, {"icinga_zone" => @site.id, "subdir" => @subdir})

        data = render_icinga_config(@template, @template_locals)
        write_file(@icinga_dest_file, data)

        Log.debug { "[#{@site.id}] Icinga config file generated: #{@icinga_dest_file}" }
      end

      private def render_icinga_config(template, template_locals)
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
