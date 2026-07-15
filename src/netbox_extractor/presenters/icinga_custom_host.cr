require "./concerns/*"

module NetboxExtractor
  module Presenters
    # Renders a manually declared Icinga host from a `Config::Icinga::Site::CustomHost`
    # entry (not sourced from Netbox), via the `icinga/custom-host.j2` template.
    # Template locals come straight from the config host's fields plus the site zone.
    class IcingaCustomHost
      include Templatable

      Log = ::Log.for("netbox-extractor.icinga_custom_host")

      @template : String
      @icinga_filename : Path
      @site : NetboxExtractor::Config::Site
      @host : NetboxExtractor::Config::Icinga::Site::CustomHost

      # Binds the presenter to its site and custom-host config, loading the
      # custom-host template and resolving the destination file for the site.
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
