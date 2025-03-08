module NetboxExtractor
  # :nodoc:
  module Config
    module Icinga
      class Site
        include YAML::Serializable

        property nagios_username : String
        property nagios_password : String
        property checks_config : Array(SiteCheckConfig) = [] of SiteCheckConfig
        property check_vhosts : Array(SiteCheckVhosts) = [] of SiteCheckVhosts
      end
    end
  end
end
