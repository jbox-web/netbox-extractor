module NetboxExtractor
  module Config
    class Site
      include YAML::Serializable

      property id : String
      property name : String
      property ansible : Ansible::Site
      property icinga : Icinga::Site
      property include_objects : Array(String) = [] of String
      property exclude_objects : Array(String) = [] of String

      # Transient generation-time redirect: while the Icinga generator builds a
      # fresh zone in a staging directory, `icinga_zones_path` points there so the
      # presenters write into staging instead of the live directory. Set once per
      # site before its role fibers spawn (they only read it), so it is fiber-safe.
      @[YAML::Field(ignore: true)]
      property icinga_staging_path : Path? = nil

      # Raises if two Ansible roles resolve to the same inventory filename: they
      # would be written concurrently (device roles) or overwrite one another
      # (a device and a vm role sharing a name), silently losing hosts.
      def validate!
        names = ansible.include_device_roles.map { |r| r.filename || r.name } +
                ansible.include_vm_roles.map { |r| r.filename || r.name }
        dupes = names.select { |n| names.count(n) > 1 }.uniq!
        return if dupes.empty?

        raise ValidationError.new("Site '#{id}': duplicate Ansible inventory filename(s): #{dupes.join(", ")}")
      end

      def icinga_zone_dir
        id
      end

      def ansible_inventory_path
        NetboxExtractor.config.ansible.inventories_path.join(id)
      end

      def icinga_zones_path
        icinga_staging_path || NetboxExtractor.config.icinga.zones_path.join(id)
      end
    end
  end
end
