require "json"

module NetboxClient
  module Api
  class Users::Permissions
    def initialize(@conn : Connection); end

    #  Delete a list of permission objects.
    def bulk_destroy(object_permission_request : Array(NetboxClient::ObjectPermissionRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/permissions/",
        body: object_permission_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of permission objects.
    def bulk_partial_update(object_permission_request : Array(NetboxClient::ObjectPermissionRequest)) : Response(Array(NetboxClient::ObjectPermission))
      @conn.request(Array(NetboxClient::ObjectPermission),
        method: :PATCH,
        path: "/api/users/permissions/",
        body: object_permission_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of permission objects.
    def bulk_update(object_permission_request : Array(NetboxClient::ObjectPermissionRequest)) : Response(Array(NetboxClient::ObjectPermission))
      @conn.request(Array(NetboxClient::ObjectPermission),
        method: :PUT,
        path: "/api/users/permissions/",
        body: object_permission_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of permission objects.
    def create(users_permissions_create_request : NetboxClient::UsersPermissionsCreateRequest) : Response(NetboxClient::ObjectPermission)
      @conn.request(NetboxClient::ObjectPermission,
        method: :POST,
        path: "/api/users/permissions/",
        body: users_permissions_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a permission object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/permissions/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of permission objects.
    def list(*, can_add : Bool? = nil, can_change : Bool? = nil, can_delete : Bool? = nil, can_view : Bool? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, enabled : Bool? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, limit : Int32? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, object_type : String? = nil, object_type__ic : String? = nil, object_type__ie : String? = nil, object_type__iew : String? = nil, object_type__iregex : String? = nil, object_type__isw : String? = nil, object_type__n : String? = nil, object_type__nic : String? = nil, object_type__nie : String? = nil, object_type__niew : String? = nil, object_type__nisw : String? = nil, object_type__regex : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, object_types : Array(Int32)? = nil, object_types__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, user : Array(String)? = nil, user__n : Array(String)? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedObjectPermissionList)
      @conn.request(NetboxClient::PaginatedObjectPermissionList,
        method: :GET,
        path: "/api/users/permissions/",
        query: { "can_add" => can_add, "can_change" => can_change, "can_delete" => can_delete, "can_view" => can_view, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "enabled" => enabled, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "limit" => limit, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_type" => object_type, "object_type__ic" => object_type__ic, "object_type__ie" => object_type__ie, "object_type__iew" => object_type__iew, "object_type__iregex" => object_type__iregex, "object_type__isw" => object_type__isw, "object_type__n" => object_type__n, "object_type__nic" => object_type__nic, "object_type__nie" => object_type__nie, "object_type__niew" => object_type__niew, "object_type__nisw" => object_type__nisw, "object_type__regex" => object_type__regex, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "object_types" => object_types, "object_types__n" => object_types__n, "offset" => offset, "ordering" => ordering, "q" => q, "user" => user, "user__n" => user__n, "user_id" => user_id, "user_id__n" => user_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a permission object.
    def partial_update(id : Int32, patched_object_permission_request : NetboxClient::PatchedObjectPermissionRequest? = nil) : Response(NetboxClient::ObjectPermission)
      @conn.request(NetboxClient::ObjectPermission,
        method: :PATCH,
        path: "/api/users/permissions/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_object_permission_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a permission object.
    def retrieve(id : Int32) : Response(NetboxClient::ObjectPermission)
      @conn.request(NetboxClient::ObjectPermission,
        method: :GET,
        path: "/api/users/permissions/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a permission object.
    def update(id : Int32, object_permission_request : NetboxClient::ObjectPermissionRequest) : Response(NetboxClient::ObjectPermission)
      @conn.request(NetboxClient::ObjectPermission,
        method: :PUT,
        path: "/api/users/permissions/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: object_permission_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
