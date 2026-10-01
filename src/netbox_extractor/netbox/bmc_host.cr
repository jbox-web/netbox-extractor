require "../patches/netbox_client"

module NetboxExtractor
  module Netbox
    # A BMC (iDRAC, iLO) modelled as the out-of-band IP of the server it manages:
    # the server's `oob_ip`, assigned to its management interface.
    #
    # It stands in for the device of role `network-bmc` it replaces and answers
    # the same `netbox_*` helpers, so monitoring renders the very same host: named
    # after the IP's DNS name, addressed and tagged by the IP, powered on while
    # the IP is active, with the server's vendor, and the interface's name as
    # model and platform (`iDrac9`, platform slug `idrac9`) — the values the BMC
    # device carried in its device type and platform.
    class BmcHost
      include NetboxExtractor::Patches::NetboxClient

      ROLE = "network-bmc"

      # The shape the shared helpers read off a Netbox role or platform.
      record Slug, slug : String

      # The shape the shared helpers read off a primary IP.
      record Address, address : String

      getter name : String
      getter interface_name : String

      def initialize(@server : NetboxClient::DeviceWithConfigContext, @ip : NetboxClient::IPAddress,
                     @name : String, @interface_name : String)
      end

      # Name of the server whose out-of-band IP this is.
      def server_name
        @server.name
      end

      def role
        Slug.new(ROLE)
      end

      def platform
        Slug.new(@interface_name.downcase)
      end

      def tags
        @ip.tags
      end

      def status
        @ip.status
      end

      def primary_ip
        Address.new(@ip.address)
      end

      # Same rule as a device: a `network-*` role always forces SNMP.
      def netbox_check_by_snmp?
        super || netbox_role.starts_with?("network-")
      end

      def netbox_hosting_node
        nil
      end

      def netbox_host_type
        "physical"
      end

      # The BMC's vendor is the server's.
      def netbox_vendor_name
        @server.device_type.try &.manufacturer.try &.name
      end

      def netbox_vendor_model
        @interface_name
      end

      def netbox_icinga_subdir
        ROLE
      end
    end
  end
end
