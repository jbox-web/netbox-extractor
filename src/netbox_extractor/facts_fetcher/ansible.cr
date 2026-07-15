module NetboxExtractor
  module FactsFetcher
    class Ansible
      Log = ::Log.for("netbox-extractor.ansible")

      FORK_LIMIT      =   30
      TIMEOUT         =    5
      CACHING_TIMEOUT = 3600
      SSH_ARGS        = ""

      def self.run(site)
        facts_fetcher = new(site)
        facts_fetcher.run
      end

      @cache_path : Path
      @deprecation_warnings : Bool
      @host_key_checking : Bool

      def initialize(@site : NetboxExtractor::Config::Site) # ameba:disable Metrics/CyclomaticComplexity
        @cache_path = NetboxExtractor.config.ansible.fetch_facts.cache_path
        @use_mitogen = NetboxExtractor.config.ansible.fetch_facts.mitogen.enabled?
        @mitogen_path = NetboxExtractor.config.ansible.fetch_facts.mitogen.path
        @mitogen_strategy = NetboxExtractor.config.ansible.fetch_facts.mitogen.strategy
        @fetch_facts_exclude_tags = NetboxExtractor.config.ansible.fetch_facts.exclude_tags

        @deprecation_warnings = @site.ansible.fetch_facts.try &.deprecation_warnings? || NetboxExtractor.config.ansible.fetch_facts.try &.deprecation_warnings?
        @host_key_checking = @site.ansible.fetch_facts.try &.host_key_checking? || NetboxExtractor.config.ansible.fetch_facts.try &.host_key_checking?

        @fork_limit = @site.ansible.fetch_facts.try &.fork_limit || NetboxExtractor.config.ansible.fetch_facts.try &.fork_limit || FORK_LIMIT
        @timeout = @site.ansible.fetch_facts.try &.timeout || NetboxExtractor.config.ansible.fetch_facts.try &.timeout || TIMEOUT
        @caching_timeout = @site.ansible.fetch_facts.try &.caching_timeout || NetboxExtractor.config.ansible.fetch_facts.try &.caching_timeout || CACHING_TIMEOUT
        @ssh_args = @site.ansible.fetch_facts.try &.ssh_args || NetboxExtractor.config.ansible.fetch_facts.try &.ssh_args || SSH_ARGS

        set_log_context!
      end

      # The shared fact cache is wiped once by the controller before the per-site
      # fan-out (K2), so `run` must not wipe it here — that would erase sibling
      # sites' freshly-written cache.
      def run
        NetboxExtractor::Concurrency.each_isolated(@site.ansible.fetch_facts.inventories, "Ansible facts (site #{@site.id})") do |inventory_file|
          # log context is per fiber
          set_log_context!
          fetch_facts(inventory_file)
        end
      end

      private def set_log_context!
        Log.context.set site: @site.id
      end

      private def fetch_facts(filename)
        inventory_file = @site.ansible_inventory_path.join(filename)
        inventory = File.exists?(inventory_file) ? YAML.parse(File.read(inventory_file)) : {} of String => String
        inventory_name = File.basename(filename, File.extname(filename))

        Log.info { "Fetching Ansible facts for #{inventory_name}" }
        Log.debug { "Fetching Ansible facts for #{inventory_file}" }

        vars = inventory.dig?("all", "vars")
        all_hosts = inventory.dig?("all", "hosts")

        if all_hosts
          filtered_hosts = filter_hosts(all_hosts.as_h)

          new_inventory = {"all" => {"vars" => vars, "hosts" => filtered_hosts}}

          call_ansible(new_inventory)
        end
      end

      private def filter_hosts(hosts)
        hosts.reject! { |_k, v| (v["netbox_tags"].as_a & @fetch_facts_exclude_tags).size > 0 }
        hosts.to_h
      end

      private def call_ansible(inventory)
        inventory_file = generate_ansible_inventory(inventory)
        playbook = generate_ansible_playbook
        ansible_config = generate_ansible_config

        args = ["--flush-cache", "--timeout", "#{@timeout}", "--inventory", inventory_file, playbook]

        env = {"ANSIBLE_CONFIG" => ansible_config}

        Log.debug { "Running command: ansible-playbook #{args} | #{env}" }

        Process.run("ansible-playbook",
          shell: true,
          output: STDOUT,
          error: STDERR,
          args: args,
          env: env
        )
      end

      private def generate_ansible_inventory(inventory)
        Log.debug { "Generating ansible inventory to fetch facts" }

        generate_file(data: YAML.dump(inventory), prefix: "ansible-inventory", suffix: "yml")
      end

      private def generate_ansible_playbook
        Log.debug { "Generating ansible playbook to fetch facts" }

        file = NetboxExtractor::Controllers::TemplatesManager.get("ansible/fetch_facts.yml")
        data = file.gets_to_end
        generate_file(data: data, prefix: "ansible-playbook", suffix: "yml")
      end

      private def generate_ansible_config
        Log.debug { "Generating ansible config to fetch facts" }

        file = NetboxExtractor::Controllers::TemplatesManager.get("ansible/ansible.cfg")
        template = file.gets_to_end
        locals = {
          "caching_prefix"       => "#{@site.id}.",
          "caching_connection"   => @cache_path.to_s,
          "caching_timeout"      => @caching_timeout,
          "host_key_checking"    => @host_key_checking,
          "forks"                => @fork_limit,
          "ssh_args"             => @ssh_args,
          "deprecation_warnings" => @deprecation_warnings,
          "use_mitogen"          => @use_mitogen,
          "mitogen_path"         => @mitogen_path,
          "mitogen_strategy"     => @mitogen_strategy,
          "pipelining"           => "true",
        }

        Log.debug { locals }

        data = NetboxExtractor::Utils.render_template(template, locals)

        Log.debug { data }

        generate_file(data: data, prefix: "ansible-config", suffix: "cfg")
      end

      private def generate_file(data, prefix, suffix)
        tempfile = File.tempfile("#{prefix}-#{@site.id}")

        File.open(tempfile.path, "w") do |f|
          f.puts data
        end

        filepath = "#{tempfile.path}.#{suffix}"
        FileUtils.mv(tempfile.path, filepath)
        filepath
      end
    end
  end
end
