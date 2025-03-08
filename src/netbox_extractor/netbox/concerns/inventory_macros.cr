module NetboxExtractor
  module Netbox
    module InventoryMacros
      macro define_netbox_load(name, klass, method, ivar, log)
        private def load_{{name.id}}
          results = [] of {{klass.id}}
          limit = NetboxExtractor.config.netbox.fetch_limit
          offset = 0
          total = 0

          begin
            loop do
              data = {{method.id}}(limit: limit, offset: offset)
              total = data.count
              results += data.results
              offset += limit
              Log.debug { "{{log.id}}: #{results.size}/#{total}" }
              break if data._next.nil?
            end
          rescue ex : Socket::Addrinfo::Error
            Log.error { "#{ex.message}" }
          else
            Log.info { "{{log.id}}: #{results.size}/#{total}" }
            {{ivar.id}} = results
          end
        end
      end
    end
  end
end
