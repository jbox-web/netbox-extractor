require "json"

module NetboxClient
  module Api
  class Users::Tokens
    def initialize(@conn : Connection); end

    #  Delete a list of token objects.
    def bulk_destroy(token_request : Array(NetboxClient::TokenRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/tokens/",
        body: token_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of token objects.
    def bulk_partial_update(token_request : Array(NetboxClient::TokenRequest)) : Response(Array(NetboxClient::Token))
      @conn.request(Array(NetboxClient::Token),
        method: :PATCH,
        path: "/api/users/tokens/",
        body: token_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of token objects.
    def bulk_update(token_request : Array(NetboxClient::TokenRequest)) : Response(Array(NetboxClient::Token))
      @conn.request(Array(NetboxClient::Token),
        method: :PUT,
        path: "/api/users/tokens/",
        body: token_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of token objects.
    def create(users_tokens_create_request : NetboxClient::UsersTokensCreateRequest) : Response(NetboxClient::Token)
      @conn.request(NetboxClient::Token,
        method: :POST,
        path: "/api/users/tokens/",
        body: users_tokens_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a token object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/users/tokens/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of token objects.
    def list(*, created : Time? = nil, created__gte : Time? = nil, created__lte : Time? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, expires : Time? = nil, expires__gte : Time? = nil, expires__lte : Time? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, key : Array(String)? = nil, key__empty : Bool? = nil, key__ic : Array(String)? = nil, key__ie : Array(String)? = nil, key__iew : Array(String)? = nil, key__iregex : Array(String)? = nil, key__isw : Array(String)? = nil, key__n : Array(String)? = nil, key__nic : Array(String)? = nil, key__nie : Array(String)? = nil, key__niew : Array(String)? = nil, key__nisw : Array(String)? = nil, key__regex : Array(String)? = nil, last_used : Array(Time)? = nil, last_used__empty : Bool? = nil, last_used__gt : Array(Time)? = nil, last_used__gte : Array(Time)? = nil, last_used__lt : Array(Time)? = nil, last_used__lte : Array(Time)? = nil, last_used__n : Array(Time)? = nil, limit : Int32? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, user : Array(String)? = nil, user__n : Array(String)? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil, write_enabled : Bool? = nil) : Response(NetboxClient::PaginatedTokenList)
      @conn.request(NetboxClient::PaginatedTokenList,
        method: :GET,
        path: "/api/users/tokens/",
        query: { "created" => created, "created__gte" => created__gte, "created__lte" => created__lte, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "expires" => expires, "expires__gte" => expires__gte, "expires__lte" => expires__lte, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "key" => key, "key__empty" => key__empty, "key__ic" => key__ic, "key__ie" => key__ie, "key__iew" => key__iew, "key__iregex" => key__iregex, "key__isw" => key__isw, "key__n" => key__n, "key__nic" => key__nic, "key__nie" => key__nie, "key__niew" => key__niew, "key__nisw" => key__nisw, "key__regex" => key__regex, "last_used" => last_used, "last_used__empty" => last_used__empty, "last_used__gt" => last_used__gt, "last_used__gte" => last_used__gte, "last_used__lt" => last_used__lt, "last_used__lte" => last_used__lte, "last_used__n" => last_used__n, "limit" => limit, "offset" => offset, "ordering" => ordering, "q" => q, "user" => user, "user__n" => user__n, "user_id" => user_id, "user_id__n" => user_id__n, "write_enabled" => write_enabled },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a token object.
    def partial_update(id : Int32, patched_token_request : NetboxClient::PatchedTokenRequest? = nil) : Response(NetboxClient::Token)
      @conn.request(NetboxClient::Token,
        method: :PATCH,
        path: "/api/users/tokens/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_token_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Non-authenticated REST API endpoint via which a user may create a Token.
    def provision_create(token_provision_request : NetboxClient::TokenProvisionRequest) : Response(NetboxClient::TokenProvision)
      @conn.request(NetboxClient::TokenProvision,
        method: :POST,
        path: "/api/users/tokens/provision/",
        body: token_provision_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a token object.
    def retrieve(id : Int32) : Response(NetboxClient::Token)
      @conn.request(NetboxClient::Token,
        method: :GET,
        path: "/api/users/tokens/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a token object.
    def update(id : Int32, token_request : NetboxClient::TokenRequest) : Response(NetboxClient::Token)
      @conn.request(NetboxClient::Token,
        method: :PUT,
        path: "/api/users/tokens/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: token_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
