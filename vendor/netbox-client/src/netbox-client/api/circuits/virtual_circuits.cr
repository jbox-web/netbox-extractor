require "json"

module NetboxClient
  module Api
  class Circuits::VirtualCircuits
    def initialize(@conn : Connection); end

    #  Delete a list of virtual circuit objects.
    def bulk_destroy(virtual_circuit_request : Array(NetboxClient::VirtualCircuitRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/virtual-circuits/",
        body: virtual_circuit_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of virtual circuit objects.
    def bulk_partial_update(virtual_circuit_request : Array(NetboxClient::VirtualCircuitRequest)) : Response(Array(NetboxClient::VirtualCircuit))
      @conn.request(Array(NetboxClient::VirtualCircuit),
        method: :PATCH,
        path: "/api/circuits/virtual-circuits/",
        body: virtual_circuit_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of virtual circuit objects.
    def bulk_update(virtual_circuit_request : Array(NetboxClient::VirtualCircuitRequest)) : Response(Array(NetboxClient::VirtualCircuit))
      @conn.request(Array(NetboxClient::VirtualCircuit),
        method: :PUT,
        path: "/api/circuits/virtual-circuits/",
        body: virtual_circuit_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of virtual circuit objects.
    def create(circuits_virtual_circuits_create_request : NetboxClient::CircuitsVirtualCircuitsCreateRequest) : Response(NetboxClient::VirtualCircuit)
      @conn.request(NetboxClient::VirtualCircuit,
        method: :POST,
        path: "/api/circuits/virtual-circuits/",
        body: circuits_virtual_circuits_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a virtual circuit object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/virtual-circuits/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of virtual circuit objects.
    def list(*, cid : Array(String)? = nil, cid__empty : Bool? = nil, cid__ic : Array(String)? = nil, cid__ie : Array(String)? = nil, cid__iew : Array(String)? = nil, cid__iregex : Array(String)? = nil, cid__isw : Array(String)? = nil, cid__n : Array(String)? = nil, cid__nic : Array(String)? = nil, cid__nie : Array(String)? = nil, cid__niew : Array(String)? = nil, cid__nisw : Array(String)? = nil, cid__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, provider : Array(String)? = nil, provider__n : Array(String)? = nil, provider_account : Array(String)? = nil, provider_account__n : Array(String)? = nil, provider_account_id : Array(Int32)? = nil, provider_account_id__n : Array(Int32)? = nil, provider_id : Array(Int32)? = nil, provider_id__n : Array(Int32)? = nil, provider_network_id : Array(Int32)? = nil, provider_network_id__n : Array(Int32)? = nil, q : String? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, _type : Array(String)? = nil, type__n : Array(String)? = nil, type_id : Array(Int32)? = nil, type_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedVirtualCircuitList)
      @conn.request(NetboxClient::PaginatedVirtualCircuitList,
        method: :GET,
        path: "/api/circuits/virtual-circuits/",
        query: { "cid" => cid, "cid__empty" => cid__empty, "cid__ic" => cid__ic, "cid__ie" => cid__ie, "cid__iew" => cid__iew, "cid__iregex" => cid__iregex, "cid__isw" => cid__isw, "cid__n" => cid__n, "cid__nic" => cid__nic, "cid__nie" => cid__nie, "cid__niew" => cid__niew, "cid__nisw" => cid__nisw, "cid__regex" => cid__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "provider" => provider, "provider__n" => provider__n, "provider_account" => provider_account, "provider_account__n" => provider_account__n, "provider_account_id" => provider_account_id, "provider_account_id__n" => provider_account_id__n, "provider_id" => provider_id, "provider_id__n" => provider_id__n, "provider_network_id" => provider_network_id, "provider_network_id__n" => provider_network_id__n, "q" => q, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "type" => _type, "type__n" => type__n, "type_id" => type_id, "type_id__n" => type_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a virtual circuit object.
    def partial_update(id : Int32, patched_writable_virtual_circuit_request : NetboxClient::PatchedWritableVirtualCircuitRequest? = nil) : Response(NetboxClient::VirtualCircuit)
      @conn.request(NetboxClient::VirtualCircuit,
        method: :PATCH,
        path: "/api/circuits/virtual-circuits/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_virtual_circuit_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a virtual circuit object.
    def retrieve(id : Int32) : Response(NetboxClient::VirtualCircuit)
      @conn.request(NetboxClient::VirtualCircuit,
        method: :GET,
        path: "/api/circuits/virtual-circuits/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a virtual circuit object.
    def update(id : Int32, writable_virtual_circuit_request : NetboxClient::WritableVirtualCircuitRequest) : Response(NetboxClient::VirtualCircuit)
      @conn.request(NetboxClient::VirtualCircuit,
        method: :PUT,
        path: "/api/circuits/virtual-circuits/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_virtual_circuit_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
