module NetboxExtractor
  module Controllers
    module TestApi
      Log = ::Log.for("netbox-extractor.test_api")

      def self.test_dcim
        dcim_api = NetboxClient::DcimApi.new

        puts YAML.dump(dcim_api.dcim_cable_terminations_list)
        puts YAML.dump(dcim_api.dcim_cables_list)

        # puts YAML.dump(dcim_api.dcim_connected_device_list)

        puts YAML.dump(dcim_api.dcim_console_port_templates_list)
        puts YAML.dump(dcim_api.dcim_console_ports_list)
        puts YAML.dump(dcim_api.dcim_console_server_port_templates_list)
        puts YAML.dump(dcim_api.dcim_console_server_ports_list)
        puts YAML.dump(dcim_api.dcim_device_bay_templates_list)
        puts YAML.dump(dcim_api.dcim_device_bays_list)
        puts YAML.dump(dcim_api.dcim_device_roles_list)
        puts YAML.dump(dcim_api.dcim_device_types_list)
        puts YAML.dump(dcim_api.dcim_devices_list)
        puts YAML.dump(dcim_api.dcim_front_port_templates_list)
        puts YAML.dump(dcim_api.dcim_front_ports_list)
        puts YAML.dump(dcim_api.dcim_interface_templates_list)
        puts YAML.dump(dcim_api.dcim_interfaces_list)
        puts YAML.dump(dcim_api.dcim_inventory_item_roles_list)
        puts YAML.dump(dcim_api.dcim_inventory_item_templates_list)
        puts YAML.dump(dcim_api.dcim_inventory_items_list)
        puts YAML.dump(dcim_api.dcim_locations_list)
        puts YAML.dump(dcim_api.dcim_mac_addresses_list)
        puts YAML.dump(dcim_api.dcim_manufacturers_list)
        puts YAML.dump(dcim_api.dcim_module_bay_templates_list)
        puts YAML.dump(dcim_api.dcim_module_bays_list)
        puts YAML.dump(dcim_api.dcim_module_types_list)
        puts YAML.dump(dcim_api.dcim_modules_list)
        puts YAML.dump(dcim_api.dcim_platforms_list)
        puts YAML.dump(dcim_api.dcim_power_feeds_list)
        puts YAML.dump(dcim_api.dcim_power_outlet_templates_list)
        puts YAML.dump(dcim_api.dcim_power_outlets_list)
        puts YAML.dump(dcim_api.dcim_power_panels_list)
        puts YAML.dump(dcim_api.dcim_power_port_templates_list)
        puts YAML.dump(dcim_api.dcim_power_ports_list)
        puts YAML.dump(dcim_api.dcim_rack_reservations_list)
        puts YAML.dump(dcim_api.dcim_rack_roles_list)
        puts YAML.dump(dcim_api.dcim_rack_types_list)
        puts YAML.dump(dcim_api.dcim_racks_list)
        puts YAML.dump(dcim_api.dcim_rear_port_templates_list)
        puts YAML.dump(dcim_api.dcim_rear_ports_list)
        puts YAML.dump(dcim_api.dcim_regions_list)
        puts YAML.dump(dcim_api.dcim_site_groups_list)
        puts YAML.dump(dcim_api.dcim_sites_list)
        puts YAML.dump(dcim_api.dcim_virtual_chassis_list)
        puts YAML.dump(dcim_api.dcim_virtual_device_contexts_list)
      end
    end
  end
end
