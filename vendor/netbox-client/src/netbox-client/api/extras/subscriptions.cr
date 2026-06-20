require "json"

module NetboxClient
  module Api
  class Extras::Subscriptions
    def initialize(@conn : Connection); end

    #  Delete a list of subscription objects.
    def bulk_destroy(subscription_request : Array(NetboxClient::SubscriptionRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/subscriptions/",
        body: subscription_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of subscription objects.
    def bulk_partial_update(subscription_request : Array(NetboxClient::SubscriptionRequest)) : Response(Array(NetboxClient::Subscription))
      @conn.request(Array(NetboxClient::Subscription),
        method: :PATCH,
        path: "/api/extras/subscriptions/",
        body: subscription_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of subscription objects.
    def bulk_update(subscription_request : Array(NetboxClient::SubscriptionRequest)) : Response(Array(NetboxClient::Subscription))
      @conn.request(Array(NetboxClient::Subscription),
        method: :PUT,
        path: "/api/extras/subscriptions/",
        body: subscription_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of subscription objects.
    def create(extras_subscriptions_create_request : NetboxClient::ExtrasSubscriptionsCreateRequest) : Response(NetboxClient::Subscription)
      @conn.request(NetboxClient::Subscription,
        method: :POST,
        path: "/api/extras/subscriptions/",
        body: extras_subscriptions_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a subscription object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/subscriptions/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of subscription objects.
    def list(*, limit : Int32? = nil, offset : Int32? = nil, ordering : String? = nil) : Response(NetboxClient::PaginatedSubscriptionList)
      @conn.request(NetboxClient::PaginatedSubscriptionList,
        method: :GET,
        path: "/api/extras/subscriptions/",
        query: { "limit" => limit, "offset" => offset, "ordering" => ordering },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a subscription object.
    def partial_update(id : Int32, patched_subscription_request : NetboxClient::PatchedSubscriptionRequest? = nil) : Response(NetboxClient::Subscription)
      @conn.request(NetboxClient::Subscription,
        method: :PATCH,
        path: "/api/extras/subscriptions/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_subscription_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a subscription object.
    def retrieve(id : Int32) : Response(NetboxClient::Subscription)
      @conn.request(NetboxClient::Subscription,
        method: :GET,
        path: "/api/extras/subscriptions/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a subscription object.
    def update(id : Int32, subscription_request : NetboxClient::SubscriptionRequest) : Response(NetboxClient::Subscription)
      @conn.request(NetboxClient::Subscription,
        method: :PUT,
        path: "/api/extras/subscriptions/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: subscription_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
