require "json"

module NetboxClient
  module Api
  class Core::BackgroundQueues
    def initialize(@conn : Connection); end

    #  Retrieve a list of RQ Queues. Note: Queue names are not URL safe, so not returning a detail view.
    def retrieve() : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/core/background-queues/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Queues. Note: Queue names are not URL safe, so not returning a detail view.
    def retrieve_by_name(name : String) : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/core/background-queues/{name}/".sub("{name}", NetboxClient.enc(name)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
