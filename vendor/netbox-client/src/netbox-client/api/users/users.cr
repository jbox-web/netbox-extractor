require "json"

module NetboxClient
  module Api
  class Users::Users
    def initialize(@conn : Connection); end

    #  Delete a list of user objects.
    def bulk_destroy(user_request : Array(NetboxClient::UserRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/users/",
        body: user_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of user objects.
    def bulk_partial_update(user_request : Array(NetboxClient::UserRequest)) : Response(Array(NetboxClient::User))
      @conn.request(Array(NetboxClient::User),
        method: :PATCH,
        path: "/api/users/users/",
        body: user_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of user objects.
    def bulk_update(user_request : Array(NetboxClient::UserRequest)) : Response(Array(NetboxClient::User))
      @conn.request(Array(NetboxClient::User),
        method: :PUT,
        path: "/api/users/users/",
        body: user_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of user objects.
    def create(users_users_create_request : NetboxClient::UsersUsersCreateRequest) : Response(NetboxClient::User)
      @conn.request(NetboxClient::User,
        method: :POST,
        path: "/api/users/users/",
        body: users_users_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a user object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/users/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of user objects.
    def list(*, date_joined : Array(Time)? = nil, date_joined__empty : Bool? = nil, date_joined__gt : Array(Time)? = nil, date_joined__gte : Array(Time)? = nil, date_joined__lt : Array(Time)? = nil, date_joined__lte : Array(Time)? = nil, date_joined__n : Array(Time)? = nil, email : Array(String)? = nil, email__empty : Bool? = nil, email__ic : Array(String)? = nil, email__ie : Array(String)? = nil, email__iew : Array(String)? = nil, email__iregex : Array(String)? = nil, email__isw : Array(String)? = nil, email__n : Array(String)? = nil, email__nic : Array(String)? = nil, email__nie : Array(String)? = nil, email__niew : Array(String)? = nil, email__nisw : Array(String)? = nil, email__regex : Array(String)? = nil, first_name : Array(String)? = nil, first_name__empty : Bool? = nil, first_name__ic : Array(String)? = nil, first_name__ie : Array(String)? = nil, first_name__iew : Array(String)? = nil, first_name__iregex : Array(String)? = nil, first_name__isw : Array(String)? = nil, first_name__n : Array(String)? = nil, first_name__nic : Array(String)? = nil, first_name__nie : Array(String)? = nil, first_name__niew : Array(String)? = nil, first_name__nisw : Array(String)? = nil, first_name__regex : Array(String)? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, is_active : Bool? = nil, is_staff : Bool? = nil, is_superuser : Bool? = nil, last_login : Array(Time)? = nil, last_login__empty : Bool? = nil, last_login__gt : Array(Time)? = nil, last_login__gte : Array(Time)? = nil, last_login__lt : Array(Time)? = nil, last_login__lte : Array(Time)? = nil, last_login__n : Array(Time)? = nil, last_name : Array(String)? = nil, last_name__empty : Bool? = nil, last_name__ic : Array(String)? = nil, last_name__ie : Array(String)? = nil, last_name__iew : Array(String)? = nil, last_name__iregex : Array(String)? = nil, last_name__isw : Array(String)? = nil, last_name__n : Array(String)? = nil, last_name__nic : Array(String)? = nil, last_name__nie : Array(String)? = nil, last_name__niew : Array(String)? = nil, last_name__nisw : Array(String)? = nil, last_name__regex : Array(String)? = nil, limit : Int32? = nil, notification_group_id : Array(Int32)? = nil, notification_group_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, permission_id : Array(Int32)? = nil, permission_id__n : Array(Int32)? = nil, q : String? = nil, username : Array(String)? = nil, username__empty : Bool? = nil, username__ic : Array(String)? = nil, username__ie : Array(String)? = nil, username__iew : Array(String)? = nil, username__iregex : Array(String)? = nil, username__isw : Array(String)? = nil, username__n : Array(String)? = nil, username__nic : Array(String)? = nil, username__nie : Array(String)? = nil, username__niew : Array(String)? = nil, username__nisw : Array(String)? = nil, username__regex : Array(String)? = nil) : Response(NetboxClient::PaginatedUserList)
      @conn.request(NetboxClient::PaginatedUserList,
        method: :GET,
        path: "/api/users/users/",
        query: { "date_joined" => date_joined, "date_joined__empty" => date_joined__empty, "date_joined__gt" => date_joined__gt, "date_joined__gte" => date_joined__gte, "date_joined__lt" => date_joined__lt, "date_joined__lte" => date_joined__lte, "date_joined__n" => date_joined__n, "email" => email, "email__empty" => email__empty, "email__ic" => email__ic, "email__ie" => email__ie, "email__iew" => email__iew, "email__iregex" => email__iregex, "email__isw" => email__isw, "email__n" => email__n, "email__nic" => email__nic, "email__nie" => email__nie, "email__niew" => email__niew, "email__nisw" => email__nisw, "email__regex" => email__regex, "first_name" => first_name, "first_name__empty" => first_name__empty, "first_name__ic" => first_name__ic, "first_name__ie" => first_name__ie, "first_name__iew" => first_name__iew, "first_name__iregex" => first_name__iregex, "first_name__isw" => first_name__isw, "first_name__n" => first_name__n, "first_name__nic" => first_name__nic, "first_name__nie" => first_name__nie, "first_name__niew" => first_name__niew, "first_name__nisw" => first_name__nisw, "first_name__regex" => first_name__regex, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "is_active" => is_active, "is_staff" => is_staff, "is_superuser" => is_superuser, "last_login" => last_login, "last_login__empty" => last_login__empty, "last_login__gt" => last_login__gt, "last_login__gte" => last_login__gte, "last_login__lt" => last_login__lt, "last_login__lte" => last_login__lte, "last_login__n" => last_login__n, "last_name" => last_name, "last_name__empty" => last_name__empty, "last_name__ic" => last_name__ic, "last_name__ie" => last_name__ie, "last_name__iew" => last_name__iew, "last_name__iregex" => last_name__iregex, "last_name__isw" => last_name__isw, "last_name__n" => last_name__n, "last_name__nic" => last_name__nic, "last_name__nie" => last_name__nie, "last_name__niew" => last_name__niew, "last_name__nisw" => last_name__nisw, "last_name__regex" => last_name__regex, "limit" => limit, "notification_group_id" => notification_group_id, "notification_group_id__n" => notification_group_id__n, "offset" => offset, "ordering" => ordering, "permission_id" => permission_id, "permission_id__n" => permission_id__n, "q" => q, "username" => username, "username__empty" => username__empty, "username__ic" => username__ic, "username__ie" => username__ie, "username__iew" => username__iew, "username__iregex" => username__iregex, "username__isw" => username__isw, "username__n" => username__n, "username__nic" => username__nic, "username__nie" => username__nie, "username__niew" => username__niew, "username__nisw" => username__nisw, "username__regex" => username__regex },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a user object.
    def partial_update(id : Int32, patched_user_request : NetboxClient::PatchedUserRequest? = nil) : Response(NetboxClient::User)
      @conn.request(NetboxClient::User,
        method: :PATCH,
        path: "/api/users/users/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_user_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a user object.
    def retrieve(id : Int32) : Response(NetboxClient::User)
      @conn.request(NetboxClient::User,
        method: :GET,
        path: "/api/users/users/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a user object.
    def update(id : Int32, user_request : NetboxClient::UserRequest) : Response(NetboxClient::User)
      @conn.request(NetboxClient::User,
        method: :PUT,
        path: "/api/users/users/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: user_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
