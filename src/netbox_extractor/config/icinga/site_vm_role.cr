module NetboxExtractor
  module Config
    module Icinga
      # One entry of `icinga.include_vm_roles:`: a Netbox VM role to generate
      # Icinga2 host objects for. `os` selects OS-specific check handling and
      # `filename` overrides the generated file name, defaulting to `name`.
      class SiteVmRole
        include YAML::Serializable

        property name : String
        property os : String
        property filename : String?
      end
    end
  end
end
