require "json"

module NetboxClient
  module Api
  class Users::Groups
    def initialize(@conn : Connection); end

    #  Delete a list of group objects.
    def bulk_destroy(group_request : Array(NetboxClient::GroupRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/groups/",
        body: group_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of group objects.
    def bulk_partial_update(group_request : Array(NetboxClient::GroupRequest)) : Response(Array(NetboxClient::Group))
      @conn.request(Array(NetboxClient::Group),
        method: :PATCH,
        path: "/api/users/groups/",
        body: group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of group objects.
    def bulk_update(group_request : Array(NetboxClient::GroupRequest)) : Response(Array(NetboxClient::Group))
      @conn.request(Array(NetboxClient::Group),
        method: :PUT,
        path: "/api/users/groups/",
        body: group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of group objects.
    def create(users_groups_create_request : NetboxClient::UsersGroupsCreateRequest) : Response(NetboxClient::Group)
      @conn.request(NetboxClient::Group,
        method: :POST,
        path: "/api/users/groups/",
        body: users_groups_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a group object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of group objects.
    def list(*, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, limit : Int32? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, notification_group_id : Array(Int32)? = nil, notification_group_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, permission_id : Array(Int32)? = nil, permission_id__n : Array(Int32)? = nil, q : String? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedGroupList)
      @conn.request(NetboxClient::PaginatedGroupList,
        method: :GET,
        path: "/api/users/groups/",
        query: { "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "limit" => limit, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "notification_group_id" => notification_group_id, "notification_group_id__n" => notification_group_id__n, "offset" => offset, "ordering" => ordering, "permission_id" => permission_id, "permission_id__n" => permission_id__n, "q" => q, "user_id" => user_id, "user_id__n" => user_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a group object.
    def partial_update(id : Int32, patched_group_request : NetboxClient::PatchedGroupRequest? = nil) : Response(NetboxClient::Group)
      @conn.request(NetboxClient::Group,
        method: :PATCH,
        path: "/api/users/groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a group object.
    def retrieve(id : Int32) : Response(NetboxClient::Group)
      @conn.request(NetboxClient::Group,
        method: :GET,
        path: "/api/users/groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a group object.
    def update(id : Int32, group_request : NetboxClient::GroupRequest) : Response(NetboxClient::Group)
      @conn.request(NetboxClient::Group,
        method: :PUT,
        path: "/api/users/groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
