module NetboxExtractor
  module Config
    module Ansible
      # Maps to the `ansible:` block of a site config: which device and VM roles
      # to emit as Ansible inventories for this site, plus the site-level
      # fact-fetching overrides.
      class Site
        include YAML::Serializable

        property include_device_roles : Array(SiteDeviceRole) = [] of SiteDeviceRole
        property include_vm_roles : Array(SiteVmRole) = [] of SiteVmRole
        property fetch_facts : SiteFetchFacts
      end
    end
  end
end
