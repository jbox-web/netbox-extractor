module NetboxExtractor
  module Presenters
    module IcingaHelper
      macro define_method_load_template_locals(service, key)
        # This method extends @template_locals with custom check configuration if any
        private def load_template_locals_check_{{service.id}}(locals)
          if data = check_{{service.id}}?
            locals.merge!({ "{{key.id}}" => data })
          end
        end
      end

      define_method_load_template_locals :drac, "icinga_check_drac_data"
      define_method_load_template_locals :esx, "icinga_check_esx_data"
      define_method_load_template_locals :mysql, "icinga_check_mysql_data"
      define_method_load_template_locals :netapp, "icinga_check_netapp_data"
      define_method_load_template_locals :nfs, "icinga_check_nfs_data"
      define_method_load_template_locals :php, "icinga_check_php_data"
      define_method_load_template_locals :postgres, "icinga_check_postgres_data"
      define_method_load_template_locals :rabbit, "icinga_check_rabbit_data"

      private def load_template_locals!
        if locals = @template_locals
          load_template_locals_default(locals)
          load_template_locals_host(locals)

          load_template_locals_check_drac(locals)
          load_template_locals_check_esx(locals)
          load_template_locals_check_mysql(locals)
          load_template_locals_check_netapp(locals)
          load_template_locals_check_nfs(locals)
          load_template_locals_check_php(locals)
          load_template_locals_check_postgres(locals)
          load_template_locals_check_rabbit(locals)
        end
      end

      private def load_template_locals_default(locals)
        locals["icinga_zone"] = @site.id
        locals["host_zone"] = @site.id
        locals["hostname"] = @host.name
        locals["host_type"] = @host.netbox_host_type
        locals["ipv4_address"] = @host.netbox_primary_ip
        locals["check_type"] = icinga_check_type
        locals["os_name"] = ansible_os_name
        locals["os_family"] = ansible_os_family
        locals["os_distro"] = ansible_os_distro
        locals["partitions_list"] = partitions_list
        locals["tags"] = @host.netbox_tags
        locals["load_warning"] = icinga_load_warning
        locals["load_critical"] = icinga_load_critical
      end

      private def load_template_locals_host(locals)
        if @host.netbox_physical?
          data = {"vendor_name" => @host.netbox_vendor_name, "vendor_model" => @host.netbox_vendor_model}
          locals.merge!(data)
        end

        if @host.netbox_virtual?
          data = {"hosting_node" => @host.netbox_hosting_node}
          locals.merge!(data)
        end

        if icinga_notification_period
          data = {"notification_period" => icinga_notification_period}
          locals.merge!(data)
        end

        if debian?
          data = {"debian_release" => debian_release}
          locals.merge!(data)
        end
      end

      private def icinga_check_type
        custom_config = find_custom_config_for(@host)
        check = custom_config.try &.check_type

        if check
          check
        elsif @host.netbox_check_by_snmp?
          "snmp"
        elsif @host.netbox_check_by_ping?
          "ping"
        elsif @host.netbox_windows?
          "snmp"
        else
          "ssh"
        end
      end

      private def icinga_notification_period
        custom_config = find_custom_config_for(@host)
        notification_period = custom_config.try &.notification_period
        return notification_period if notification_period

        nil
      end

      private def icinga_load_warning
        num_cpus = @ansible_facts.try &.dig?("ansible_processor_vcpus")
        return if num_cpus.nil?

        # cap the num_cpus to 32, otherwise numbers become meaningless
        # and alerts are not send
        num_cpus = num_cpus.as_i?
        return if num_cpus.nil?

        num_cpus = 32 if num_cpus > 32

        warning1 = num_cpus * 2
        warning5 = num_cpus + 2
        warning15 = num_cpus // 2 + 1
        [warning1, warning5, warning15].join(",")
      end

      private def icinga_load_critical
        num_cpus = @ansible_facts.try &.dig?("ansible_processor_vcpus")
        return if num_cpus.nil?

        # cap the num_cpus to 32, otherwise numbers become meaningless
        # and alerts are not send
        num_cpus = num_cpus.as_i?
        return if num_cpus.nil?

        num_cpus = 32 if num_cpus > 32

        critical1 = num_cpus * 4
        critical5 = num_cpus * 2
        critical15 = num_cpus + 2
        [critical1, critical5, critical15].join(",")
      end

      private def ansible_os_name
        fact = @ansible_facts.try &.dig?("ansible_lsb", "description")
        # Fall back to the (non-nil) Netbox platform when the fact is absent or
        # not a string, so this never returns nil / raises on as_s (C6).
        os_name = fact.try(&.as_s?) || @host.netbox_os_name

        case @host
        when NetboxClient::DeviceWithConfigContext
          os_name.split("-").first
        else
          os_name
        end
      end

      private def ansible_os_family
        @host.netbox_os_family
      end

      private def ansible_os_distro
        distro = @ansible_facts.try &.dig?("ansible_distribution")
        return nil if distro.nil?

        distro.as_s.downcase
      end

      private def partitions_list
        mounts = @ansible_facts.try &.dig?("ansible_mounts") || [] of String
        excluded =
          if exclude = check_partitions?
            exclude["exclude_volumes"]
          else
            [] of String
          end

        mounts = mounts.as_a.compact_map { |m| m["mount"]?.try(&.as_s) } if mounts.is_a?(JSON::Any)
        mounts - excluded
      end

      private def debian?
        ansible_os_name.includes?("Debian")
      end

      REGEX = %r{Debian GNU\/Linux (?<version>[0-9.]+) \((?<release>[\w]+)\)}

      private def debian_release
        matches = ansible_os_name.match(REGEX)
        matches.try &.["release"]
      end

      private def fetch_ansible_facts(site, host)
        facts_file = NetboxExtractor.config.ansible.fetch_facts.cache_path.join("#{site.id}.#{host.name}")
        return nil unless File.exists?(facts_file)

        JSON.parse(File.read(facts_file)).as_h
      rescue ex : JSON::ParseException | IO::Error
        Log.warn { "Ignoring unreadable facts #{facts_file}: #{ex.message}" }
        nil
      end
    end
  end
end
