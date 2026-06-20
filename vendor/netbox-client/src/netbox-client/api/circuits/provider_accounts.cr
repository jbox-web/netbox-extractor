require "json"

module NetboxClient
  module Api
  class Circuits::ProviderAccounts
    def initialize(@conn : Connection); end

    #  Delete a list of provider account objects.
    def bulk_destroy(provider_account_request : Array(NetboxClient::ProviderAccountRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/provider-accounts/",
        body: provider_account_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of provider account objects.
    def bulk_partial_update(provider_account_request : Array(NetboxClient::ProviderAccountRequest)) : Response(Array(NetboxClient::ProviderAccount))
      @conn.request(Array(NetboxClient::ProviderAccount),
        method: :PATCH,
        path: "/api/circuits/provider-accounts/",
        body: provider_account_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of provider account objects.
    def bulk_update(provider_account_request : Array(NetboxClient::ProviderAccountRequest)) : Response(Array(NetboxClient::ProviderAccount))
      @conn.request(Array(NetboxClient::ProviderAccount),
        method: :PUT,
        path: "/api/circuits/provider-accounts/",
        body: provider_account_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of provider account objects.
    def create(circuits_provider_accounts_create_request : NetboxClient::CircuitsProviderAccountsCreateRequest) : Response(NetboxClient::ProviderAccount)
      @conn.request(NetboxClient::ProviderAccount,
        method: :POST,
        path: "/api/circuits/provider-accounts/",
        body: circuits_provider_accounts_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a provider account object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/provider-accounts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of provider account objects.
    def list(*, account : Array(String)? = nil, account__empty : Bool? = nil, account__ic : Array(String)? = nil, account__ie : Array(String)? = nil, account__iew : Array(String)? = nil, account__iregex : Array(String)? = nil, account__isw : Array(String)? = nil, account__n : Array(String)? = nil, account__nic : Array(String)? = nil, account__nie : Array(String)? = nil, account__niew : Array(String)? = nil, account__nisw : Array(String)? = nil, account__regex : Array(String)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, provider : Array(String)? = nil, provider__n : Array(String)? = nil, provider_id : Array(Int32)? = nil, provider_id__n : Array(Int32)? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedProviderAccountList)
      @conn.request(NetboxClient::PaginatedProviderAccountList,
        method: :GET,
        path: "/api/circuits/provider-accounts/",
        query: { "account" => account, "account__empty" => account__empty, "account__ic" => account__ic, "account__ie" => account__ie, "account__iew" => account__iew, "account__iregex" => account__iregex, "account__isw" => account__isw, "account__n" => account__n, "account__nic" => account__nic, "account__nie" => account__nie, "account__niew" => account__niew, "account__nisw" => account__nisw, "account__regex" => account__regex, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "provider" => provider, "provider__n" => provider__n, "provider_id" => provider_id, "provider_id__n" => provider_id__n, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a provider account object.
    def partial_update(id : Int32, patched_provider_account_request : NetboxClient::PatchedProviderAccountRequest? = nil) : Response(NetboxClient::ProviderAccount)
      @conn.request(NetboxClient::ProviderAccount,
        method: :PATCH,
        path: "/api/circuits/provider-accounts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_provider_account_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a provider account object.
    def retrieve(id : Int32) : Response(NetboxClient::ProviderAccount)
      @conn.request(NetboxClient::ProviderAccount,
        method: :GET,
        path: "/api/circuits/provider-accounts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a provider account object.
    def update(id : Int32, provider_account_request : NetboxClient::ProviderAccountRequest) : Response(NetboxClient::ProviderAccount)
      @conn.request(NetboxClient::ProviderAccount,
        method: :PUT,
        path: "/api/circuits/provider-accounts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: provider_account_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
