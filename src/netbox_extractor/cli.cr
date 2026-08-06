module NetboxExtractor
  # Shared behaviour of the commands that only group subcommands. Admiral only
  # rejects an `Admiral::Error`, not an unmatched subcommand, so without this a
  # typo (`ansible genrate`) printed the help and exited 0: a total no-op
  # reported as a success by cron or CI.
  module ParentCommand
    # The leftover word when the arguments matched no subcommand, or nil when
    # the command was invoked bare. Admiral leaves an unmatched subcommand in
    # `@argv`, which is what tells a typo apart from a bare invocation.
    #
    # Anything starting with `-` is left alone: it is a flag, not a subcommand,
    # and flag handling belongs to Admiral. This is not hypothetical — the spec
    # binary is invoked with `--no-color`, and treating it as a subcommand made
    # the whole suite exit before a single example was defined.
    def unknown_subcommand(argv)
      word = argv.first?.try(&.to_s)
      return nil if word.nil? || word.starts_with?('-')

      word
    end

    # Prints the help for a bare invocation, or refuses an unmatched
    # subcommand with a message on STDERR and a non-zero exit.
    private def run_parent
      if unknown = unknown_subcommand(@argv)
        STDERR.puts "Unknown subcommand: #{unknown}"
        STDERR.puts help
        exit 1
      end

      puts help
    end
  end

  # Root command of the admiral-based CLI. Wires the `ansible`, `icinga`, `bind`
  # and `test_api` subcommand trees and prints help when invoked bare.
  class CLI < Admiral::Command
    include ParentCommand
    extend ParentCommand

    # Parent command grouping the Netbox/Ansible subcommands.
    class Ansible < Admiral::Command
      define_help description: "Netbox/Ansible subcommands"
      include ParentCommand

      # Loads config, initialises the app and generates Ansible inventory files
      # for the selected site (`all` by default).
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

      # Loads config, initialises the app and fetches Ansible facts for the
      # selected site.
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
        run_parent
      end
    end

    # Parent command grouping the Netbox/Icinga subcommands.
    class Icinga < Admiral::Command
      define_help description: "Netbox/Icinga subcommands"
      include ParentCommand

      # Loads config, initialises the app and generates Icinga2 configuration
      # files for the selected site.
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
        run_parent
      end
    end

    # Parent command grouping the Netbox/Bind subcommands.
    class Bind < Admiral::Command
      define_help description: "Netbox/Bind subcommands"
      include ParentCommand

      # Loads config, initialises the app and generates Bind DNS zone files.
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
        run_parent
      end
    end

    # Parent command grouping the Netbox API connectivity-test subcommands.
    class TestApi < Admiral::Command
      define_help description: "Netbox/Test subcommands"
      include ParentCommand

      # Exercises a read-only GET call against every Netbox API group to verify
      # connectivity and authentication.
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

      register_sub_command get, GET, description: "Test GET Netbox API"

      def run
        run_parent
      end
    end

    define_version NetboxExtractor.version
    define_help description: "Generate Ansible inventories and Icinga configuration files from Netbox"

    register_sub_command ansible, Ansible, description: "Netbox/Ansible subcommands"
    register_sub_command icinga, Icinga, description: "Netbox/Icinga subcommands"
    register_sub_command bind, Bind, description: "Netbox/Bind subcommands"
    register_sub_command test_api, TestApi, description: "Netbox/Test subcommands"

    def run
      run_parent
    end
  end
end
