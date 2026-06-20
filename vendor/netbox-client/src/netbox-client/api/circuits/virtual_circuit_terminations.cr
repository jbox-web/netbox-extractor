require "json"

module NetboxClient
  module Api
  class Circuits::VirtualCircuitTerminations
    def initialize(@conn : Connection); end

    #  Delete a list of virtual circuit termination objects.
    def bulk_destroy(virtual_circuit_termination_request : Array(NetboxClient::VirtualCircuitTerminationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/virtual-circuit-terminations/",
        body: virtual_circuit_termination_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of virtual circuit termination objects.
    def bulk_partial_update(virtual_circuit_termination_request : Array(NetboxClient::VirtualCircuitTerminationRequest)) : Response(Array(NetboxClient::VirtualCircuitTermination))
      @conn.request(Array(NetboxClient::VirtualCircuitTermination),
        method: :PATCH,
        path: "/api/circuits/virtual-circuit-terminations/",
        body: virtual_circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of virtual circuit termination objects.
    def bulk_update(virtual_circuit_termination_request : Array(NetboxClient::VirtualCircuitTerminationRequest)) : Response(Array(NetboxClient::VirtualCircuitTermination))
      @conn.request(Array(NetboxClient::VirtualCircuitTermination),
        method: :PUT,
        path: "/api/circuits/virtual-circuit-terminations/",
        body: virtual_circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of virtual circuit termination objects.
    def create(circuits_virtual_circuit_terminations_create_request : NetboxClient::CircuitsVirtualCircuitTerminationsCreateRequest) : Response(NetboxClient::VirtualCircuitTermination)
      @conn.request(NetboxClient::VirtualCircuitTermination,
        method: :POST,
        path: "/api/circuits/virtual-circuit-terminations/",
        body: circuits_virtual_circuit_terminations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a virtual circuit termination object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/virtual-circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of virtual circuit termination objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, provider : Array(String)? = nil, provider__n : Array(String)? = nil, provider_account : Array(String)? = nil, provider_account__n : Array(String)? = nil, provider_account_id : Array(Int32)? = nil, provider_account_id__n : Array(Int32)? = nil, provider_id : Array(Int32)? = nil, provider_id__n : Array(Int32)? = nil, provider_network_id : Array(Int32)? = nil, provider_network_id__n : Array(Int32)? = nil, q : String? = nil, role : Array(String)? = nil, role__empty : Bool? = nil, role__ic : Array(String)? = nil, role__ie : Array(String)? = nil, role__iew : Array(String)? = nil, role__iregex : Array(String)? = nil, role__isw : Array(String)? = nil, role__n : Array(String)? = nil, role__nic : Array(String)? = nil, role__nie : Array(String)? = nil, role__niew : Array(String)? = nil, role__nisw : Array(String)? = nil, role__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, virtual_circuit_id : Array(Int32)? = nil, virtual_circuit_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedVirtualCircuitTerminationList)
      @conn.request(NetboxClient::PaginatedVirtualCircuitTerminationList,
        method: :GET,
        path: "/api/circuits/virtual-circuit-terminations/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "provider" => provider, "provider__n" => provider__n, "provider_account" => provider_account, "provider_account__n" => provider_account__n, "provider_account_id" => provider_account_id, "provider_account_id__n" => provider_account_id__n, "provider_id" => provider_id, "provider_id__n" => provider_id__n, "provider_network_id" => provider_network_id, "provider_network_id__n" => provider_network_id__n, "q" => q, "role" => role, "role__empty" => role__empty, "role__ic" => role__ic, "role__ie" => role__ie, "role__iew" => role__iew, "role__iregex" => role__iregex, "role__isw" => role__isw, "role__n" => role__n, "role__nic" => role__nic, "role__nie" => role__nie, "role__niew" => role__niew, "role__nisw" => role__nisw, "role__regex" => role__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "virtual_circuit_id" => virtual_circuit_id, "virtual_circuit_id__n" => virtual_circuit_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a virtual circuit termination object.
    def partial_update(id : Int32, patched_writable_virtual_circuit_termination_request : NetboxClient::PatchedWritableVirtualCircuitTerminationRequest? = nil) : Response(NetboxClient::VirtualCircuitTermination)
      @conn.request(NetboxClient::VirtualCircuitTermination,
        method: :PATCH,
        path: "/api/circuits/virtual-circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_virtual_circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Return all CablePaths which traverse a given pass-through port.
    def paths_retrieve(id : Int32) : Response(NetboxClient::VirtualCircuitTermination)
      @conn.request(NetboxClient::VirtualCircuitTermination,
        method: :GET,
        path: "/api/circuits/virtual-circuit-terminations/{id}/paths/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a virtual circuit termination object.
    def retrieve(id : Int32) : Response(NetboxClient::VirtualCircuitTermination)
      @conn.request(NetboxClient::VirtualCircuitTermination,
        method: :GET,
        path: "/api/circuits/virtual-circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a virtual circuit termination object.
    def update(id : Int32, writable_virtual_circuit_termination_request : NetboxClient::WritableVirtualCircuitTerminationRequest) : Response(NetboxClient::VirtualCircuitTermination)
      @conn.request(NetboxClient::VirtualCircuitTermination,
        method: :PUT,
        path: "/api/circuits/virtual-circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_virtual_circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
