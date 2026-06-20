require "json"

module NetboxClient
  module Api
  class Schema
    def initialize(@conn : Connection); end

    #  OpenApi3 schema for this API. Format can be selected via content negotiation.  - YAML: application/vnd.oai.openapi - JSON: application/vnd.oai.openapi+json
    def retrieve(*, format : String? = nil) : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/schema/",
        query: { "format" => format },
        accept: %w[application/vnd.oai.openapi application/yaml application/vnd.oai.openapi+json application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
