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
      def check_site(site,
                     names,
                     roles : Array(String)? = nil,
                     platforms : Array(String)? = nil,
                     vms_without_platform : Array(String)? = nil,
                     devices_without_platform : Array(String)? = nil) : Array(Finding)
        findings = [] of Finding

        orphan_checks_config(site.icinga.checks_config, names).each do |config|
          findings << warning(site, "checks_config entry '#{config.host}' matches no host of this site")
        end

        # include_objects and exclude_objects are matched by strict equality in
        # InventoryFilters, so an entry that designates nothing is not merely
        # useless: an include list naming only absent hosts filters every host
        # out and empties the inventory.
        site.include_objects.each do |name|
          findings << warning(site, filter_entry_message("include_objects", name, names, "inclusion")) unless names.includes?(name)
        end

        site.exclude_objects.each do |name|
          findings << warning(site, filter_entry_message("exclude_objects", name, names, "exclusion")) unless names.includes?(name)
        end

        findings.concat(check_roles(site, roles)) if roles
        findings.concat(check_platforms(site, platforms)) if platforms

        vms_without_platform.try &.each do |name|
          findings << warning(site, "VM '#{name}' has no platform in Netbox: it matches no OS family, so it is absent from every inventory and every Icinga config")
        end

        devices_without_platform.try &.each do |name|
          findings << warning(site, "device '#{name}' has no platform in Netbox: it is generated with an OS of 'unknown'")
        end

        findings
      end

      # OS detection is a substring test, and linux is tried before windows, so
      # a slug carrying markers of both is classed linux without windows ever
      # being evaluated. Reported under the rule that classifies it, so the two
      # cannot drift apart.
      private def check_platforms(site, platforms) : Array(Finding)
        platforms.uniq.compact_map do |slug|
          next unless NetboxExtractor::Patches::NetboxClient.linux_slug?(slug) &&
                      NetboxExtractor::Patches::NetboxClient.windows_slug?(slug)

          warning(site, "platform slug '#{slug}' carries markers of both OS families and is classed linux, linux being tested first")
        end
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

      # Tells a dead entry apart from a broken one. Both fail the strict
      # equality the filters use, but they call for opposite fixes: an entry
      # naming a host that no longer exists should be deleted, while one that
      # differs from a real host only in case or by a domain should be
      # corrected — deleting it would entrench the very behaviour it was meant
      # to prevent, since the filter is silently not being applied.
      private def filter_entry_message(key, name, names, effect)
        base = "#{key} entry '#{name}' matches no host of this site"
        near = names.find { |candidate| NetboxExtractor::Presenters::WithCustomConfig.matches_host?(name, candidate) }

        return base if near.nil?

        "#{base}, but '#{near}' does — the #{effect} is not being applied, as these filters match exactly"
      end

      private def warning(site, message)
        Finding.new(Severity::Warning, message, site.id, site.source_path)
      end
    end
  end
end
