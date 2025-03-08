module NetboxExtractor
  module Config
    module Ansible
      class SiteDeviceRole
        include YAML::Serializable

        property name : String
        property filename : String?
      end
    end
  end
end
