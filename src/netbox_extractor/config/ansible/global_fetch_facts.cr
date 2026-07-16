module NetboxExtractor
  module Config
    module Ansible
      # Maps to `ansible.fetch_facts:`: global defaults for the fact-gathering
      # step. Sites inherit these values unless they override them in their own
      # `SiteFetchFacts`.
      class GlobalFetchFacts
        include YAML::Serializable

        # Maps to `ansible.fetch_facts.mitogen:`: optional Mitogen strategy plugin
        # used to accelerate Ansible fact gathering.
        class Mitogen
          include YAML::Serializable

          property path : String = ""
          property strategy : String = "mitogen_linear"
          property? enabled : Bool = false
        end

        property cache_dir : String = "./generated/facts"
        property exclude_tags : Array(String) = [] of String
        # Maximum number of parallel Ansible forks used during fact gathering.
        property fork_limit : Int32 = 30
        # Hard cap on concurrent `ansible-playbook` processes across the whole run
        # (all sites, all inventories). `0` means unlimited — no capping.
        property max_parallel_playbooks : Int32 = 0
        # Per-host SSH/connection timeout in seconds.
        property timeout : Int32 = 5
        # Ansible fact-cache validity duration in seconds.
        property caching_timeout : Int32 = 3600
        property ssh_args : String? = nil
        property? deprecation_warnings : Bool = false
        property? host_key_checking : Bool = true
        property mitogen : Mitogen = Mitogen.from_yaml("")

        # Absolute, expanded form of `cache_dir`.
        def cache_path
          Path.new(File.expand_path(cache_dir))
        end
      end
    end
  end
end
