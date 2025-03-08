#!/usr/bin/env ruby
# frozen_string_literal: true

require "erb"
require "yaml"
require "active_support/core_ext/string"

NETBOX_VERSION = "4.4.8"
REGEX = %r{\s+def (\w+_list)\(}

TEMPLATE = <<~TEMPLATE
module NetboxExtractor
  module Controllers
    module TestApi
      module GET
        Log = ::Log.for("netbox-extractor.test_api.get")

        def self.with_debug(api, method, &)
          Log.info { "Calling \#{api}.\#{method}" }

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
            Log.info { "count: \#{result.size}" }
          else
            Log.info { "count: \#{result.count}" }
          end
          Log.debug { YAML.dump(result) }
        end

        <%- apis.each do |api, methods| -%>
          <%- next if methods.empty? -%>
        def self.test_<%= api %>
          <%= api %> = NetboxClient::<%= api.camelize %>.new
          <%- methods.each do |name| -%>
            <%- if skips.key?(api) && skips[api].keys.include?(name) -%>
              <%- input = skips[api][name] -%>
              <%- if input.nil? -%>
          # with_debug("<%= api %>", "<%= name %>") { <%= api %>.<%= name %> }
              <%- else -%>
          with_debug("<%= api %>", "<%= name %>") { <%= api %>.<%= name %>(<%= input %>) }
              <%- end -%>
            <%- else -%>
          with_debug("<%= api %>", "<%= name %>") { <%= api %>.<%= name %> }
            <%- end -%>
          <%- end -%>
        end

        <%- end -%>
      end
    end
  end
end
TEMPLATE

SKIPS = {
  "dcim_api" => {
    "dcim_connected_device_list" => nil
  },
  "ipam_api" => {
    "ipam_asn_ranges_available_asns_list" => 1,
    "ipam_ip_ranges_available_ips_list" => 1,
    "ipam_prefixes_available_ips_list" => 1,
    "ipam_prefixes_available_prefixes_list" => 1,
    "ipam_vlan_groups_available_vlans_list" => 1,
    "ipam_vlan_groups_list" => nil
  }
}.freeze

def fetch_apis_methods(path)
  apis = {}
  Dir[path].each do |file|
    api = File.basename(file, File.extname(file))
    data = File.read(file)
    methods = data.split("\n")
                  .grep(REGEX)
                  .map { |i| i.match(REGEX)[1] }
    apis[api] = methods
  end
  apis
end

def render_template(template, locals)
  ERB.new(template, trim_mode: "-").result_with_hash(locals)
end

def write_file(file, content)
  File.write(file, content)
  %x(crystal tool format #{file})
  puts "Generated file: #{file}"
end

path = "vendor/netbox-client.#{NETBOX_VERSION}/src/netbox-client/api/*.cr"
apis = fetch_apis_methods(path)
content = render_template(TEMPLATE, apis: apis, skips: SKIPS)
dest_file = "src/netbox_extractor/controllers/test_api/get.cr"
write_file(dest_file, content)
