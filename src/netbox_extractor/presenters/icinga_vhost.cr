require "./concerns/*"

module NetboxExtractor
  module Presenters
    # Renders an Icinga virtual-host check from a `SiteCheckVhosts::Vhost` config
    # entry using the `icinga/generic-vhost.j2` template. Output is written under
    # the site's `custom-vhosts/<subdir>/` directory; locals carry the vhost
    # fields plus the site zone and `subdir`.
    class IcingaVhost
      include Templatable

      Log = ::Log.for("netbox-extractor.icinga_vhost")

      @template : String
      @icinga_filename : Path
      @site : NetboxExtractor::Config::Site
      @host : NetboxExtractor::Config::Icinga::SiteCheckVhosts::Vhost
      @subdir : String

      # Binds the presenter to its site, vhost config, and target `@subdir`,
      # loading the generic-vhost template and computing the destination file.
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
