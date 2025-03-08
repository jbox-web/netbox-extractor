module NetboxExtractor
  module Config
    module Icinga
      module Checks
        class Rabbit
          include YAML::Serializable

          class Queue
            include YAML::Serializable

            property name : String
            property warning : Int32
            property critical : Int32

            def to_h
              {
                "name"     => name,
                "warning"  => warning,
                "critical" => critical,
              }
            end
          end

          property username : String
          property password : String
          property node : String
          property queues : Array(Queue)

          def to_h
            {
              "username" => username,
              "password" => password,
              "node"     => node,
              "queues"   => queues.map(&.to_h),
            }
          end
        end
      end
    end
  end
end
