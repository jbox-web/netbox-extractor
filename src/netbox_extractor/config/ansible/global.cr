module NetboxExtractor
  module Config
    module Ansible
      class Global
        include YAML::Serializable

        property inventories_dir : String = "./generated/inventories"
        property fetch_facts : GlobalFetchFacts

        def inventories_path
          Path.new(File.expand_path(inventories_dir))
        end
      end
    end
  end
end
