require "json"

module NetboxClient
  module Api
  class Extras
    def initialize(@conn : Connection); end

    #  Delete a list of dashboard objects.
    def dashboard_destroy() : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/dashboard/",
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of dashboard objects.
    def dashboard_partial_update(patched_dashboard_request : NetboxClient::PatchedDashboardRequest? = nil) : Response(NetboxClient::Dashboard)
      @conn.request(NetboxClient::Dashboard,
        method: :PATCH,
        path: "/api/extras/dashboard/",
        body: patched_dashboard_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of dashboard objects.
    def dashboard_retrieve() : Response(NetboxClient::Dashboard)
      @conn.request(NetboxClient::Dashboard,
        method: :GET,
        path: "/api/extras/dashboard/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of dashboard objects.
    def dashboard_update(dashboard_request : NetboxClient::DashboardRequest? = nil) : Response(NetboxClient::Dashboard)
      @conn.request(NetboxClient::Dashboard,
        method: :PUT,
        path: "/api/extras/dashboard/",
        body: dashboard_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
