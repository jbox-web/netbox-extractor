module NetboxExtractor
  module Config
    module Icinga
      # One entry of `icinga.checks_config:`: per-host Icinga2 check tuning keyed
      # by `host`. Each optional `check_*` property, when present, attaches the
      # corresponding service check (DRAC, ESX, MySQL, etc.) with its parameters.
      class SiteCheckConfig
        include YAML::Serializable

        property host : String
        property check_type : String?
        property notification_period : String?

        property check_drac : Checks::Drac?
        property check_esx : Checks::Esx?
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
