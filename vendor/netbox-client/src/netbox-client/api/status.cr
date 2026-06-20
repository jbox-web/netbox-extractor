require "json"

module NetboxClient
  module Api
  class Status
    def initialize(@conn : Connection); end

    #  A lightweight read-only endpoint for conveying NetBox&#39;s current operational status.
    def retrieve() : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/status/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
