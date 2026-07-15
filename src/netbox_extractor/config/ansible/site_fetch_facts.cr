module NetboxExtractor
  module Config
    module Ansible
      # Maps to `ansible.fetch_facts:` inside a site config: per-site overrides
      # of the global fact-gathering settings. Nil-valued numeric/boolean fields
      # inherit the corresponding `GlobalFetchFacts` value rather than forcing a
      # default.
      class SiteFetchFacts
        include YAML::Serializable

        property inventories : Array(String) = [] of String
        property exclude_tags : Array(String) = [] of String

        # nil means "inherit the global value": a non-nil default here would make
        # the site value always win and silently shadow the global config (E6).
        property fork_limit : Int32? = nil
        property timeout : Int32? = nil
        property caching_timeout : Int32? = nil
        property ssh_args : String? = nil
        property deprecation_warnings : Bool? = nil
        property host_key_checking : Bool? = nil
      end
    end
  end
end
