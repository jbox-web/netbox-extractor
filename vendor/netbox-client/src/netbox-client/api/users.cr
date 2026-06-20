require "json"

module NetboxClient
  module Api
  class Users
    def initialize(@conn : Connection); end

    #  An API endpoint via which a user can update his or her own UserConfig data (but no one else&#39;s).
    def config_retrieve() : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/users/config/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
