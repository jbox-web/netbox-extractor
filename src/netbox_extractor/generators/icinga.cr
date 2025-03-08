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

      private def generate_files
        FileUtils.rm_rf @site.icinga_zones_path

        WaitGroup.wait do |wg|
          @site.icinga.include_device_roles.each do |role|
            wg.spawn do
              # log context is per fiber
              set_log_context!

              icinga_dump_devices(role: role.name, filename: role.filename)
            end
          end
        end

        WaitGroup.wait do |wg|
          @site.icinga.include_vm_roles.each do |role|
            wg.spawn do
              # log context is per fiber
              set_log_context!

              icinga_dump_vms(role: role.name, os: role.os, filename: role.filename)
            end
          end
        end

        WaitGroup.wait do |wg|
          @site.icinga.check_vhosts.each do |check_vhost|
            wg.spawn do
              # log context is per fiber
              set_log_context!

              icinga_dump_vhosts(check_vhost)
            end
          end
        end

        icinga_dump_custom_hosts(@site.icinga.check_custom_hosts)
      end

      private def icinga_dump_devices(role, filename = nil)
        inventory = @device_inventory.fetch_devices(role: role)

        if inventory.empty?
          Log.warn { "Skipping Icinga configs for '#{role}': no hosts" }
        else
          Log.info { "Generating Icinga hosts configs for '#{role}'" }
          inventory.each { |host| save_icinga_host_config(host) }
        end
      end

      private def icinga_dump_vms(role, os, filename)
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
