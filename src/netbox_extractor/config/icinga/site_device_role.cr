module NetboxExtractor
  module Config
    module Icinga
      class SiteDeviceRole
        include YAML::Serializable

        property name : String
        property filename : String?
      end
    end
  end
end
