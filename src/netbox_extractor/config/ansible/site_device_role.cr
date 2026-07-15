module NetboxExtractor
  module Config
    module Ansible
      # One entry of `ansible.include_device_roles:`: a Netbox device role to
      # include in the site's Ansible inventory. `filename` overrides the
      # inventory file name, defaulting to `name`.
      class SiteDeviceRole
        include YAML::Serializable

        property name : String
        property filename : String?
      end
    end
  end
end
