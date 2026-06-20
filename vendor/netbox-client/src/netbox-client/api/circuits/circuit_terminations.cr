require "json"

module NetboxClient
  module Api
  class Circuits::CircuitTerminations
    def initialize(@conn : Connection); end

    #  Delete a list of circuit termination objects.
    def bulk_destroy(circuit_termination_request : Array(NetboxClient::CircuitTerminationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/circuit-terminations/",
        body: circuit_termination_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of circuit termination objects.
    def bulk_partial_update(circuit_termination_request : Array(NetboxClient::CircuitTerminationRequest)) : Response(Array(NetboxClient::CircuitTermination))
      @conn.request(Array(NetboxClient::CircuitTermination),
        method: :PATCH,
        path: "/api/circuits/circuit-terminations/",
        body: circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of circuit termination objects.
    def bulk_update(circuit_termination_request : Array(NetboxClient::CircuitTerminationRequest)) : Response(Array(NetboxClient::CircuitTermination))
      @conn.request(Array(NetboxClient::CircuitTermination),
        method: :PUT,
        path: "/api/circuits/circuit-terminations/",
        body: circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of circuit termination objects.
    def create(circuits_circuit_terminations_create_request : NetboxClient::CircuitsCircuitTerminationsCreateRequest) : Response(NetboxClient::CircuitTermination)
      @conn.request(NetboxClient::CircuitTermination,
        method: :POST,
        path: "/api/circuits/circuit-terminations/",
        body: circuits_circuit_terminations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a circuit termination object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of circuit termination objects.
    def list(*, cable_end : String? = nil, cable_id : Array(Int32)? = nil, cable_id__n : Array(Int32)? = nil, cabled : Bool? = nil, circuit_id : Array(Int32)? = nil, circuit_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(String)? = nil, location_id__n : Array(String)? = nil, mark_connected : Bool? = nil, modified_by_request : String? = nil, occupied : Bool? = nil, offset : Int32? = nil, ordering : String? = nil, port_speed : Array(Int32)? = nil, port_speed__empty : Bool? = nil, port_speed__gt : Array(Int32)? = nil, port_speed__gte : Array(Int32)? = nil, port_speed__lt : Array(Int32)? = nil, port_speed__lte : Array(Int32)? = nil, port_speed__n : Array(Int32)? = nil, pp_info : Array(String)? = nil, pp_info__empty : Bool? = nil, pp_info__ic : Array(String)? = nil, pp_info__ie : Array(String)? = nil, pp_info__iew : Array(String)? = nil, pp_info__iregex : Array(String)? = nil, pp_info__isw : Array(String)? = nil, pp_info__n : Array(String)? = nil, pp_info__nic : Array(String)? = nil, pp_info__nie : Array(String)? = nil, pp_info__niew : Array(String)? = nil, pp_info__nisw : Array(String)? = nil, pp_info__regex : Array(String)? = nil, provider : Array(String)? = nil, provider__n : Array(String)? = nil, provider_id : Array(Int32)? = nil, provider_id__n : Array(Int32)? = nil, provider_network_id : Array(Int32)? = nil, provider_network_id__n : Array(Int32)? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, term_side : String? = nil, termination_id : Array(Int32)? = nil, termination_id__empty : Bool? = nil, termination_id__gt : Array(Int32)? = nil, termination_id__gte : Array(Int32)? = nil, termination_id__lt : Array(Int32)? = nil, termination_id__lte : Array(Int32)? = nil, termination_id__n : Array(Int32)? = nil, termination_type : String? = nil, termination_type__n : String? = nil, updated_by_request : String? = nil, upstream_speed : Array(Int32)? = nil, upstream_speed__empty : Bool? = nil, upstream_speed__gt : Array(Int32)? = nil, upstream_speed__gte : Array(Int32)? = nil, upstream_speed__lt : Array(Int32)? = nil, upstream_speed__lte : Array(Int32)? = nil, upstream_speed__n : Array(Int32)? = nil, xconnect_id : Array(String)? = nil, xconnect_id__empty : Bool? = nil, xconnect_id__ic : Array(String)? = nil, xconnect_id__ie : Array(String)? = nil, xconnect_id__iew : Array(String)? = nil, xconnect_id__iregex : Array(String)? = nil, xconnect_id__isw : Array(String)? = nil, xconnect_id__n : Array(String)? = nil, xconnect_id__nic : Array(String)? = nil, xconnect_id__nie : Array(String)? = nil, xconnect_id__niew : Array(String)? = nil, xconnect_id__nisw : Array(String)? = nil, xconnect_id__regex : Array(String)? = nil) : Response(NetboxClient::PaginatedCircuitTerminationList)
      @conn.request(NetboxClient::PaginatedCircuitTerminationList,
        method: :GET,
        path: "/api/circuits/circuit-terminations/",
        query: { "cable_end" => cable_end, "cable_id" => cable_id, "cable_id__n" => cable_id__n, "cabled" => cabled, "circuit_id" => circuit_id, "circuit_id__n" => circuit_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "mark_connected" => mark_connected, "modified_by_request" => modified_by_request, "occupied" => occupied, "offset" => offset, "ordering" => ordering, "port_speed" => port_speed, "port_speed__empty" => port_speed__empty, "port_speed__gt" => port_speed__gt, "port_speed__gte" => port_speed__gte, "port_speed__lt" => port_speed__lt, "port_speed__lte" => port_speed__lte, "port_speed__n" => port_speed__n, "pp_info" => pp_info, "pp_info__empty" => pp_info__empty, "pp_info__ic" => pp_info__ic, "pp_info__ie" => pp_info__ie, "pp_info__iew" => pp_info__iew, "pp_info__iregex" => pp_info__iregex, "pp_info__isw" => pp_info__isw, "pp_info__n" => pp_info__n, "pp_info__nic" => pp_info__nic, "pp_info__nie" => pp_info__nie, "pp_info__niew" => pp_info__niew, "pp_info__nisw" => pp_info__nisw, "pp_info__regex" => pp_info__regex, "provider" => provider, "provider__n" => provider__n, "provider_id" => provider_id, "provider_id__n" => provider_id__n, "provider_network_id" => provider_network_id, "provider_network_id__n" => provider_network_id__n, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "term_side" => term_side, "termination_id" => termination_id, "termination_id__empty" => termination_id__empty, "termination_id__gt" => termination_id__gt, "termination_id__gte" => termination_id__gte, "termination_id__lt" => termination_id__lt, "termination_id__lte" => termination_id__lte, "termination_id__n" => termination_id__n, "termination_type" => termination_type, "termination_type__n" => termination_type__n, "updated_by_request" => updated_by_request, "upstream_speed" => upstream_speed, "upstream_speed__empty" => upstream_speed__empty, "upstream_speed__gt" => upstream_speed__gt, "upstream_speed__gte" => upstream_speed__gte, "upstream_speed__lt" => upstream_speed__lt, "upstream_speed__lte" => upstream_speed__lte, "upstream_speed__n" => upstream_speed__n, "xconnect_id" => xconnect_id, "xconnect_id__empty" => xconnect_id__empty, "xconnect_id__ic" => xconnect_id__ic, "xconnect_id__ie" => xconnect_id__ie, "xconnect_id__iew" => xconnect_id__iew, "xconnect_id__iregex" => xconnect_id__iregex, "xconnect_id__isw" => xconnect_id__isw, "xconnect_id__n" => xconnect_id__n, "xconnect_id__nic" => xconnect_id__nic, "xconnect_id__nie" => xconnect_id__nie, "xconnect_id__niew" => xconnect_id__niew, "xconnect_id__nisw" => xconnect_id__nisw, "xconnect_id__regex" => xconnect_id__regex },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a circuit termination object.
    def partial_update(id : Int32, patched_circuit_termination_request : NetboxClient::PatchedCircuitTerminationRequest? = nil) : Response(NetboxClient::CircuitTermination)
      @conn.request(NetboxClient::CircuitTermination,
        method: :PATCH,
        path: "/api/circuits/circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Return all CablePaths which traverse a given pass-through port.
    def paths_retrieve(id : Int32) : Response(NetboxClient::CircuitTermination)
      @conn.request(NetboxClient::CircuitTermination,
        method: :GET,
        path: "/api/circuits/circuit-terminations/{id}/paths/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a circuit termination object.
    def retrieve(id : Int32) : Response(NetboxClient::CircuitTermination)
      @conn.request(NetboxClient::CircuitTermination,
        method: :GET,
        path: "/api/circuits/circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a circuit termination object.
    def update(id : Int32, circuit_termination_request : NetboxClient::CircuitTerminationRequest) : Response(NetboxClient::CircuitTermination)
      @conn.request(NetboxClient::CircuitTermination,
        method: :PUT,
        path: "/api/circuits/circuit-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: circuit_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
