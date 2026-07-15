module NetboxExtractor
  module Netbox
    module InventoryFilters
      # A nil or path-unsafe name yields filenames like ".conf" (two such objects
      # collide and overwrite) or lets a "/"/".." escape the output dir, so such
      # objects are dropped up front (C8).
      SAFE_NAME = /\A[A-Za-z0-9._-]+\z/

      private def filter_objects(objects)
        objects
          .select { |h| valid_object_name?(h.name) }
          .select { |h| !host_excluded?(h.name) && hosts_included?(h.name) }
          .select(&.netbox_powered_on?)
      end

      private def valid_object_name?(name)
        return false if name.nil? || name.empty?
        return true if name.matches?(SAFE_NAME)

        Log.warn { "Skipping object with unsafe name: #{name.inspect}" }
        false
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
