module NetboxExtractor
  module Config
    module Ansible
      # One entry of `ansible.include_vm_roles:`: a Netbox VM role to include in
      # the site's Ansible inventory. `os` selects the target OS handling and
      # `filename` overrides the inventory file name, defaulting to `name`.
      class SiteVmRole
        include YAML::Serializable

        property name : String
        property os : String
        property filename : String?
      end
    end
  end
end
