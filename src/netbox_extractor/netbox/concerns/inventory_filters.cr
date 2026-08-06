module NetboxExtractor
  module Netbox
    # Shared host-filtering mixin: drops objects with unsafe/blank names, applies
    # the site's `include_objects`/`exclude_objects` lists, and keeps only
    # powered-on objects. Expects the including type to provide `@site`.
    module InventoryFilters
      # Constants resolve lexically, so a bare `Log` in these methods binds to
      # the top-level logger (empty source) rather than to the including
      # inventory's own `Log` — the warnings below were landing on the root
      # source, unattributable and unreachable by a per-source log level. The
      # mixin therefore carries its own named source; the site still comes from
      # the fiber-local `Log.context` the inventories set.
      Log = ::Log.for("netbox-extractor.inventory_filters")

      # A nil or path-unsafe name yields filenames like ".conf" (two such objects
      # collide and overwrite) or lets a "/"/".." escape the output dir, so such
      # objects are dropped up front (C8).
      SAFE_NAME = /\A[A-Za-z0-9._-]+\z/

      private def filter_objects(objects)
        objects
          .select { |h| valid_object_name?(h.name) }
          .select { |h| !host_excluded?(h.name) && hosts_included?(h.name) }
          .select { |h| object_powered_on?(h) }
      end

      # An object with no status at all is dropped like a powered-off one, but
      # that is a gap in the Netbox data rather than a deliberate state, so it is
      # reported. An explicit non-active status stays silent: that is the filter
      # doing its job.
      # An object with no platform matches no OS family, so it disappears from
      # every output while still carrying a configured role — nothing else would
      # ever mention it. An object whose platform belongs to another family is
      # dropped silently: that is the selection working as intended. A host of a
      # role declined in several OS families is reported once per family, which
      # is the price of reporting at the point of exclusion.
      private def object_matches_os?(object, os)
        return true if object.netbox_is_os?(os)

        Log.warn { "Skipping object with no platform set in Netbox: #{object.name}" } unless object.netbox_platform_known?
        false
      end

      private def object_powered_on?(object)
        return true if object.netbox_powered_on?

        Log.warn { "Skipping object with no status set in Netbox: #{object.name}" } unless object.netbox_status_known?
        false
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
