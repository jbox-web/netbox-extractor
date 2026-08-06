module NetboxExtractor
  module Config
    module Icinga
      # One entry of `icinga.include_device_roles:`: a Netbox device role to
      # generate Icinga2 host objects for. `filename` overrides the output
      # subdirectory holding this role's `<host>.conf` files, which otherwise
      # defaults to the role slug.
      class SiteDeviceRole
        include YAML::Serializable

        property name : String
        property filename : String?
      end
    end
  end
end
