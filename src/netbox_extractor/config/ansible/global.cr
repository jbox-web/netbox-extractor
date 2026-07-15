module NetboxExtractor
  module Config
    module Ansible
      # Maps to the top-level `ansible:` block: global Ansible settings shared by
      # every site, i.e. the base inventory output directory and the fact-fetching
      # defaults.
      class Global
        include YAML::Serializable

        property inventories_dir : String = "./generated/inventories"
        property fetch_facts : GlobalFetchFacts

        # Absolute, expanded form of `inventories_dir`.
        def inventories_path
          Path.new(File.expand_path(inventories_dir))
        end
      end
    end
  end
end
