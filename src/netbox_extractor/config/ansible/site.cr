module NetboxExtractor
  module Config
    module Ansible
      class Site
        include YAML::Serializable

        property include_device_roles : Array(SiteDeviceRole) = [] of SiteDeviceRole
        property include_vm_roles : Array(SiteVmRole) = [] of SiteVmRole
        property fetch_facts : SiteFetchFacts
      end
    end
  end
end
