module NetboxExtractor
  module Config
    module Icinga
      class SiteVmRole
        include YAML::Serializable

        property name : String
        property os : String
        property filename : String?
      end
    end
  end
end
