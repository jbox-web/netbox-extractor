module NetboxExtractor
  module Config
    module Icinga
      # One entry of `icinga.include_device_roles:`: a Netbox device role to
      # generate Icinga2 host objects for. `filename` overrides the generated
      # file name, defaulting to `name`.
      class SiteDeviceRole
        include YAML::Serializable

        property name : String
        property filename : String?
      end
    end
  end
end
