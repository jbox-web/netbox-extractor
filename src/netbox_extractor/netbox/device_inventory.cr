require "./concerns/*"

module NetboxExtractor
  module Netbox
    # Loads the site's DCIM devices from Netbox and exposes them filtered by role
    # and by the shared host filters (`InventoryFilters`).
    #
    # A server's out-of-band IP (`oob_ip`) also yields a `BmcHost`, served with
    # the devices of role `network-bmc`: a BMC is modelled either way while the
    # BMC devices are migrated to their servers, and monitoring sees no change.
    class DeviceInventory
      include NetboxExtractor::Netbox::InventoryMacros
      include NetboxExtractor::Netbox::InventoryFilters

      Log = ::Log.for("netbox-extractor.device_inventory")

      # Out-of-band IP ids per request: 100 ids of up to 10 digits stay under
      # 1400 bytes of query string.
      OOB_IP_BATCH_SIZE = 100

      # Binds the inventory to a site and Netbox client; the client defaults to
      # the shared `NetboxExtractor.client` but is injectable for testing.
      def initialize(@site : NetboxExtractor::Config::Site, @client : NetboxClient::Client = NetboxExtractor.client)
        Log.context.set site: @site.id

        @devices = [] of NetboxClient::DeviceWithConfigContext
        @oob_ip_ids = [] of Int32
        @oob_ips = [] of NetboxClient::IPAddress
        @bmc_hosts = [] of BmcHost
      end

      # Fetches every device for the site into memory, then the out-of-band IPs
      # they designate; re-raises on load failure.
      def load!
        load_devices
        # One `id=` per IP in the query string: asked for in batches, so the
        # request line stays under the web server's limit (gunicorn: 4094
        # bytes) whatever the site's size. No id, no batch, no call: no id
        # filter at all would list every IP of Netbox.
        @oob_ips = @devices.compact_map(&.oob_ip.try(&.id)).in_slices_of(OOB_IP_BATCH_SIZE).flat_map do |ids|
          @oob_ip_ids = ids
          load_oob_ips
          @oob_ips
        end
        @bmc_hosts = build_bmc_hosts
      end

      # Returns the loaded devices having the given `role`, after applying the
      # shared host filters (name safety, include/exclude lists, powered-on).
      # Role `network-bmc` also returns the BMC hosts built from `oob_ip`,
      # merged into the devices' order: the devices keep the order Netbox
      # lists them in, and a BMC moved from a device to its server's oob_ip
      # takes the place its device had in the generated inventories.
      def fetch_devices(role)
        devices = @devices.select(&.netbox_has_role?(role))
        hosts = [] of NetboxClient::DeviceWithConfigContext | BmcHost
        bmc_hosts = role == BmcHost::ROLE ? @bmc_hosts.sort { |a, b| Netbox.natural_compare(a.name, b.name) } : [] of BmcHost

        next_bmc = 0
        devices.each do |device|
          while next_bmc < bmc_hosts.size && Netbox.natural_compare(bmc_hosts[next_bmc].name, device.name.to_s) < 0
            hosts << bmc_hosts[next_bmc]
            next_bmc += 1
          end
          hosts << device
        end
        hosts.concat(bmc_hosts[next_bmc..])

        filter_objects hosts
      end

      # Names of every loaded device and BMC host, unfiltered. Used to report
      # config entries that designate a host the site does not have.
      def object_names
        @devices.compact_map(&.name) + @bmc_hosts.map(&.name)
      end

      # Role slugs carried by the loaded devices and BMC hosts. Used to report a
      # configured role that no object carries.
      def object_roles
        @devices.compact_map(&.netbox_role) + @bmc_hosts.map(&.netbox_role)
      end

      # Platform slugs carried by the loaded devices and BMC hosts, for
      # reporting slugs the OS detection cannot classify unambiguously.
      def object_platforms
        @devices.select(&.netbox_platform_known?).map(&.netbox_os_name) + @bmc_hosts.map(&.netbox_os_name)
      end

      # Names of loaded devices Netbox holds no platform for.
      def objects_without_platform
        @devices.reject(&.netbox_platform_known?).compact_map(&.name)
      end

      define_netbox_load name: :devices,
        klass: NetboxClient::DeviceWithConfigContext,
        method: "fetch_dcim_devices_list",
        ivar: "@devices",
        log: "Loaded devices"

      private def fetch_dcim_devices_list(limit, offset)
        @client.dcim.devices.list(limit: limit, offset: offset, site: [@site.id])
      end

      define_netbox_load name: :oob_ips,
        klass: NetboxClient::IPAddress,
        method: "fetch_oob_ips_list",
        ivar: "@oob_ips",
        log: "Loaded out-of-band IPs"

      private def fetch_oob_ips_list(limit, offset)
        @client.ipam.ip_addresses.list(limit: limit, offset: offset, id: @oob_ip_ids)
      end

      # One BMC host per server whose out-of-band IP carries a DNS name (the
      # host name) and sits on an interface (the BMC generation). A name still
      # held by a device is left to that device: the migration of a BMC device
      # to its server must never render the same host twice. Netbox does not
      # make a DNS name unique either: a name designated by two out-of-band
      # IPs goes to the first server, in Netbox's list order.
      private def build_bmc_hosts
        ips = @oob_ips.index_by(&.id)
        names = @devices.compact_map(&.name).to_set
        servers_by_name = {} of String => String?

        @devices.compact_map do |server|
          oob_ip = server.oob_ip || next
          ip = ips[oob_ip.id]? || next Log.warn { "#{server.name}: out-of-band IP #{oob_ip.address} not loaded, no BMC host" }

          name = ip.dns_name.try(&.presence) || next Log.warn { "#{server.name}: out-of-band IP #{ip.address} has no DNS name, no BMC host" }
          next Log.warn { "#{name}: still a Netbox device, the out-of-band IP of #{server.name} is not used" } if names.includes?(name)
          if servers_by_name.has_key?(name)
            next Log.warn { "#{name}: already the out-of-band IP of #{servers_by_name[name]}, the out-of-band IP of #{server.name} is not used" }
          end

          interface = ip.assigned_object.try(&.["name"]?).try(&.as_s?) ||
                      next Log.warn { "#{server.name}: out-of-band IP #{ip.address} is not on an interface, no BMC host" }

          servers_by_name[name] = server.name
          BmcHost.new(server, ip, name, interface)
        end
      end
    end
  end
end
