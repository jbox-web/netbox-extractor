require "json"

module NetboxClient
  module Api
  class Circuits::ProviderNetworks
    def initialize(@conn : Connection); end

    #  Delete a list of provider network objects.
    def bulk_destroy(provider_network_request : Array(NetboxClient::ProviderNetworkRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/provider-networks/",
        body: provider_network_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of provider network objects.
    def bulk_partial_update(provider_network_request : Array(NetboxClient::ProviderNetworkRequest)) : Response(Array(NetboxClient::ProviderNetwork))
      @conn.request(Array(NetboxClient::ProviderNetwork),
        method: :PATCH,
        path: "/api/circuits/provider-networks/",
        body: provider_network_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of provider network objects.
    def bulk_update(provider_network_request : Array(NetboxClient::ProviderNetworkRequest)) : Response(Array(NetboxClient::ProviderNetwork))
      @conn.request(Array(NetboxClient::ProviderNetwork),
        method: :PUT,
        path: "/api/circuits/provider-networks/",
        body: provider_network_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of provider network objects.
    def create(circuits_provider_networks_create_request : NetboxClient::CircuitsProviderNetworksCreateRequest) : Response(NetboxClient::ProviderNetwork)
      @conn.request(NetboxClient::ProviderNetwork,
        method: :POST,
        path: "/api/circuits/provider-networks/",
        body: circuits_provider_networks_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a provider network object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/provider-networks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of provider network objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, provider : Array(String)? = nil, provider__n : Array(String)? = nil, provider_id : Array(Int32)? = nil, provider_id__n : Array(Int32)? = nil, q : String? = nil, service_id : Array(String)? = nil, service_id__empty : Bool? = nil, service_id__ic : Array(String)? = nil, service_id__ie : Array(String)? = nil, service_id__iew : Array(String)? = nil, service_id__iregex : Array(String)? = nil, service_id__isw : Array(String)? = nil, service_id__n : Array(String)? = nil, service_id__nic : Array(String)? = nil, service_id__nie : Array(String)? = nil, service_id__niew : Array(String)? = nil, service_id__nisw : Array(String)? = nil, service_id__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedProviderNetworkList)
      @conn.request(NetboxClient::PaginatedProviderNetworkList,
        method: :GET,
        path: "/api/circuits/provider-networks/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "provider" => provider, "provider__n" => provider__n, "provider_id" => provider_id, "provider_id__n" => provider_id__n, "q" => q, "service_id" => service_id, "service_id__empty" => service_id__empty, "service_id__ic" => service_id__ic, "service_id__ie" => service_id__ie, "service_id__iew" => service_id__iew, "service_id__iregex" => service_id__iregex, "service_id__isw" => service_id__isw, "service_id__n" => service_id__n, "service_id__nic" => service_id__nic, "service_id__nie" => service_id__nie, "service_id__niew" => service_id__niew, "service_id__nisw" => service_id__nisw, "service_id__regex" => service_id__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a provider network object.
    def partial_update(id : Int32, patched_provider_network_request : NetboxClient::PatchedProviderNetworkRequest? = nil) : Response(NetboxClient::ProviderNetwork)
      @conn.request(NetboxClient::ProviderNetwork,
        method: :PATCH,
        path: "/api/circuits/provider-networks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_provider_network_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a provider network object.
    def retrieve(id : Int32) : Response(NetboxClient::ProviderNetwork)
      @conn.request(NetboxClient::ProviderNetwork,
        method: :GET,
        path: "/api/circuits/provider-networks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a provider network object.
    def update(id : Int32, provider_network_request : NetboxClient::ProviderNetworkRequest) : Response(NetboxClient::ProviderNetwork)
      @conn.request(NetboxClient::ProviderNetwork,
        method: :PUT,
        path: "/api/circuits/provider-networks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: provider_network_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
