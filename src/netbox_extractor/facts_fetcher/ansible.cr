module NetboxExtractor
  module FactsFetcher
    class Ansible
      Log = ::Log.for("netbox-extractor.ansible")

      FORK_LIMIT = 30

      def self.run(site)
        facts_fetcher = new(site)
        facts_fetcher.run
      end

      @cache_path : Path

      def initialize(@site : NetboxExtractor::Config::Site)
        @cache_path = NetboxExtractor.config.ansible.fetch_facts.cache_path
        @host_key_checking = NetboxExtractor.config.ansible.fetch_facts.host_key_checking?
        @use_mitogen = NetboxExtractor.config.ansible.fetch_facts.mitogen.enabled?
        @mitogen_path = NetboxExtractor.config.ansible.fetch_facts.mitogen.path
        @mitogen_strategy = NetboxExtractor.config.ansible.fetch_facts.mitogen.strategy
        @fetch_facts_exclude_tags = NetboxExtractor.config.ansible.fetch_facts.exclude_tags
        @fork_limit = @site.ansible.fetch_facts.try &.fork_limit || NetboxExtractor.config.ansible.fetch_facts.try &.fork_limit || FORK_LIMIT

        set_log_context!
      end

      def run
        FileUtils.rm_rf @cache_path
        FileUtils.mkdir_p @cache_path

        WaitGroup.wait do |wg|
          @site.ansible.fetch_facts.inventories.each do |inventory_file|
            wg.spawn do
              # log context is per fiber
              set_log_context!
              fetch_facts(inventory_file)
            end
          end
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
        hosts = inventory.dig?("all", "hosts")
        fork_limit = hosts ? cap_fork(hosts.size) : @fork_limit

        inventory_file = generate_ansible_inventory(inventory)
        playbook = generate_ansible_playbook
        ansible_config = generate_ansible_config

        args = ["--flush-cache", "--forks", "#{fork_limit}", "-i", inventory_file, playbook]

        env = {
          "ANSIBLE_CONFIG"              => ansible_config,
          "ANSIBLE_PIPELINING"          => "true",
          "ANSIBLE_CACHE_PLUGIN_PREFIX" => "#{@site.id}.",
        }

        Log.debug { "Running command: ansible-playbook #{args} #{env}" }

        Process.run("ansible-playbook",
          shell: true,
          output: STDOUT,
          error: STDERR,
          args: args,
          env: env
        )
      end

      private def cap_fork(size)
        fork_limit = @fork_limit
        return size if size <= fork_limit

        fork_limit
      end

      private def generate_ansible_inventory(inventory)
        generate_file(data: YAML.dump(inventory), prefix: "ansible-inventory", suffix: "yml")
      end

      private def generate_ansible_playbook
        file = NetboxExtractor::Controllers::TemplatesManager.get("ansible/fetch_facts.yml")
        data = file.gets_to_end
        generate_file(data: data, prefix: "ansible-playbook", suffix: "yml")
      end

      private def generate_ansible_config
        file = NetboxExtractor::Controllers::TemplatesManager.get("ansible/ansible.cfg")
        template = file.gets_to_end
        locals = {
          "cache_path"        => @cache_path.to_s,
          "host_key_checking" => @host_key_checking,
          "use_mitogen"       => @use_mitogen,
          "mitogen_path"      => @mitogen_path,
          "mitogen_strategy"  => @mitogen_strategy,
        }
        data = NetboxExtractor::Utils.render_template(template, locals)
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
