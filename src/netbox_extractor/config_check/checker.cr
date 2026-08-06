module NetboxExtractor
  module ConfigCheck
    # Decides what is wrong with a configuration. Deliberately free of I/O,
    # logging and process state: it is handed a config — and, when Netbox was
    # queried, the names of the objects a site actually holds — and returns
    # findings. That is what lets the whole rule set be exercised without a
    # Netbox instance.
    module Checker
      extend self

      # Entries of `checks_config` designating none of `names`, under the very
      # rule the presenters apply when they look one up. Lives here rather than
      # on the Icinga generator, which now calls it: one rule, two callers.
      def orphan_checks_config(checks_config, names)
        checks_config.reject do |config|
          names.any? { |name| NetboxExtractor::Presenters::WithCustomConfig.matches_host?(config.host, name) }
        end
      end

      # Findings about the configuration file itself, needing no Netbox access:
      # whatever `validate!` enforces (duplicate site ids, colliding inventory
      # filenames, unsafe role filenames). These are errors — the configuration
      # cannot be used as it stands.
      def check_static(config) : Array(Finding)
        config.validate!
        [] of Finding
      rescue ex : Config::ValidationError
        [Finding.new(Severity::Error, ex.message || "invalid configuration")]
      end

      # Findings about one site, given the names of every object Netbox holds
      # for it. Each of these is a name in the configuration that designates
      # nothing: the run would go on and quietly do less than asked.
      #
      # `roles` is the set of role slugs the loaded objects carry. It is nil
      # when the caller did not collect them, and the role checks are then
      # skipped rather than reporting every configured role as unmatched.
      def check_site(site, names, roles : Array(String)? = nil) : Array(Finding)
        findings = [] of Finding

        orphan_checks_config(site.icinga.checks_config, names).each do |config|
          findings << warning(site, "checks_config entry '#{config.host}' matches no host of this site")
        end

        # include_objects and exclude_objects are matched by strict equality in
        # InventoryFilters, so an entry that designates nothing is not merely
        # useless: an include list naming only absent hosts filters every host
        # out and empties the inventory.
        site.include_objects.each do |name|
          findings << warning(site, "include_objects entry '#{name}' matches no host of this site") unless names.includes?(name)
        end

        site.exclude_objects.each do |name|
          findings << warning(site, "exclude_objects entry '#{name}' matches no host of this site") unless names.includes?(name)
        end

        findings.concat(check_roles(site, roles)) if roles

        findings
      end

      # A configured role no loaded object carries generates nothing at all —
      # visible today only as a "no hosts" line buried in a generation run.
      private def check_roles(site, roles) : Array(Finding)
        configured = {
          "ansible device role" => site.ansible.include_device_roles.map(&.name),
          "ansible vm role"     => site.ansible.include_vm_roles.map(&.name),
          "icinga device role"  => site.icinga.include_device_roles.map(&.name),
          "icinga vm role"      => site.icinga.include_vm_roles.map(&.name),
        }

        configured.flat_map do |kind, names|
          names.reject { |name| roles.includes?(name) }
            .map { |name| warning(site, "#{kind} '#{name}' matches no object of this site") }
        end
      end

      private def warning(site, message)
        Finding.new(Severity::Warning, message, site.id, site.source_path)
      end
    end
  end
end
