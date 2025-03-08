module NetboxExtractor
  module Config
    module Ansible
      class SiteFetchFacts
        include YAML::Serializable

        property inventories : Array(String) = [] of String
        property exclude_tags : Array(String) = [] of String
        property fork_limit : Int32 = 30
        property timeout : Int32 = 5
        property caching_timeout : Int32 = 3600
        property ssh_args : String? = nil
        property? deprecation_warnings : Bool = false
        property? host_key_checking : Bool = true
      end
    end
  end
end
