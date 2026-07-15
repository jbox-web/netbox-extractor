require "./concerns/*"

module NetboxExtractor
  module Presenters
    # Renders the Icinga host object for a Netbox device or VM.
    # Selects a role-specific template (`icinga/<role>.j2`) when one exists,
    # falling back to `icinga/generic-host.j2`, and enriches the output with
    # cached Ansible facts loaded from the facts cache. Combines `Templatable`,
    # `WithCustomConfig`, and `IcingaHelper`.
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

      # Binds the presenter to its site and Netbox host, resolving the role-based
      # or generic template, the output path, and any cached Ansible facts.
      def initialize(@site, @host)
        super()

        @template = (get_template?("icinga/#{@host.netbox_role}.j2") || get_template("icinga/generic-host.j2")).gets_to_end
        @icinga_filename = @site.icinga_zones_path.join(@host.netbox_icinga_filename)
        @ansible_facts = fetch_ansible_facts(@site, @host)
      end
    end
  end
end
