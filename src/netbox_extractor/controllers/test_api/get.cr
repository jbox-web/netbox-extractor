module NetboxExtractor
  module Controllers
    module TestApi
      module GET
        Log = ::Log.for("netbox-extractor.test_api.get")

        def self.with_debug(api, method, &)
          Log.info { "Calling #{api}.#{method}" }

          begin
            result = yield
          rescue e : Exception
            Log.warn { e.message }
          else
            log_result(result)
          end
        end

        def self.log_result(result)
          if result.is_a?(Array)
            Log.info { "count: #{result.size}" }
          else
            Log.info { "count: #{result.count}" }
          end
          Log.debug { YAML.dump(result) }
        end

        def self.test_circuits_api
          circuits_api = NetboxClient::CircuitsApi.new
          with_debug("circuits_api", "circuits_circuit_group_assignments_list") { circuits_api.circuits_circuit_group_assignments_list }
          with_debug("circuits_api", "circuits_circuit_groups_list") { circuits_api.circuits_circuit_groups_list }
          with_debug("circuits_api", "circuits_circuit_terminations_list") { circuits_api.circuits_circuit_terminations_list }
          with_debug("circuits_api", "circuits_circuit_types_list") { circuits_api.circuits_circuit_types_list }
          with_debug("circuits_api", "circuits_circuits_list") { circuits_api.circuits_circuits_list }
          with_debug("circuits_api", "circuits_provider_accounts_list") { circuits_api.circuits_provider_accounts_list }
          with_debug("circuits_api", "circuits_provider_networks_list") { circuits_api.circuits_provider_networks_list }
          with_debug("circuits_api", "circuits_providers_list") { circuits_api.circuits_providers_list }
          with_debug("circuits_api", "circuits_virtual_circuit_terminations_list") { circuits_api.circuits_virtual_circuit_terminations_list }
          with_debug("circuits_api", "circuits_virtual_circuit_types_list") { circuits_api.circuits_virtual_circuit_types_list }
          with_debug("circuits_api", "circuits_virtual_circuits_list") { circuits_api.circuits_virtual_circuits_list }
        end

        def self.test_core_api
          core_api = NetboxClient::CoreApi.new
          with_debug("core_api", "core_data_files_list") { core_api.core_data_files_list }
          with_debug("core_api", "core_data_sources_list") { core_api.core_data_sources_list }
          with_debug("core_api", "core_jobs_list") { core_api.core_jobs_list }
          with_debug("core_api", "core_object_changes_list") { core_api.core_object_changes_list }
          with_debug("core_api", "core_object_types_list") { core_api.core_object_types_list }
        end

        def self.test_dcim_api
          dcim_api = NetboxClient::DcimApi.new
          with_debug("dcim_api", "dcim_cable_terminations_list") { dcim_api.dcim_cable_terminations_list }
          with_debug("dcim_api", "dcim_cables_list") { dcim_api.dcim_cables_list }
          # with_debug("dcim_api", "dcim_connected_device_list") { dcim_api.dcim_connected_device_list }
          with_debug("dcim_api", "dcim_console_port_templates_list") { dcim_api.dcim_console_port_templates_list }
          with_debug("dcim_api", "dcim_console_ports_list") { dcim_api.dcim_console_ports_list }
          with_debug("dcim_api", "dcim_console_server_port_templates_list") { dcim_api.dcim_console_server_port_templates_list }
          with_debug("dcim_api", "dcim_console_server_ports_list") { dcim_api.dcim_console_server_ports_list }
          with_debug("dcim_api", "dcim_device_bay_templates_list") { dcim_api.dcim_device_bay_templates_list }
          with_debug("dcim_api", "dcim_device_bays_list") { dcim_api.dcim_device_bays_list }
          with_debug("dcim_api", "dcim_device_roles_list") { dcim_api.dcim_device_roles_list }
          with_debug("dcim_api", "dcim_device_types_list") { dcim_api.dcim_device_types_list }
          with_debug("dcim_api", "dcim_devices_list") { dcim_api.dcim_devices_list }
          with_debug("dcim_api", "dcim_front_port_templates_list") { dcim_api.dcim_front_port_templates_list }
          with_debug("dcim_api", "dcim_front_ports_list") { dcim_api.dcim_front_ports_list }
          with_debug("dcim_api", "dcim_interface_templates_list") { dcim_api.dcim_interface_templates_list }
          with_debug("dcim_api", "dcim_interfaces_list") { dcim_api.dcim_interfaces_list }
          with_debug("dcim_api", "dcim_inventory_item_roles_list") { dcim_api.dcim_inventory_item_roles_list }
          with_debug("dcim_api", "dcim_inventory_item_templates_list") { dcim_api.dcim_inventory_item_templates_list }
          with_debug("dcim_api", "dcim_inventory_items_list") { dcim_api.dcim_inventory_items_list }
          with_debug("dcim_api", "dcim_locations_list") { dcim_api.dcim_locations_list }
          with_debug("dcim_api", "dcim_mac_addresses_list") { dcim_api.dcim_mac_addresses_list }
          with_debug("dcim_api", "dcim_manufacturers_list") { dcim_api.dcim_manufacturers_list }
          with_debug("dcim_api", "dcim_module_bay_templates_list") { dcim_api.dcim_module_bay_templates_list }
          with_debug("dcim_api", "dcim_module_bays_list") { dcim_api.dcim_module_bays_list }
          with_debug("dcim_api", "dcim_module_type_profiles_list") { dcim_api.dcim_module_type_profiles_list }
          with_debug("dcim_api", "dcim_module_types_list") { dcim_api.dcim_module_types_list }
          with_debug("dcim_api", "dcim_modules_list") { dcim_api.dcim_modules_list }
          with_debug("dcim_api", "dcim_platforms_list") { dcim_api.dcim_platforms_list }
          with_debug("dcim_api", "dcim_power_feeds_list") { dcim_api.dcim_power_feeds_list }
          with_debug("dcim_api", "dcim_power_outlet_templates_list") { dcim_api.dcim_power_outlet_templates_list }
          with_debug("dcim_api", "dcim_power_outlets_list") { dcim_api.dcim_power_outlets_list }
          with_debug("dcim_api", "dcim_power_panels_list") { dcim_api.dcim_power_panels_list }
          with_debug("dcim_api", "dcim_power_port_templates_list") { dcim_api.dcim_power_port_templates_list }
          with_debug("dcim_api", "dcim_power_ports_list") { dcim_api.dcim_power_ports_list }
          with_debug("dcim_api", "dcim_rack_reservations_list") { dcim_api.dcim_rack_reservations_list }
          with_debug("dcim_api", "dcim_rack_roles_list") { dcim_api.dcim_rack_roles_list }
          with_debug("dcim_api", "dcim_rack_types_list") { dcim_api.dcim_rack_types_list }
          with_debug("dcim_api", "dcim_racks_list") { dcim_api.dcim_racks_list }
          with_debug("dcim_api", "dcim_rear_port_templates_list") { dcim_api.dcim_rear_port_templates_list }
          with_debug("dcim_api", "dcim_rear_ports_list") { dcim_api.dcim_rear_ports_list }
          with_debug("dcim_api", "dcim_regions_list") { dcim_api.dcim_regions_list }
          with_debug("dcim_api", "dcim_site_groups_list") { dcim_api.dcim_site_groups_list }
          with_debug("dcim_api", "dcim_sites_list") { dcim_api.dcim_sites_list }
          with_debug("dcim_api", "dcim_virtual_chassis_list") { dcim_api.dcim_virtual_chassis_list }
          with_debug("dcim_api", "dcim_virtual_device_contexts_list") { dcim_api.dcim_virtual_device_contexts_list }
        end

        def self.test_extras_api
          extras_api = NetboxClient::ExtrasApi.new
          with_debug("extras_api", "extras_bookmarks_list") { extras_api.extras_bookmarks_list }
          with_debug("extras_api", "extras_config_context_profiles_list") { extras_api.extras_config_context_profiles_list }
          with_debug("extras_api", "extras_config_contexts_list") { extras_api.extras_config_contexts_list }
          with_debug("extras_api", "extras_config_templates_list") { extras_api.extras_config_templates_list }
          with_debug("extras_api", "extras_custom_field_choice_sets_list") { extras_api.extras_custom_field_choice_sets_list }
          with_debug("extras_api", "extras_custom_fields_list") { extras_api.extras_custom_fields_list }
          with_debug("extras_api", "extras_custom_links_list") { extras_api.extras_custom_links_list }
          with_debug("extras_api", "extras_event_rules_list") { extras_api.extras_event_rules_list }
          with_debug("extras_api", "extras_export_templates_list") { extras_api.extras_export_templates_list }
          with_debug("extras_api", "extras_image_attachments_list") { extras_api.extras_image_attachments_list }
          with_debug("extras_api", "extras_journal_entries_list") { extras_api.extras_journal_entries_list }
          with_debug("extras_api", "extras_notification_groups_list") { extras_api.extras_notification_groups_list }
          with_debug("extras_api", "extras_notifications_list") { extras_api.extras_notifications_list }
          with_debug("extras_api", "extras_object_types_list") { extras_api.extras_object_types_list }
          with_debug("extras_api", "extras_saved_filters_list") { extras_api.extras_saved_filters_list }
          with_debug("extras_api", "extras_scripts_list") { extras_api.extras_scripts_list }
          with_debug("extras_api", "extras_subscriptions_list") { extras_api.extras_subscriptions_list }
          with_debug("extras_api", "extras_table_configs_list") { extras_api.extras_table_configs_list }
          with_debug("extras_api", "extras_tagged_objects_list") { extras_api.extras_tagged_objects_list }
          with_debug("extras_api", "extras_tags_list") { extras_api.extras_tags_list }
          with_debug("extras_api", "extras_webhooks_list") { extras_api.extras_webhooks_list }
        end

        def self.test_ipam_api
          ipam_api = NetboxClient::IpamApi.new
          with_debug("ipam_api", "ipam_aggregates_list") { ipam_api.ipam_aggregates_list }
          with_debug("ipam_api", "ipam_asn_ranges_available_asns_list") { ipam_api.ipam_asn_ranges_available_asns_list(1) }
          with_debug("ipam_api", "ipam_asn_ranges_list") { ipam_api.ipam_asn_ranges_list }
          with_debug("ipam_api", "ipam_asns_list") { ipam_api.ipam_asns_list }
          with_debug("ipam_api", "ipam_fhrp_group_assignments_list") { ipam_api.ipam_fhrp_group_assignments_list }
          with_debug("ipam_api", "ipam_fhrp_groups_list") { ipam_api.ipam_fhrp_groups_list }
          with_debug("ipam_api", "ipam_ip_addresses_list") { ipam_api.ipam_ip_addresses_list }
          with_debug("ipam_api", "ipam_ip_ranges_available_ips_list") { ipam_api.ipam_ip_ranges_available_ips_list(1) }
          with_debug("ipam_api", "ipam_ip_ranges_list") { ipam_api.ipam_ip_ranges_list }
          with_debug("ipam_api", "ipam_prefixes_available_ips_list") { ipam_api.ipam_prefixes_available_ips_list(1) }
          with_debug("ipam_api", "ipam_prefixes_available_prefixes_list") { ipam_api.ipam_prefixes_available_prefixes_list(1) }
          with_debug("ipam_api", "ipam_prefixes_list") { ipam_api.ipam_prefixes_list }
          with_debug("ipam_api", "ipam_rirs_list") { ipam_api.ipam_rirs_list }
          with_debug("ipam_api", "ipam_roles_list") { ipam_api.ipam_roles_list }
          with_debug("ipam_api", "ipam_route_targets_list") { ipam_api.ipam_route_targets_list }
          with_debug("ipam_api", "ipam_service_templates_list") { ipam_api.ipam_service_templates_list }
          with_debug("ipam_api", "ipam_services_list") { ipam_api.ipam_services_list }
          with_debug("ipam_api", "ipam_vlan_groups_available_vlans_list") { ipam_api.ipam_vlan_groups_available_vlans_list(1) }
          # with_debug("ipam_api", "ipam_vlan_groups_list") { ipam_api.ipam_vlan_groups_list }
          with_debug("ipam_api", "ipam_vlan_translation_policies_list") { ipam_api.ipam_vlan_translation_policies_list }
          with_debug("ipam_api", "ipam_vlan_translation_rules_list") { ipam_api.ipam_vlan_translation_rules_list }
          with_debug("ipam_api", "ipam_vlans_list") { ipam_api.ipam_vlans_list }
          with_debug("ipam_api", "ipam_vrfs_list") { ipam_api.ipam_vrfs_list }
        end

        def self.test_tenancy_api
          tenancy_api = NetboxClient::TenancyApi.new
          with_debug("tenancy_api", "tenancy_contact_assignments_list") { tenancy_api.tenancy_contact_assignments_list }
          with_debug("tenancy_api", "tenancy_contact_groups_list") { tenancy_api.tenancy_contact_groups_list }
          with_debug("tenancy_api", "tenancy_contact_roles_list") { tenancy_api.tenancy_contact_roles_list }
          with_debug("tenancy_api", "tenancy_contacts_list") { tenancy_api.tenancy_contacts_list }
          with_debug("tenancy_api", "tenancy_tenant_groups_list") { tenancy_api.tenancy_tenant_groups_list }
          with_debug("tenancy_api", "tenancy_tenants_list") { tenancy_api.tenancy_tenants_list }
        end

        def self.test_users_api
          users_api = NetboxClient::UsersApi.new
          with_debug("users_api", "users_groups_list") { users_api.users_groups_list }
          with_debug("users_api", "users_permissions_list") { users_api.users_permissions_list }
          with_debug("users_api", "users_tokens_list") { users_api.users_tokens_list }
          with_debug("users_api", "users_users_list") { users_api.users_users_list }
        end

        def self.test_virtualization_api
          virtualization_api = NetboxClient::VirtualizationApi.new
          with_debug("virtualization_api", "virtualization_cluster_groups_list") { virtualization_api.virtualization_cluster_groups_list }
          with_debug("virtualization_api", "virtualization_cluster_types_list") { virtualization_api.virtualization_cluster_types_list }
          with_debug("virtualization_api", "virtualization_clusters_list") { virtualization_api.virtualization_clusters_list }
          with_debug("virtualization_api", "virtualization_interfaces_list") { virtualization_api.virtualization_interfaces_list }
          with_debug("virtualization_api", "virtualization_virtual_disks_list") { virtualization_api.virtualization_virtual_disks_list }
          with_debug("virtualization_api", "virtualization_virtual_machines_list") { virtualization_api.virtualization_virtual_machines_list }
        end

        def self.test_vpn_api
          vpn_api = NetboxClient::VpnApi.new
          with_debug("vpn_api", "vpn_ike_policies_list") { vpn_api.vpn_ike_policies_list }
          with_debug("vpn_api", "vpn_ike_proposals_list") { vpn_api.vpn_ike_proposals_list }
          with_debug("vpn_api", "vpn_ipsec_policies_list") { vpn_api.vpn_ipsec_policies_list }
          with_debug("vpn_api", "vpn_ipsec_profiles_list") { vpn_api.vpn_ipsec_profiles_list }
          with_debug("vpn_api", "vpn_ipsec_proposals_list") { vpn_api.vpn_ipsec_proposals_list }
          with_debug("vpn_api", "vpn_l2vpn_terminations_list") { vpn_api.vpn_l2vpn_terminations_list }
          with_debug("vpn_api", "vpn_l2vpns_list") { vpn_api.vpn_l2vpns_list }
          with_debug("vpn_api", "vpn_tunnel_groups_list") { vpn_api.vpn_tunnel_groups_list }
          with_debug("vpn_api", "vpn_tunnel_terminations_list") { vpn_api.vpn_tunnel_terminations_list }
          with_debug("vpn_api", "vpn_tunnels_list") { vpn_api.vpn_tunnels_list }
        end

        def self.test_wireless_api
          wireless_api = NetboxClient::WirelessApi.new
          with_debug("wireless_api", "wireless_wireless_lan_groups_list") { wireless_api.wireless_wireless_lan_groups_list }
          with_debug("wireless_api", "wireless_wireless_lans_list") { wireless_api.wireless_wireless_lans_list }
          with_debug("wireless_api", "wireless_wireless_links_list") { wireless_api.wireless_wireless_links_list }
        end
      end
    end
  end
end
