require "./concerns/*"

module NetboxExtractor
  module Presenters
    class IcingaVhost
      include Templatable

      Log = ::Log.for("netbox-extractor.icinga_vhost")

      @template : String
      @icinga_filename : Path
      @site : NetboxExtractor::Config::Site
      @host : NetboxExtractor::Config::Icinga::SiteCheckVhosts::Vhost
      @subdir : String

      def initialize(@site, @host, @subdir)
        super()

        @template = load_template("icinga/generic-vhost.j2")
        @icinga_filename = @site.icinga_zones_path.join("custom-vhosts", @subdir, @host.icinga_filename)
      end

      private def load_template_locals!
        @template_locals.merge!(@host.to_h, {"icinga_zone" => @site.id, "subdir" => @subdir})
      end
    end
  end
end
