require "json"

module NetboxClient
  module Api
  class Core::BackgroundWorkers
    def initialize(@conn : Connection); end

    #  Retrieve a list of RQ Workers.
    def retrieve() : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/core/background-workers/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Workers.
    def retrieve_by_name(name : String) : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/core/background-workers/{name}/".sub("{name}", NetboxClient.enc(name)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
