module NetboxExtractor
  module Netbox
    module InventoryFilters
      private def filter_objects(objects)
        objects
          .select { |h| !host_excluded?(h.name) && hosts_included?(h.name) }
          .select(&.netbox_powered_on?)
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
end
