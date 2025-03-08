require "./concerns/*"

module NetboxExtractor
  module Presenters
    class IcingaCustomHost
      include Templatable

      Log = ::Log.for("netbox-extractor.icinga_custom_host")

      @template : String
      @icinga_filename : Path
      @site : NetboxExtractor::Config::Site
      @host : NetboxExtractor::Config::Icinga::Site::CustomHost

      def initialize(@site, @host)
        super()

        @template = load_template("icinga/custom-host.j2")
        @icinga_filename = @host.icinga_dest_file(@site)
      end

      private def load_template_locals!
        @template_locals.merge!(@host.to_h, {"icinga_zone" => @site.id})
      end
    end
  end
end
