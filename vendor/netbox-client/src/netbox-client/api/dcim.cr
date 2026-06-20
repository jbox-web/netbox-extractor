require "json"

module NetboxClient
  module Api
  class Dcim
    def initialize(@conn : Connection); end

    #  This endpoint allows a user to determine what device (if any) is connected to a given peer device and peer interface. This is useful in a situation where a device boots with no configuration, but can detect its neighbors via a protocol such as LLDP. Two query parameters must be included in the request:  * &#x60;peer_device&#x60;: The name of the peer device * &#x60;peer_interface&#x60;: The name of the peer interface
    def connected_device_list(*, peer_device : String? = nil, peer_interface : String? = nil) : Response(Array(NetboxClient::Device))
      @conn.request(Array(NetboxClient::Device),
        method: :GET,
        path: "/api/dcim/connected-device/",
        query: { "peer_device" => peer_device, "peer_interface" => peer_interface },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
