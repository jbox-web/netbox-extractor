module NetboxExtractor
  module Config
    module Icinga
      class SiteCheckVhosts
        include YAML::Serializable

        class Vhost
          include YAML::Serializable

          property host : String
          property? http_ssl : Bool = true
          property? http_check_cert : Bool = true
          property http_uri : String?
          property http_address : String?
          property http_expect : String?
          property http_port : Int32?
          property http_expect_body_regex : String?
          property notification_period : String?
          property tags : Array(String)?

          def to_h
            hash = {
              "host"            => host,
              "http_ssl"        => http_ssl?,
              "http_check_cert" => http_check_cert?,
            }

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
