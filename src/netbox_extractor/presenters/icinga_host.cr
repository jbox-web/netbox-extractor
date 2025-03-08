require "./concerns/*"

module NetboxExtractor
  module Presenters
    class IcingaHost
      include Templatable
      include WithCustomConfig
      include IcingaHelper

      Log = ::Log.for("netbox-extractor.icinga_host")

      @site : NetboxExtractor::Config::Site
      @host : NetboxClient::DeviceWithConfigContext | NetboxClient::VirtualMachineWithConfigContext
      @template : String
      @icinga_filename : Path
      @ansible_facts : Hash(String, JSON::Any)?

      def initialize(@site, @host)
        super()

        @template = (
          NetboxExtractor::Controllers::TemplatesManager.get?("icinga/#{@host.netbox_role}.j2") ||
          NetboxExtractor::Controllers::TemplatesManager.get("icinga/generic-host.j2")
        ).gets_to_end

        @icinga_filename = @site.icinga_zones_path.join(@host.netbox_icinga_filename)
        @ansible_facts = fetch_ansible_facts(@site, @host)
      end

      def save!
        load_template_locals!

        data = render_template(@template, @template_locals)
        write_file(@icinga_filename, data)

        Log.debug { "Icinga config file generated: #{@icinga_filename}" }
      end
    end
  end
end
