module NetboxExtractor
  module Config
    module Icinga
      # One entry of `icinga.check_vhosts:`: a group of HTTP vhost checks written
      # into the `subdir` folder of the site's Icinga2 zone.
      class SiteCheckVhosts
        include YAML::Serializable

        # A single HTTP vhost check (one `vhosts:` entry). Fields map to
        # `check_http` parameters; SSL and certificate checking default to on.
        class Vhost
          include YAML::Serializable

          property host : String
          property? http_ssl : Bool = true
          property? http_check_cert : Bool = true
          property? http_sni : Bool = false
          property http_uri : String?
          property http_address : String?
          property http_expect : String?
          property http_port : Int32?
          property http_expect_body_regex : String?
          property notification_period : String?
          property tags : Array(String)?

          # String-keyed hash of this vhost's settings for template rendering.
          # Optional fields are only included when set, so the template can test
          # for presence.
          def to_h
            hash = {
              "host"            => host,
              "http_ssl"        => http_ssl?,
              "http_check_cert" => http_check_cert?,
            }

            if http_sni?
              hash = hash.merge({"http_sni" => http_sni?})
            end

            if uri = http_uri
              hash = hash.merge({"http_uri" => uri})
            end

            if address = http_address
              hash = hash.merge({"http_address" => address})
            end

            if expect = http_expect
              hash = hash.merge({"http_expect" => expect})
            end

            if port = http_port
              hash = hash.merge({"http_port" => port})
            end

            if regex = http_expect_body_regex
              hash = hash.merge({"http_expect_body_regex" => regex})
            end

            if period = notification_period
              hash = hash.merge({"notification_period" => period})
            end

            if ttags = tags
              hash = hash.merge({"tags" => ttags})
            end

            hash
          end

          # Basename of the generated Icinga2 config file for this vhost.
          def icinga_filename
            "#{host}.conf"
          end
        end

        property subdir : String
        property vhosts : Array(Vhost) = [] of Vhost
      end
    end
  end
end
