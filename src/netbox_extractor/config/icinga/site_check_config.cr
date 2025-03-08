module NetboxExtractor
  module Config
    module Icinga
      class SiteCheckConfig
        include YAML::Serializable

        property host : String
        property check_type : String?
        property notification_period : String?

        property check_drac : Checks::Drac?
        property check_mysql : Checks::Mysql?
        property check_netapp : Checks::Netapp?
        property check_nfs : Checks::NFS?
        property check_partitions : Checks::Partitions?
        property check_php : Checks::Php?
        property check_postgres : Checks::Postgres?
        property check_rabbit : Checks::Rabbit?
      end
    end
  end
end
