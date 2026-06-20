require "json"

module NetboxClient
  module Api
  class Extras::Notifications
    def initialize(@conn : Connection); end

    #  Delete a list of notification objects.
    def bulk_destroy(notification_request : Array(NetboxClient::NotificationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/notifications/",
        body: notification_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of notification objects.
    def bulk_partial_update(notification_request : Array(NetboxClient::NotificationRequest)) : Response(Array(NetboxClient::Notification))
      @conn.request(Array(NetboxClient::Notification),
        method: :PATCH,
        path: "/api/extras/notifications/",
        body: notification_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of notification objects.
    def bulk_update(notification_request : Array(NetboxClient::NotificationRequest)) : Response(Array(NetboxClient::Notification))
      @conn.request(Array(NetboxClient::Notification),
        method: :PUT,
        path: "/api/extras/notifications/",
        body: notification_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of notification objects.
    def create(extras_notifications_create_request : NetboxClient::ExtrasNotificationsCreateRequest) : Response(NetboxClient::Notification)
      @conn.request(NetboxClient::Notification,
        method: :POST,
        path: "/api/extras/notifications/",
        body: extras_notifications_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a notification object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/notifications/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of notification objects.
    def list(*, limit : Int32? = nil, offset : Int32? = nil, ordering : String? = nil) : Response(NetboxClient::PaginatedNotificationList)
      @conn.request(NetboxClient::PaginatedNotificationList,
        method: :GET,
        path: "/api/extras/notifications/",
        query: { "limit" => limit, "offset" => offset, "ordering" => ordering },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a notification object.
    def partial_update(id : Int32, patched_notification_request : NetboxClient::PatchedNotificationRequest? = nil) : Response(NetboxClient::Notification)
      @conn.request(NetboxClient::Notification,
        method: :PATCH,
        path: "/api/extras/notifications/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_notification_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a notification object.
    def retrieve(id : Int32) : Response(NetboxClient::Notification)
      @conn.request(NetboxClient::Notification,
        method: :GET,
        path: "/api/extras/notifications/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a notification object.
    def update(id : Int32, notification_request : NetboxClient::NotificationRequest) : Response(NetboxClient::Notification)
      @conn.request(NetboxClient::Notification,
        method: :PUT,
        path: "/api/extras/notifications/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: notification_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
