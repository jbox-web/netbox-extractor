module NetboxExtractor
  class InventoryLoader
    Log = ::Log.for("netbox-extractor.inventory_loader")

    def initialize(@site : NetboxExtractor::Config::Site)
      @devices = [] of NetboxClient::DeviceWithConfigContext
      @vms = [] of NetboxClient::VirtualMachineWithConfigContext

      @dcim_api = NetboxClient::DcimApi.new
      @virtualization_api = NetboxClient::VirtualizationApi.new
    end

    def load_inventory
      load_devices
      load_vms
    end

    def fetch_devices(role)
      filter_objects @devices.select(&.has_role?(role))
    end

    def fetch_vms(role, os)
      filter_objects @vms.select(&.has_role?(role)).select(&.is_os?(os))
    end

    private def load_devices
      results = [] of NetboxClient::DeviceWithConfigContext
      limit = NetboxExtractor.config.netbox.fetch_limit

      begin
        data = @dcim_api.dcim_devices_list(limit: limit, site: [@site.id])
        Log.info { "[#{@site.id}] Loaded devices: #{data.results.size}/#{data.count}" }
        results += data.results
      rescue ex : Socket::Addrinfo::Error
        Log.error { "[#{@site.id}] #{ex.message}" }
      else
        @devices = results
      end
    end

    private def load_vms
      results = [] of NetboxClient::VirtualMachineWithConfigContext
      limit = NetboxExtractor.config.netbox.fetch_limit

      begin
        data = @virtualization_api.virtualization_virtual_machines_list(limit: limit, site: [@site.id])
        Log.info { "[#{@site.id}] Loaded vms: #{data.results.size}/#{data.count}" }
        results += data.results
      rescue ex : Socket::Addrinfo::Error
        Log.error { "[#{@site.id}] #{ex.message}" }
      else
        @vms = results
      end
    end

    private def filter_objects(objects)
      objects
        .select { |h| !host_excluded?(h.name) && hosts_included?(h.name) }
        .select(&.powered_on?)
    end

    private def host_excluded?(host)
      return false if @site.exclude_objects.empty?

      @site.exclude_objects.includes?(host)
    end

    private def hosts_included?(host)
      return true if @site.include_objects.empty?

      @site.include_objects.includes?(host)
    end
  end
end
