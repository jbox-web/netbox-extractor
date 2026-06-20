require "json"

module NetboxClient
  module Api
  class Vpn::L2vpnTerminations
    def initialize(@conn : Connection); end

    #  Delete a list of L2VPN termination objects.
    def bulk_destroy(l2_vpn_termination_request : Array(NetboxClient::L2VPNTerminationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/l2vpn-terminations/",
        body: l2_vpn_termination_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of L2VPN termination objects.
    def bulk_partial_update(l2_vpn_termination_request : Array(NetboxClient::L2VPNTerminationRequest)) : Response(Array(NetboxClient::L2VPNTermination))
      @conn.request(Array(NetboxClient::L2VPNTermination),
        method: :PATCH,
        path: "/api/vpn/l2vpn-terminations/",
        body: l2_vpn_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of L2VPN termination objects.
    def bulk_update(l2_vpn_termination_request : Array(NetboxClient::L2VPNTerminationRequest)) : Response(Array(NetboxClient::L2VPNTermination))
      @conn.request(Array(NetboxClient::L2VPNTermination),
        method: :PUT,
        path: "/api/vpn/l2vpn-terminations/",
        body: l2_vpn_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of L2VPN termination objects.
    def create(vpn_l2vpn_terminations_create_request : NetboxClient::VpnL2vpnTerminationsCreateRequest) : Response(NetboxClient::L2VPNTermination)
      @conn.request(NetboxClient::L2VPNTermination,
        method: :POST,
        path: "/api/vpn/l2vpn-terminations/",
        body: vpn_l2vpn_terminations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a L2VPN termination object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/l2vpn-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of L2VPN termination objects.
    def list(*, assigned_object_id : Array(Int32)? = nil, assigned_object_id__empty : Bool? = nil, assigned_object_id__gt : Array(Int32)? = nil, assigned_object_id__gte : Array(Int32)? = nil, assigned_object_id__lt : Array(Int32)? = nil, assigned_object_id__lte : Array(Int32)? = nil, assigned_object_id__n : Array(Int32)? = nil, assigned_object_type : String? = nil, assigned_object_type__n : String? = nil, assigned_object_type_id : Array(Int32)? = nil, assigned_object_type_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, device : Array(String)? = nil, device__n : Array(String)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface : Array(String)? = nil, interface__n : Array(String)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, l2vpn : Array(String)? = nil, l2vpn__n : Array(String)? = nil, l2vpn_id : Array(Int32)? = nil, l2vpn_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, region : Array(String)? = nil, region_id : Array(Int32)? = nil, site : Array(String)? = nil, site_id : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, virtual_machine : Array(String)? = nil, virtual_machine__n : Array(String)? = nil, virtual_machine_id : Array(Int32)? = nil, virtual_machine_id__n : Array(Int32)? = nil, vlan : Array(String)? = nil, vlan__n : Array(String)? = nil, vlan_id : Array(Int32)? = nil, vlan_id__n : Array(Int32)? = nil, vlan_vid : Int32? = nil, vlan_vid__empty : Int32? = nil, vlan_vid__gt : Int32? = nil, vlan_vid__gte : Int32? = nil, vlan_vid__lt : Int32? = nil, vlan_vid__lte : Int32? = nil, vlan_vid__n : Int32? = nil, vminterface : Array(String)? = nil, vminterface__n : Array(String)? = nil, vminterface_id : Array(Int32)? = nil, vminterface_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedL2VPNTerminationList)
      @conn.request(NetboxClient::PaginatedL2VPNTerminationList,
        method: :GET,
        path: "/api/vpn/l2vpn-terminations/",
        query: { "assigned_object_id" => assigned_object_id, "assigned_object_id__empty" => assigned_object_id__empty, "assigned_object_id__gt" => assigned_object_id__gt, "assigned_object_id__gte" => assigned_object_id__gte, "assigned_object_id__lt" => assigned_object_id__lt, "assigned_object_id__lte" => assigned_object_id__lte, "assigned_object_id__n" => assigned_object_id__n, "assigned_object_type" => assigned_object_type, "assigned_object_type__n" => assigned_object_type__n, "assigned_object_type_id" => assigned_object_type_id, "assigned_object_type_id__n" => assigned_object_type_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface" => interface, "interface__n" => interface__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "l2vpn" => l2vpn, "l2vpn__n" => l2vpn__n, "l2vpn_id" => l2vpn_id, "l2vpn_id__n" => l2vpn_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "q" => q, "region" => region, "region_id" => region_id, "site" => site, "site_id" => site_id, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "virtual_machine" => virtual_machine, "virtual_machine__n" => virtual_machine__n, "virtual_machine_id" => virtual_machine_id, "virtual_machine_id__n" => virtual_machine_id__n, "vlan" => vlan, "vlan__n" => vlan__n, "vlan_id" => vlan_id, "vlan_id__n" => vlan_id__n, "vlan_vid" => vlan_vid, "vlan_vid__empty" => vlan_vid__empty, "vlan_vid__gt" => vlan_vid__gt, "vlan_vid__gte" => vlan_vid__gte, "vlan_vid__lt" => vlan_vid__lt, "vlan_vid__lte" => vlan_vid__lte, "vlan_vid__n" => vlan_vid__n, "vminterface" => vminterface, "vminterface__n" => vminterface__n, "vminterface_id" => vminterface_id, "vminterface_id__n" => vminterface_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a L2VPN termination object.
    def partial_update(id : Int32, patched_l2_vpn_termination_request : NetboxClient::PatchedL2VPNTerminationRequest? = nil) : Response(NetboxClient::L2VPNTermination)
      @conn.request(NetboxClient::L2VPNTermination,
        method: :PATCH,
        path: "/api/vpn/l2vpn-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_l2_vpn_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a L2VPN termination object.
    def retrieve(id : Int32) : Response(NetboxClient::L2VPNTermination)
      @conn.request(NetboxClient::L2VPNTermination,
        method: :GET,
        path: "/api/vpn/l2vpn-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a L2VPN termination object.
    def update(id : Int32, l2_vpn_termination_request : NetboxClient::L2VPNTerminationRequest) : Response(NetboxClient::L2VPNTermination)
      @conn.request(NetboxClient::L2VPNTermination,
        method: :PUT,
        path: "/api/vpn/l2vpn-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: l2_vpn_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
