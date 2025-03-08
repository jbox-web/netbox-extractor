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

      def icinga_zone_dir
        id
      end

      def ansible_inventory_path
        NetboxExtractor.config.ansible.inventories_path.join(id)
      end

      def icinga_zones_path
        NetboxExtractor.config.icinga.zones_path.join(id)
      end
    end
  end
end
