require "json"

module NetboxClient
  module Api
  class Extras::NotificationGroups
    def initialize(@conn : Connection); end

    #  Delete a list of notification group objects.
    def bulk_destroy(notification_group_request : Array(NetboxClient::NotificationGroupRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/notification-groups/",
        body: notification_group_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of notification group objects.
    def bulk_partial_update(notification_group_request : Array(NetboxClient::NotificationGroupRequest)) : Response(Array(NetboxClient::NotificationGroup))
      @conn.request(Array(NetboxClient::NotificationGroup),
        method: :PATCH,
        path: "/api/extras/notification-groups/",
        body: notification_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of notification group objects.
    def bulk_update(notification_group_request : Array(NetboxClient::NotificationGroupRequest)) : Response(Array(NetboxClient::NotificationGroup))
      @conn.request(Array(NetboxClient::NotificationGroup),
        method: :PUT,
        path: "/api/extras/notification-groups/",
        body: notification_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of notification group objects.
    def create(extras_notification_groups_create_request : NetboxClient::ExtrasNotificationGroupsCreateRequest) : Response(NetboxClient::NotificationGroup)
      @conn.request(NetboxClient::NotificationGroup,
        method: :POST,
        path: "/api/extras/notification-groups/",
        body: extras_notification_groups_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a notification group object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/notification-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of notification group objects.
    def list(*, limit : Int32? = nil, offset : Int32? = nil, ordering : String? = nil) : Response(NetboxClient::PaginatedNotificationGroupList)
      @conn.request(NetboxClient::PaginatedNotificationGroupList,
        method: :GET,
        path: "/api/extras/notification-groups/",
        query: { "limit" => limit, "offset" => offset, "ordering" => ordering },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a notification group object.
    def partial_update(id : Int32, patched_notification_group_request : NetboxClient::PatchedNotificationGroupRequest? = nil) : Response(NetboxClient::NotificationGroup)
      @conn.request(NetboxClient::NotificationGroup,
        method: :PATCH,
        path: "/api/extras/notification-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_notification_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a notification group object.
    def retrieve(id : Int32) : Response(NetboxClient::NotificationGroup)
      @conn.request(NetboxClient::NotificationGroup,
        method: :GET,
        path: "/api/extras/notification-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a notification group object.
    def update(id : Int32, notification_group_request : NetboxClient::NotificationGroupRequest) : Response(NetboxClient::NotificationGroup)
      @conn.request(NetboxClient::NotificationGroup,
        method: :PUT,
        path: "/api/extras/notification-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: notification_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
