module NetboxExtractor
  module Config
    module Icinga
      module Checks
        # Maps to `check_rabbit:` under a host's `checks_config` entry:
        # credentials, target node, and per-queue depth thresholds for the
        # RabbitMQ check.
        class Rabbit
          include YAML::Serializable

          # One monitored RabbitMQ queue (an entry of `check_rabbit.queues:`) with
          # its warning/critical message-count thresholds.
          class Queue
            include YAML::Serializable

            property name : String
            property warning : Int32
            property critical : Int32

            # String-keyed hash of this queue's fields for template rendering.
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

          # String-keyed hash of this check's parameters for template rendering,
          # with each queue flattened via `Queue#to_h`.
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
