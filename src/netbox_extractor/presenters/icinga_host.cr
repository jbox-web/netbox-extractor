require "./concerns/*"

module NetboxExtractor
  module Presenters
    class IcingaHost
      include Templatable
      include WithCustomConfig
      include IcingaHelper

      Log = ::Log.for("netbox-extractor.icinga_host")

      @template : String
      @icinga_filename : Path
      @site : NetboxExtractor::Config::Site
      @host : NetboxClient::DeviceWithConfigContext | NetboxClient::VirtualMachineWithConfigContext
      @ansible_facts : Hash(String, JSON::Any)?

      def initialize(@site, @host)
        super()

        @template = (get_template?("icinga/#{@host.netbox_role}.j2") || get_template("icinga/generic-host.j2")).gets_to_end
        @icinga_filename = @site.icinga_zones_path.join(@host.netbox_icinga_filename)
        @ansible_facts = fetch_ansible_facts(@site, @host)
      end
    end
  end
end
