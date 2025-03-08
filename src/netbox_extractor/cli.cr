module NetboxExtractor
  class CLI < Admiral::Command
    class Ansible < Admiral::Command
      define_help description: "Netbox/Ansible subcommands"

      class Generate < Admiral::Command
        define_help description: "Generate Ansible inventories"

        define_flag config : String,
          description: "Path to config file",
          long: "config",
          short: "c",
          default: "netbox-extractor.yml"

        define_flag env : String,
          description: "Path to env file",
          long: "env",
          short: "e",
          default: ".env"

        define_flag site : String,
          description: "Site",
          long: "site",
          short: "s",
          default: "all"

        def run
          NetboxExtractor.load_config(flags.config, flags.env)
          NetboxExtractor.init_app!
          NetboxExtractor::Controllers::Ansible.generate_ansible_inventories(flags.site)
        end
      end

      class FetchFacts < Admiral::Command
        define_help description: "Fetch Ansible facts"

        define_flag config : String,
          description: "Path to config file",
          long: "config",
          short: "c",
          default: "netbox-extractor.yml"

        define_flag env : String,
          description: "Path to env file",
          long: "env",
          short: "e",
          default: ".env"

        define_flag site : String,
          description: "Site",
          long: "site",
          short: "s",
          default: "all"

        def run
          NetboxExtractor.load_config(flags.config, flags.env)
          NetboxExtractor.init_app!
          NetboxExtractor::Controllers::Ansible.fetch_ansible_facts(flags.site)
        end
      end

      register_sub_command generate, Generate, description: "Generate Ansible inventories"
      register_sub_command fetch_facts, FetchFacts, description: "Fetch Ansible facts"

      def run
        puts help
      end
    end

    class Icinga < Admiral::Command
      define_help description: "Netbox/Icinga subcommands"

      class Generate < Admiral::Command
        define_help description: "Generate Icinga configuration files"

        define_flag config : String,
          description: "Path to config file",
          long: "config",
          short: "c",
          default: "netbox-extractor.yml"

        define_flag env : String,
          description: "Path to env file",
          long: "env",
          short: "e",
          default: ".env"

        define_flag site : String,
          description: "Site",
          long: "site",
          short: "s",
          default: "all"

        def run
          NetboxExtractor.load_config(flags.config, flags.env)
          NetboxExtractor.init_app!
          NetboxExtractor::Controllers::Icinga.generate_icinga_inventories(flags.site)
        end
      end

      register_sub_command generate, Generate, description: "Generate Icinga configuration files"

      def run
        puts help
      end
    end

    class Bind < Admiral::Command
      define_help description: "Netbox/Bind subcommands"

      class Generate < Admiral::Command
        define_help description: "Generate Bind configuration files"

        define_flag config : String,
          description: "Path to config file",
          long: "config",
          short: "c",
          default: "netbox-extractor.yml"

        define_flag env : String,
          description: "Path to env file",
          long: "env",
          short: "e",
          default: ".env"

        def run
          NetboxExtractor.load_config(flags.config, flags.env)
          NetboxExtractor.init_app!
          NetboxExtractor::Controllers::Bind.generate_bind_zones
        end
      end

      register_sub_command generate, Generate, description: "Generate Bind configuration files"

      def run
        puts help
      end
    end

    class TestApi < Admiral::Command
      define_help description: "Netbox/Test subcommands"

      class GET < Admiral::Command
        define_help description: "Test GET Netbox API"

        define_flag config : String,
          description: "Path to config file",
          long: "config",
          short: "c",
          default: "netbox-extractor.yml"

        define_flag env : String,
          description: "Path to env file",
          long: "env",
          short: "e",
          default: ".env"

        def run
          NetboxExtractor.load_config(flags.config, flags.env)
          NetboxExtractor.init_app!

          NetboxExtractor::Controllers::TestApi::GET.test_circuits_api
          NetboxExtractor::Controllers::TestApi::GET.test_core_api
          NetboxExtractor::Controllers::TestApi::GET.test_dcim_api
          NetboxExtractor::Controllers::TestApi::GET.test_extras_api
          NetboxExtractor::Controllers::TestApi::GET.test_ipam_api
          NetboxExtractor::Controllers::TestApi::GET.test_tenancy_api
          NetboxExtractor::Controllers::TestApi::GET.test_users_api
          NetboxExtractor::Controllers::TestApi::GET.test_virtualization_api
          NetboxExtractor::Controllers::TestApi::GET.test_vpn_api
          NetboxExtractor::Controllers::TestApi::GET.test_wireless_api
        end
      end

      class POST < Admiral::Command
        define_help description: "Test POST Netbox API"

        define_flag config : String,
          description: "Path to config file",
          long: "config",
          short: "c",
          default: "netbox-extractor.yml"

        define_flag env : String,
          description: "Path to env file",
          long: "env",
          short: "e",
          default: ".env"

        def run
          NetboxExtractor.load_config(flags.config, flags.env)
          NetboxExtractor.init_app!

          NetboxExtractor::Controllers::TestApi::POST.create_vms
        end
      end

      register_sub_command get, GET, description: "Test GET Netbox API"
      register_sub_command post, POST, description: "Test POST Netbox API"

      def run
        puts help
      end
    end

    define_version NetboxExtractor.version
    define_help description: "Generate Ansible inventories and Icinga configuration files from Netbox"

    register_sub_command ansible, Ansible, description: "Netbox/Ansible subcommands"
    register_sub_command icinga, Icinga, description: "Netbox/Icinga subcommands"
    register_sub_command bind, Bind, description: "Netbox/Bind subcommands"
    register_sub_command test_api, TestApi, description: "Netbox/Test subcommands"

    def run
      puts help
    end
  end
end
