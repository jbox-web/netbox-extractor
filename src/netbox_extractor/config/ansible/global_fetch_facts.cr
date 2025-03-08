module NetboxExtractor
  module Config
    module Ansible
      class GlobalFetchFacts
        include YAML::Serializable

        class Mitogen
          include YAML::Serializable

          property path : String
          property strategy : String = "mitogen_linear"
          property? enabled : Bool = false
        end

        property cache_dir : String = "./generated/facts"
        property exclude_tags : Array(String) = [] of String
        property fork_limit : Int32 = 30
        property timeout : Int32 = 5
        property caching_timeout : Int32 = 3600
        property ssh_args : String? = nil
        property? deprecation_warnings : Bool = false
        property? host_key_checking : Bool = true
        property mitogen : Mitogen

        def cache_path
          Path.new(File.expand_path(cache_dir))
        end
      end
    end
  end
end
