module NetboxExtractor
  module Config
    module Ansible
      class SiteFetchFacts
        include YAML::Serializable

        property inventories : Array(String) = [] of String
        property exclude_tags : Array(String) = [] of String
        property fork_limit : Int32 = 30
      end
    end
  end
end
