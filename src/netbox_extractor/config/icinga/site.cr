module NetboxExtractor
  module Config
    module Icinga
      class Site
        include YAML::Serializable

        class CustomHost
          include YAML::Serializable

          property host : String
          property ip : String
          property check_type : String

          def to_h
            {
              "host"       => host,
              "ip"         => ip,
              "check_type" => check_type,
            }
          end

          def icinga_dest_file(site)
            site.icinga_zones_path.join("custom-hosts", "#{host}.conf")
          end
        end

        property nagios_username : String
        property nagios_password : String
        property include_device_roles : Array(SiteDeviceRole) = [] of SiteDeviceRole
        property include_vm_roles : Array(SiteVmRole) = [] of SiteVmRole
        property checks_config : Array(SiteCheckConfig) = [] of SiteCheckConfig
        property check_vhosts : Array(SiteCheckVhosts) = [] of SiteCheckVhosts
        property check_custom_hosts : Array(CustomHost) = [] of CustomHost
      end
    end
  end
end
