module NetboxExtractor
  module Generators
    class Icinga
      Log = ::Log.for("netbox-extractor.icinga")

      def self.run(site)
        device_inventory = NetboxExtractor::Netbox::DeviceInventory.new(site)
        vm_inventory = NetboxExtractor::Netbox::VmInventory.new(site)
        generator = new(site, device_inventory, vm_inventory)
        generator.run
      end

      def initialize(@site : NetboxExtractor::Config::Site,
                     @device_inventory : NetboxExtractor::Netbox::DeviceInventory,
                     @vm_inventory : NetboxExtractor::Netbox::VmInventory)
        set_log_context!
      end

      def run
        @device_inventory.load!
        @vm_inventory.load!
        generate_files
      end

      private def set_log_context!
        Log.context.set site: @site.id
      end

      # Build-then-swap: the whole zone is generated into a staging directory and
      # only swapped over the live directory once every host has been written
      # without error. A failure mid-generation (a load failure, a broken host)
      # therefore leaves the existing Icinga config fully intact instead of wiping
      # it up front (K3).
      private def generate_files
        final_path = @site.icinga_zones_path
        staging_path = final_path.parent.join(".#{@site.id}.staging")

        FileUtils.rm_rf staging_path
        FileUtils.mkdir_p staging_path
        @site.icinga_staging_path = staging_path

        begin
          generate_into_staging
          swap_into_place(staging_path, final_path)
        ensure
          @site.icinga_staging_path = nil
        end
      end

      private def generate_into_staging
        NetboxExtractor::Concurrency.each_isolated(@site.icinga.include_device_roles, "Icinga device configs (site #{@site.id})") do |role|
          # log context is per fiber
          set_log_context!

          icinga_dump_devices(role: role.name)
        end

        NetboxExtractor::Concurrency.each_isolated(@site.icinga.include_vm_roles, "Icinga vm configs (site #{@site.id})") do |role|
          # log context is per fiber
          set_log_context!

          icinga_dump_vms(role: role.name, os: role.os)
        end

        NetboxExtractor::Concurrency.each_isolated(@site.icinga.check_vhosts, "Icinga vhost configs (site #{@site.id})") do |check_vhost|
          # log context is per fiber
          set_log_context!

          icinga_dump_vhosts(check_vhost)
        end

        icinga_dump_custom_hosts(@site.icinga.check_custom_hosts)
      end

      private def swap_into_place(staging_path, final_path)
        FileUtils.rm_rf final_path
        FileUtils.mkdir_p final_path.parent
        File.rename(staging_path.to_s, final_path.to_s)

        Log.info { "Swapped generated Icinga config into #{final_path}" }
      end

      private def icinga_dump_devices(role)
        inventory = @device_inventory.fetch_devices(role: role)

        if inventory.empty?
          Log.warn { "Skipping Icinga configs for '#{role}': no hosts" }
        else
          Log.info { "Generating Icinga hosts configs for '#{role}'" }
          inventory.each { |host| save_icinga_host_config(host) }
        end
      end

      private def icinga_dump_vms(role, os)
        inventory = @vm_inventory.fetch_vms(role: role, os: os)

        if inventory.empty?
          Log.warn { "Skipping Icinga configs for '#{role}': no hosts" }
        else
          Log.info { "Generating Icinga vms configs for '#{role}'" }
          inventory.each { |host| save_icinga_host_config(host) }
        end
      end

      private def icinga_dump_vhosts(check_vhost)
        Log.info { "Generating Icinga vhosts configs for '#{check_vhost.subdir}'" }

        check_vhost.vhosts.each do |vhost|
          save_icinga_vhost_config(vhost, check_vhost.subdir)
        end
      end

      private def icinga_dump_custom_hosts(custom_hosts)
        Log.info { "Generating Icinga custom hosts configs" }

        custom_hosts.each do |custom_host|
          save_icinga_custom_host_config(custom_host)
        end
      end

      private def save_icinga_host_config(host)
        presenter = NetboxExtractor::Presenters::IcingaHost.new(@site, host)
        presenter.save!
      end

      private def save_icinga_vhost_config(vhost, subdir)
        presenter = NetboxExtractor::Presenters::IcingaVhost.new(@site, vhost, subdir)
        presenter.save!
      end

      private def save_icinga_custom_host_config(custom_host)
        presenter = NetboxExtractor::Presenters::IcingaCustomHost.new(@site, custom_host)
        presenter.save!
      end
    end
  end
end
