module NetboxExtractor
  module Config
    # One entry of the `sites:` list (or an external `sites_config:` file):
    # configuration for a single Netbox site, bundling its `ansible` and `icinga`
    # sub-configs plus the global object include/exclude filters. `id` is the
    # slug used to derive per-site output directories.
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

      # A role `filename` is concatenated into an output path, so it has to be a
      # single safe path segment — the same guarantee the Netbox host names get
      # from `InventoryFilters::SAFE_NAME`.
      SAFE_FILENAME = /\A[A-Za-z0-9._-]+\z/

      # Raises if two Ansible roles resolve to the same inventory filename: they
      # would be written concurrently (device roles) or overwrite one another
      # (a device and a vm role sharing a name), silently losing hosts. Also
      # raises on any role filename that is not a safe path segment.
      def validate!
        validate_unique_ansible_filenames!
        validate_safe_filenames!
      end

      private def validate_unique_ansible_filenames!
        names = ansible.include_device_roles.map { |r| r.filename || r.name } +
                ansible.include_vm_roles.map { |r| r.filename || r.name }
        dupes = names.select { |n| names.count(n) > 1 }.uniq!
        return if dupes.empty?

        raise ValidationError.new("Site '#{id}': duplicate Ansible inventory filename(s): #{dupes.join(", ")}")
      end

      private def validate_safe_filenames!
        filenames = [ansible.include_device_roles.compact_map(&.filename),
                     ansible.include_vm_roles.compact_map(&.filename),
                     icinga.include_device_roles.compact_map(&.filename),
                     icinga.include_vm_roles.compact_map(&.filename)].flatten

        unsafe = filenames.reject(&.matches?(SAFE_FILENAME))
        return if unsafe.empty?

        raise ValidationError.new("Site '#{id}': unsafe role filename(s): #{unsafe.join(", ")}")
      end

      # Name of the Icinga2 zone directory for this site (its `id`).
      def icinga_zone_dir
        id
      end

      # Absolute directory where this site's Ansible inventories are written,
      # under the global `ansible.inventories_dir` keyed by site `id`.
      def ansible_inventory_path
        NetboxExtractor.config.ansible.inventories_path.join(id)
      end

      # Absolute directory where this site's Icinga2 zone files are written.
      # Returns `icinga_staging_path` when a staging build is in progress,
      # otherwise the live directory under global `icinga.zones_dir`.
      def icinga_zones_path
        icinga_staging_path || NetboxExtractor.config.icinga.zones_path.join(id)
      end
    end
  end
end
