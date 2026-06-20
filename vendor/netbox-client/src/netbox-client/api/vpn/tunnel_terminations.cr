require "json"

module NetboxClient
  module Api
  class Vpn::TunnelTerminations
    def initialize(@conn : Connection); end

    #  Delete a list of tunnel termination objects.
    def bulk_destroy(tunnel_termination_request : Array(NetboxClient::TunnelTerminationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/tunnel-terminations/",
        body: tunnel_termination_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of tunnel termination objects.
    def bulk_partial_update(tunnel_termination_request : Array(NetboxClient::TunnelTerminationRequest)) : Response(Array(NetboxClient::TunnelTermination))
      @conn.request(Array(NetboxClient::TunnelTermination),
        method: :PATCH,
        path: "/api/vpn/tunnel-terminations/",
        body: tunnel_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of tunnel termination objects.
    def bulk_update(tunnel_termination_request : Array(NetboxClient::TunnelTerminationRequest)) : Response(Array(NetboxClient::TunnelTermination))
      @conn.request(Array(NetboxClient::TunnelTermination),
        method: :PUT,
        path: "/api/vpn/tunnel-terminations/",
        body: tunnel_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of tunnel termination objects.
    def create(vpn_tunnel_terminations_create_request : NetboxClient::VpnTunnelTerminationsCreateRequest) : Response(NetboxClient::TunnelTermination)
      @conn.request(NetboxClient::TunnelTermination,
        method: :POST,
        path: "/api/vpn/tunnel-terminations/",
        body: vpn_tunnel_terminations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a tunnel termination object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/tunnel-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of tunnel termination objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface : Array(String)? = nil, interface__n : Array(String)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, outside_ip_id : Array(Int32)? = nil, outside_ip_id__n : Array(Int32)? = nil, q : String? = nil, role : Array(String)? = nil, role__empty : Bool? = nil, role__ic : Array(String)? = nil, role__ie : Array(String)? = nil, role__iew : Array(String)? = nil, role__iregex : Array(String)? = nil, role__isw : Array(String)? = nil, role__n : Array(String)? = nil, role__nic : Array(String)? = nil, role__nie : Array(String)? = nil, role__niew : Array(String)? = nil, role__nisw : Array(String)? = nil, role__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, termination_id : Array(Int32)? = nil, termination_id__empty : Bool? = nil, termination_id__gt : Array(Int32)? = nil, termination_id__gte : Array(Int32)? = nil, termination_id__lt : Array(Int32)? = nil, termination_id__lte : Array(Int32)? = nil, termination_id__n : Array(Int32)? = nil, termination_type : String? = nil, termination_type__n : String? = nil, tunnel : Array(String)? = nil, tunnel__n : Array(String)? = nil, tunnel_id : Array(Int32)? = nil, tunnel_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, vminterface : Array(String)? = nil, vminterface__n : Array(String)? = nil, vminterface_id : Array(Int32)? = nil, vminterface_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedTunnelTerminationList)
      @conn.request(NetboxClient::PaginatedTunnelTerminationList,
        method: :GET,
        path: "/api/vpn/tunnel-terminations/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface" => interface, "interface__n" => interface__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "outside_ip_id" => outside_ip_id, "outside_ip_id__n" => outside_ip_id__n, "q" => q, "role" => role, "role__empty" => role__empty, "role__ic" => role__ic, "role__ie" => role__ie, "role__iew" => role__iew, "role__iregex" => role__iregex, "role__isw" => role__isw, "role__n" => role__n, "role__nic" => role__nic, "role__nie" => role__nie, "role__niew" => role__niew, "role__nisw" => role__nisw, "role__regex" => role__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "termination_id" => termination_id, "termination_id__empty" => termination_id__empty, "termination_id__gt" => termination_id__gt, "termination_id__gte" => termination_id__gte, "termination_id__lt" => termination_id__lt, "termination_id__lte" => termination_id__lte, "termination_id__n" => termination_id__n, "termination_type" => termination_type, "termination_type__n" => termination_type__n, "tunnel" => tunnel, "tunnel__n" => tunnel__n, "tunnel_id" => tunnel_id, "tunnel_id__n" => tunnel_id__n, "updated_by_request" => updated_by_request, "vminterface" => vminterface, "vminterface__n" => vminterface__n, "vminterface_id" => vminterface_id, "vminterface_id__n" => vminterface_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a tunnel termination object.
    def partial_update(id : Int32, patched_writable_tunnel_termination_request : NetboxClient::PatchedWritableTunnelTerminationRequest? = nil) : Response(NetboxClient::TunnelTermination)
      @conn.request(NetboxClient::TunnelTermination,
        method: :PATCH,
        path: "/api/vpn/tunnel-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_tunnel_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a tunnel termination object.
    def retrieve(id : Int32) : Response(NetboxClient::TunnelTermination)
      @conn.request(NetboxClient::TunnelTermination,
        method: :GET,
        path: "/api/vpn/tunnel-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a tunnel termination object.
    def update(id : Int32, writable_tunnel_termination_request : NetboxClient::WritableTunnelTerminationRequest) : Response(NetboxClient::TunnelTermination)
      @conn.request(NetboxClient::TunnelTermination,
        method: :PUT,
        path: "/api/vpn/tunnel-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_tunnel_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
