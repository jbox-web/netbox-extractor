module NetboxExtractor
  # :nodoc:
  module Generators
    class Icinga < Base
      Log = ::Log.for("netbox-extractor.icinga")

      private def generate_files
        FileUtils.rm_rf @site.icinga_dest_path

        WaitGroup.wait do |wg|
          @site.ansible.include_device_roles.each do |role|
            wg.spawn { icinga_dump_devices(role: role.name, filename: role.filename) }
          end
        end

        WaitGroup.wait do |wg|
          @site.ansible.include_vm_roles.each do |role|
            wg.spawn { icinga_dump_vms(role: role.name, os: role.os, filename: role.filename) }
          end
        end

        WaitGroup.wait do |wg|
          @site.icinga.check_vhosts.each do |check_vhost|
            wg.spawn { icinga_dump_vhosts(check_vhost) }
          end
        end
      end

      private def icinga_dump_devices(role, filename = nil)
        inventory = @inventory_loader.fetch_devices(role: role)

        if inventory.empty?
          Log.warn { "[#{@site.id}] Skipping Icinga configs for '#{role}': no hosts" }
        else
          Log.info { "[#{@site.id}] Generating Icinga hosts configs for '#{role}'" }
          inventory.each { |host| save_icinga_host_config(host) }
        end
      end

      private def icinga_dump_vms(role, os, filename)
        inventory = @inventory_loader.fetch_vms(role: role, os: os)

        if inventory.empty?
          Log.warn { "[#{@site.id}] Skipping Icinga configs for '#{role}': no hosts" }
        else
          Log.info { "[#{@site.id}] Generating Icinga vms configs for '#{role}'" }
          inventory.each { |host| save_icinga_host_config(host) }
        end
      end

      private def icinga_dump_vhosts(check_vhost)
        Log.info { "[#{@site.id}] Generating Icinga vhosts configs for '#{check_vhost.subdir}'" }

        check_vhost.vhosts.each do |vhost|
          save_icinga_vhost_config(vhost, check_vhost.subdir)
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
    end
  end
end
