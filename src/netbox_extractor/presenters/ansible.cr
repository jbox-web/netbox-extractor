require "./base"

module NetboxExtractor
  # :nodoc:
  module Presenters
    class Ansible < Base
      Log = ::Log.for("netbox-extractor.ansible")

      def to_ansible
        return to_linux if @host.linux?
        to_default
      end

      private def to_linux
        hash = to_default

        if (data = check_nfs?) && (host = @host.name)
          hash.merge!({host => data})
        end

        hash
      end

      private def to_default
        if host = @host.name
          TemplateLocals.new({host => ansible_vars})
        else
          TemplateLocals.new
        end
      end

      private def ansible_vars
        @template_locals.merge!({
          "ansible_user"   => "root",
          "ansible_host"   => @host.netbox_primary_ip,
          "netbox_tags"    => @host.netbox_tags,
          "netbox_os_name" => @host.netbox_os_name,
        })
      end
    end
  end
end
