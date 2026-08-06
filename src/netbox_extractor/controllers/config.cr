module NetboxExtractor
  module Controllers
    # Reports what is wrong with the configuration without generating anything.
    #
    # Findings go to STDOUT rather than through the logger: this is the output
    # of the command, not a trace of a run, and it has to be readable when the
    # log level says otherwise or the log goes to a file.
    module Config
      # Keys whose value never belongs on a terminal or in a CI log. Redacted
      # textually, on the serialised YAML rather than on the object tree: a new
      # check type carrying a password is then covered the day it is added,
      # instead of the day someone remembers to update a list of fields.
      SECRET_KEYS = %w[api_token password]

      REDACTED = "<redacted>"

      # Dumps the effective configuration — the template rendered, the
      # sites_config: files merged in, the defaults applied — with secrets
      # removed. Returns the process exit status.
      #
      # This is what the program actually understood, which is the point: the
      # file on disk is a template, and what it resolves to is not obvious.
      def self.dump(config_path, env_path, nbe_site) : Int32
        begin
          NetboxExtractor.load_config(config_path, env_path)
        rescue ex : Exception
          puts "ERROR  #{ex.message}"
          return 1
        end

        begin
          yaml = dumpable(nbe_site).to_yaml
        rescue ex : Exception
          puts "ERROR  #{ex.message}"
          return 1
        end

        puts redact_secrets(yaml)
        0
      end

      # The whole config, or a single site when one was named.
      private def self.dumpable(nbe_site)
        return NetboxExtractor.config if nbe_site == "all"

        site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
        raise "Unknown site: #{nbe_site}" if site.nil?

        site
      end

      # Replaces the value of every secret-bearing key, keeping the key, its
      # indentation and the line count so the result still reads as the config
      # it came from.
      #
      # The `m` flag is required and not incidental: in Crystal it turns on both
      # per-line `^`/`$` and a dot that matches newlines (verified — without it
      # this pattern matches nothing at all). `[^\n]*` rather than `.*` keeps the
      # second effect from swallowing the rest of the document.
      def self.redact_secrets(yaml : String) : String
        yaml.gsub(/^(\s*)(#{SECRET_KEYS.join("|")}):[^\n]*/m) do |_, match|
          "#{match[1]}#{match[2]}: #{REDACTED}"
        end
      end

      # Checks the configuration and returns the process exit status.
      #
      # An unreadable or invalid file is reported as a plain message, not as a
      # propagated exception: a broken config is this command's subject matter,
      # so answering it with a stack trace would be answering the question with
      # the failure to ask it.
      #
      # Netbox is only queried when `with_netbox` is set, since matching what
      # the config names against what exists costs as many API calls as a
      # generation run.
      def self.check(config_path, env_path, nbe_site, with_netbox, strict) : Int32
        begin
          NetboxExtractor.load_config(config_path, env_path)
        rescue ex : Exception
          puts "ERROR  #{ex.message}"
          return 1
        end

        findings = ConfigCheck::Checker.check_static(NetboxExtractor.config)
        findings.concat(check_against_netbox(nbe_site)) if with_netbox && findings.empty?

        report(findings, with_netbox)
        exit_status(findings, strict)
      end

      # Loads each selected site's inventories and matches the configuration
      # against the objects Netbox actually holds. Sites are handled in
      # sequence, not fanned out: the output is meant to be read top to bottom,
      # and interleaved findings from several sites would be worse than slow.
      private def self.check_against_netbox(nbe_site) : Array(ConfigCheck::Finding)
        NetboxExtractor.init_app!

        sites_for(nbe_site).flat_map do |site|
          check_site_against_netbox(site)
        end
      rescue ex : Exception
        # Reaching Netbox is a precondition of this mode, and failing to is an
        # answer in itself — a bad hostname, an expired token, a certificate
        # problem. Report it like any other finding rather than letting a stack
        # trace stand in for the check's own diagnosis.
        [ConfigCheck::Finding.new(ConfigCheck::Severity::Error, "cannot query Netbox: #{ex.message} (#{ex.class})")]
      end

      private def self.check_site_against_netbox(site) : Array(ConfigCheck::Finding)
        devices = NetboxExtractor::Netbox::DeviceInventory.new(site)
        vms = NetboxExtractor::Netbox::VmInventory.new(site)
        devices.load!
        vms.load!

        names = devices.object_names + vms.object_names
        roles = (devices.object_roles + vms.object_roles).uniq!
        platforms = (devices.object_platforms + vms.object_platforms).uniq!

        ConfigCheck::Checker.check_site(site, names, roles,
          platforms: platforms,
          vms_without_platform: vms.objects_without_platform,
          devices_without_platform: devices.objects_without_platform)
      end

      # `"all"` selects every configured site, as it does everywhere else.
      private def self.sites_for(nbe_site)
        return NetboxExtractor.config.sites if nbe_site == "all"

        site = NetboxExtractor.config.sites.find { |s| s.id == nbe_site }
        raise "Unknown site: #{nbe_site}" if site.nil?

        [site]
      end

      private def self.report(findings, with_netbox)
        if findings.empty?
          puts with_netbox ? "OK  configuration is valid and every configured name matches an object" : "OK  configuration is valid (Netbox not queried; pass --with-netbox to match names against it)"
          return
        end

        findings.each { |finding| puts finding }

        errors = findings.count(&.error?)
        warnings = findings.size - errors
        puts
        puts "#{errors} error(s), #{warning_label(warnings)}"
        puts "Netbox was not queried; names were not matched against it (pass --with-netbox)" unless with_netbox
      end

      private def self.warning_label(count)
        "#{count} warning(s)"
      end

      # Errors always fail. Warnings say the configuration works but names
      # something that no longer exists, which is worth reporting without
      # breaking a pipeline — unless the caller asked for that with --strict.
      private def self.exit_status(findings, strict) : Int32
        return 1 if findings.any?(&.error?)
        return 1 if strict && !findings.empty?

        0
      end
    end
  end
end
