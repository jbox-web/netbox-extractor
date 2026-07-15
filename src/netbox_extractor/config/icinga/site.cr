module NetboxExtractor
  module Config
    module Icinga
      # Maps to the `icinga:` block of a site config: the Icinga2 monitoring
      # definition for a site — which device/VM roles to monitor, per-host check
      # tuning (`checks_config`), HTTP vhost checks, and standalone custom hosts.
      class Site
        include YAML::Serializable

        # One entry of `icinga.check_custom_hosts:`: a host not derived from
        # Netbox, monitored explicitly by IP with the given `check_type`.
        class CustomHost
          include YAML::Serializable

          property host : String
          property ip : String
          property check_type : String

          # Flat string hash of this host's fields, for template rendering.
          def to_h
            {
              "host"       => host,
              "ip"         => ip,
              "check_type" => check_type,
            }
          end

          # Destination `.conf` path for this custom host within `site`'s zone
          # directory, under a `custom-hosts/` subfolder.
          def icinga_dest_file(site)
            site.icinga_zones_path.join("custom-hosts", "#{host}.conf")
          end
        end

        property include_device_roles : Array(SiteDeviceRole) = [] of SiteDeviceRole
        property include_vm_roles : Array(SiteVmRole) = [] of SiteVmRole
        property checks_config : Array(SiteCheckConfig) = [] of SiteCheckConfig
        property check_vhosts : Array(SiteCheckVhosts) = [] of SiteCheckVhosts
        property check_custom_hosts : Array(CustomHost) = [] of CustomHost
      end
    end
  end
end
