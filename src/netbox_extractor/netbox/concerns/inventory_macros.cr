module NetboxExtractor
  module Netbox
    # Mixin that generates the boilerplate `load_<name>` method each inventory
    # uses to pull a Netbox list endpoint into an instance variable.
    module InventoryMacros
      # Defines a `private def load_{name}` that paginates `method` via
      # `Pagination.load` into `ivar` and logs the loaded count.
      #
      # Transient failures (`NetboxClient::ApiError`, `IO::Error`, `Socket::Error`,
      # `JSON::ParseException`) are logged and re-raised so the caller aborts before
      # any destructive regeneration wipes existing output (C1/C2) — an empty result
      # must never be confused with a load failure.
      macro define_netbox_load(name, klass, method, ivar, log)
        private def load_{{name.id}}
          limit = NetboxExtractor.config.netbox.fetch_limit

          {{ivar.id}} = NetboxExtractor::Netbox::Pagination.load(Array({{klass.id}}), limit) do |page_limit, page_offset|
            {{method.id}}(limit: page_limit, offset: page_offset).value
          end

          Log.info { "{{log.id}}: #{ {{ivar.id}}.size }" }
        rescue ex : NetboxClient::ApiError | IO::Error | Socket::Error | JSON::ParseException
          # A transient load failure must never be mistaken for "zero objects":
          # re-raise so the caller aborts before any destructive regeneration step
          # (File.delete / rm_rf) wipes existing output (C1/C2).
          Log.error(exception: ex) { "{{log.id}}: load failed" }
          raise ex
        end
      end
    end
  end
end
