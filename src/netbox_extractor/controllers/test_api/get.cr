module NetboxExtractor
  module Controllers
    # Diagnostic controller that exercises the Netbox REST API surface.
    module TestApi
      # Smoke-tests read-only (`GET`/`list`) endpoints across every Netbox API
      # group, logging the result count of each call. Used to verify client
      # connectivity and OpenAPI compatibility against a live Netbox instance.
      module GET
        Log = ::Log.for("netbox-extractor.test_api.get")

        # Invokes the given API call block, logging the call and its result on
        # success or the exception message on failure. Failures are swallowed so
        # one broken endpoint does not abort the rest of the smoke test.
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

        # Logs the size of a returned collection (using `size` for arrays and
        # `count` otherwise) at info level and the full YAML dump at debug level.
        def self.log_result(result)
          if result.is_a?(Array)
            Log.info { "count: #{result.size}" }
          else
            Log.info { "count: #{result.count}" }
          end
          Log.debug { YAML.dump(result) }
        end

        # Lists every endpoint under the Netbox `circuits` API group.
        def self.test_circuits_api
          client = NetboxExtractor.client.circuits
          with_debug("circuits", "circuit_group_assignments.list") { client.circuit_group_assignments.list.value }
          with_debug("circuits", "circuit_groups.list") { client.circuit_groups.list.value }
          with_debug("circuits", "circuit_terminations.list") { client.circuit_terminations.list.value }
          with_debug("circuits", "circuit_types.list") { client.circuit_types.list.value }
          with_debug("circuits", "circuits.list") { client.circuits.list.value }
          with_debug("circuits", "provider_accounts.list") { client.provider_accounts.list.value }
          with_debug("circuits", "provider_networks.list") { client.provider_networks.list.value }
          with_debug("circuits", "providers.list") { client.providers.list.value }
          with_debug("circuits", "virtual_circuit_terminations.list") { client.virtual_circuit_terminations.list.value }
          with_debug("circuits", "virtual_circuit_types.list") { client.virtual_circuit_types.list.value }
          with_debug("circuits", "virtual_circuits.list") { client.virtual_circuits.list.value }
        end

        # Lists every endpoint under the Netbox `core` API group.
        def self.test_core_api
          client = NetboxExtractor.client.core
          with_debug("core", "data_files.list") { client.data_files.list.value }
          with_debug("core", "data_sources.list") { client.data_sources.list.value }
          with_debug("core", "jobs.list") { client.jobs.list.value }
          with_debug("core", "object_changes.list") { client.object_changes.list.value }
          with_debug("core", "object_types.list") { client.object_types.list.value }
        end

        # Lists every endpoint under the Netbox `dcim` (physical infrastructure)
        # API group.
        def self.test_dcim_api
          client = NetboxExtractor.client.dcim
          with_debug("dcim", "cable_terminations.list") { client.cable_terminations.list.value }
          with_debug("dcim", "cables.list") { client.cables.list.value }
          with_debug("dcim", "console_port_templates.list") { client.console_port_templates.list.value }
          with_debug("dcim", "console_ports.list") { client.console_ports.list.value }
          with_debug("dcim", "console_server_port_templates.list") { client.console_server_port_templates.list.value }
          with_debug("dcim", "console_server_ports.list") { client.console_server_ports.list.value }
          with_debug("dcim", "device_bay_templates.list") { client.device_bay_templates.list.value }
          with_debug("dcim", "device_bays.list") { client.device_bays.list.value }
          with_debug("dcim", "device_roles.list") { client.device_roles.list.value }
          with_debug("dcim", "device_types.list") { client.device_types.list.value }
          with_debug("dcim", "devices.list") { client.devices.list.value }
          with_debug("dcim", "front_port_templates.list") { client.front_port_templates.list.value }
          with_debug("dcim", "front_ports.list") { client.front_ports.list.value }
          with_debug("dcim", "interface_templates.list") { client.interface_templates.list.value }
          with_debug("dcim", "interfaces.list") { client.interfaces.list.value }
          with_debug("dcim", "inventory_item_roles.list") { client.inventory_item_roles.list.value }
          with_debug("dcim", "inventory_item_templates.list") { client.inventory_item_templates.list.value }
          with_debug("dcim", "inventory_items.list") { client.inventory_items.list.value }
          with_debug("dcim", "locations.list") { client.locations.list.value }
          with_debug("dcim", "mac_addresses.list") { client.mac_addresses.list.value }
          with_debug("dcim", "manufacturers.list") { client.manufacturers.list.value }
          with_debug("dcim", "module_bay_templates.list") { client.module_bay_templates.list.value }
          with_debug("dcim", "module_bays.list") { client.module_bays.list.value }
          with_debug("dcim", "module_type_profiles.list") { client.module_type_profiles.list.value }
          with_debug("dcim", "module_types.list") { client.module_types.list.value }
          with_debug("dcim", "modules.list") { client.modules.list.value }
          with_debug("dcim", "platforms.list") { client.platforms.list.value }
          with_debug("dcim", "power_feeds.list") { client.power_feeds.list.value }
          with_debug("dcim", "power_outlet_templates.list") { client.power_outlet_templates.list.value }
          with_debug("dcim", "power_outlets.list") { client.power_outlets.list.value }
          with_debug("dcim", "power_panels.list") { client.power_panels.list.value }
          with_debug("dcim", "power_port_templates.list") { client.power_port_templates.list.value }
          with_debug("dcim", "power_ports.list") { client.power_ports.list.value }
          with_debug("dcim", "rack_reservations.list") { client.rack_reservations.list.value }
          with_debug("dcim", "rack_roles.list") { client.rack_roles.list.value }
          with_debug("dcim", "rack_types.list") { client.rack_types.list.value }
          with_debug("dcim", "racks.list") { client.racks.list.value }
          with_debug("dcim", "rear_port_templates.list") { client.rear_port_templates.list.value }
          with_debug("dcim", "rear_ports.list") { client.rear_ports.list.value }
          with_debug("dcim", "regions.list") { client.regions.list.value }
          with_debug("dcim", "site_groups.list") { client.site_groups.list.value }
          with_debug("dcim", "sites.list") { client.sites.list.value }
          with_debug("dcim", "virtual_chassis.list") { client.virtual_chassis.list.value }
          with_debug("dcim", "virtual_device_contexts.list") { client.virtual_device_contexts.list.value }
        end

        # Lists every endpoint under the Netbox `extras` API group.
        def self.test_extras_api
          client = NetboxExtractor.client.extras
          with_debug("extras", "bookmarks.list") { client.bookmarks.list.value }
          with_debug("extras", "config_context_profiles.list") { client.config_context_profiles.list.value }
          with_debug("extras", "config_contexts.list") { client.config_contexts.list.value }
          with_debug("extras", "config_templates.list") { client.config_templates.list.value }
          with_debug("extras", "custom_field_choice_sets.list") { client.custom_field_choice_sets.list.value }
          with_debug("extras", "custom_fields.list") { client.custom_fields.list.value }
          with_debug("extras", "custom_links.list") { client.custom_links.list.value }
          with_debug("extras", "event_rules.list") { client.event_rules.list.value }
          with_debug("extras", "export_templates.list") { client.export_templates.list.value }
          with_debug("extras", "image_attachments.list") { client.image_attachments.list.value }
          with_debug("extras", "journal_entries.list") { client.journal_entries.list.value }
          with_debug("extras", "notification_groups.list") { client.notification_groups.list.value }
          with_debug("extras", "notifications.list") { client.notifications.list.value }
          with_debug("extras", "object_types.list") { client.object_types.list.value }
          with_debug("extras", "saved_filters.list") { client.saved_filters.list.value }
          with_debug("extras", "scripts.list") { client.scripts.list.value }
          with_debug("extras", "subscriptions.list") { client.subscriptions.list.value }
          with_debug("extras", "table_configs.list") { client.table_configs.list.value }
          with_debug("extras", "tagged_objects.list") { client.tagged_objects.list.value }
          with_debug("extras", "tags.list") { client.tags.list.value }
          with_debug("extras", "webhooks.list") { client.webhooks.list.value }
        end

        # Lists every endpoint under the Netbox `ipam` (IP address management)
        # API group.
        def self.test_ipam_api
          client = NetboxExtractor.client.ipam
          with_debug("ipam", "aggregates.list") { client.aggregates.list.value }
          with_debug("ipam", "asn_ranges.available_asns_list") { client.asn_ranges.available_asns_list(1).value }
          with_debug("ipam", "asn_ranges.list") { client.asn_ranges.list.value }
          with_debug("ipam", "asns.list") { client.asns.list.value }
          with_debug("ipam", "fhrp_group_assignments.list") { client.fhrp_group_assignments.list.value }
          with_debug("ipam", "fhrp_groups.list") { client.fhrp_groups.list.value }
          with_debug("ipam", "ip_addresses.list") { client.ip_addresses.list.value }
          with_debug("ipam", "ip_ranges.available_ips_list") { client.ip_ranges.available_ips_list(1).value }
          with_debug("ipam", "ip_ranges.list") { client.ip_ranges.list.value }
          with_debug("ipam", "prefixes.available_ips_list") { client.prefixes.available_ips_list(1).value }
          with_debug("ipam", "prefixes.available_prefixes_list") { client.prefixes.available_prefixes_list(1).value }
          with_debug("ipam", "prefixes.list") { client.prefixes.list.value }
          with_debug("ipam", "rirs.list") { client.rirs.list.value }
          with_debug("ipam", "roles.list") { client.roles.list.value }
          with_debug("ipam", "route_targets.list") { client.route_targets.list.value }
          with_debug("ipam", "service_templates.list") { client.service_templates.list.value }
          with_debug("ipam", "services.list") { client.services.list.value }
          with_debug("ipam", "vlan_groups.available_vlans_list") { client.vlan_groups.available_vlans_list(1).value }
          # with_debug("ipam", "vlan_groups.list") { client.vlan_groups.list.value }
          with_debug("ipam", "vlan_translation_policies.list") { client.vlan_translation_policies.list.value }
          with_debug("ipam", "vlan_translation_rules.list") { client.vlan_translation_rules.list.value }
          with_debug("ipam", "vlans.list") { client.vlans.list.value }
          with_debug("ipam", "vrfs.list") { client.vrfs.list.value }
        end

        # Lists every endpoint under the Netbox `tenancy` API group.
        def self.test_tenancy_api
          client = NetboxExtractor.client.tenancy
          with_debug("tenancy", "contact_assignments.list") { client.contact_assignments.list.value }
          with_debug("tenancy", "contact_groups.list") { client.contact_groups.list.value }
          with_debug("tenancy", "contact_roles.list") { client.contact_roles.list.value }
          with_debug("tenancy", "contacts.list") { client.contacts.list.value }
          with_debug("tenancy", "tenant_groups.list") { client.tenant_groups.list.value }
          with_debug("tenancy", "tenants.list") { client.tenants.list.value }
        end

        # Lists every endpoint under the Netbox `users` API group.
        def self.test_users_api
          client = NetboxExtractor.client.users
          with_debug("users", "groups.list") { client.groups.list.value }
          with_debug("users", "permissions.list") { client.permissions.list.value }
          with_debug("users", "tokens.list") { client.tokens.list.value }
          with_debug("users", "users.list") { client.users.list.value }
        end

        # Lists every endpoint under the Netbox `virtualization` API group.
        def self.test_virtualization_api
          client = NetboxExtractor.client.virtualization
          with_debug("virtualization", "cluster_groups.list") { client.cluster_groups.list.value }
          with_debug("virtualization", "cluster_types.list") { client.cluster_types.list.value }
          with_debug("virtualization", "clusters.list") { client.clusters.list.value }
          with_debug("virtualization", "interfaces.list") { client.interfaces.list.value }
          with_debug("virtualization", "virtual_disks.list") { client.virtual_disks.list.value }
          with_debug("virtualization", "virtual_machines.list") { client.virtual_machines.list.value }
        end

        # Lists every endpoint under the Netbox `vpn` API group.
        def self.test_vpn_api
          client = NetboxExtractor.client.vpn
          with_debug("vpn", "ike_policies.list") { client.ike_policies.list.value }
          with_debug("vpn", "ike_proposals.list") { client.ike_proposals.list.value }
          with_debug("vpn", "ipsec_policies.list") { client.ipsec_policies.list.value }
          with_debug("vpn", "ipsec_profiles.list") { client.ipsec_profiles.list.value }
          with_debug("vpn", "ipsec_proposals.list") { client.ipsec_proposals.list.value }
          with_debug("vpn", "l2vpn_terminations.list") { client.l2vpn_terminations.list.value }
          with_debug("vpn", "l2vpns.list") { client.l2vpns.list.value }
          with_debug("vpn", "tunnel_groups.list") { client.tunnel_groups.list.value }
          with_debug("vpn", "tunnel_terminations.list") { client.tunnel_terminations.list.value }
          with_debug("vpn", "tunnels.list") { client.tunnels.list.value }
        end

        # Lists every endpoint under the Netbox `wireless` API group.
        def self.test_wireless_api
          client = NetboxExtractor.client.wireless
          with_debug("wireless", "wireless_lan_groups.list") { client.wireless_lan_groups.list.value }
          with_debug("wireless", "wireless_lans.list") { client.wireless_lans.list.value }
          with_debug("wireless", "wireless_links.list") { client.wireless_links.list.value }
        end
      end
    end
  end
end
