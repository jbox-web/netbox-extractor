require "json"

module NetboxClient
  module Api
  class Ipam::Vlans
    def initialize(@conn : Connection); end

    #  Delete a list of VLAN objects.
    def bulk_destroy(vlan_request : Array(NetboxClient::VLANRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vlans/",
        body: vlan_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of VLAN objects.
    def bulk_partial_update(vlan_request : Array(NetboxClient::VLANRequest)) : Response(Array(NetboxClient::VLAN))
      @conn.request(Array(NetboxClient::VLAN),
        method: :PATCH,
        path: "/api/ipam/vlans/",
        body: vlan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of VLAN objects.
    def bulk_update(vlan_request : Array(NetboxClient::VLANRequest)) : Response(Array(NetboxClient::VLAN))
      @conn.request(Array(NetboxClient::VLAN),
        method: :PUT,
        path: "/api/ipam/vlans/",
        body: vlan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of VLAN objects.
    def create(ipam_vlans_create_request : NetboxClient::IpamVlansCreateRequest) : Response(NetboxClient::VLAN)
      @conn.request(NetboxClient::VLAN,
        method: :POST,
        path: "/api/ipam/vlans/",
        body: ipam_vlans_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a VLAN object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vlans/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of VLAN objects.
    def list(*, available_at_site : String? = nil, available_on_device : String? = nil, available_on_virtualmachine : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_id : Int32? = nil, l2vpn : Array(String)? = nil, l2vpn__n : Array(String)? = nil, l2vpn_id : Array(Int32)? = nil, l2vpn_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, qinq_role : Array(String)? = nil, qinq_role__empty : Bool? = nil, qinq_role__ic : Array(String)? = nil, qinq_role__ie : Array(String)? = nil, qinq_role__iew : Array(String)? = nil, qinq_role__iregex : Array(String)? = nil, qinq_role__isw : Array(String)? = nil, qinq_role__n : Array(String)? = nil, qinq_role__nic : Array(String)? = nil, qinq_role__nie : Array(String)? = nil, qinq_role__niew : Array(String)? = nil, qinq_role__nisw : Array(String)? = nil, qinq_role__regex : Array(String)? = nil, qinq_svlan_id : Array(Int32)? = nil, qinq_svlan_id__n : Array(Int32)? = nil, qinq_svlan_vid : Array(Int32)? = nil, qinq_svlan_vid__empty : Array(Int32)? = nil, qinq_svlan_vid__gt : Array(Int32)? = nil, qinq_svlan_vid__gte : Array(Int32)? = nil, qinq_svlan_vid__lt : Array(Int32)? = nil, qinq_svlan_vid__lte : Array(Int32)? = nil, qinq_svlan_vid__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, vid : Array(Int32)? = nil, vid__empty : Bool? = nil, vid__gt : Array(Int32)? = nil, vid__gte : Array(Int32)? = nil, vid__lt : Array(Int32)? = nil, vid__lte : Array(Int32)? = nil, vid__n : Array(Int32)? = nil, vminterface_id : Int32? = nil) : Response(NetboxClient::PaginatedVLANList)
      @conn.request(NetboxClient::PaginatedVLANList,
        method: :GET,
        path: "/api/ipam/vlans/",
        query: { "available_at_site" => available_at_site, "available_on_device" => available_on_device, "available_on_virtualmachine" => available_on_virtualmachine, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_id" => interface_id, "l2vpn" => l2vpn, "l2vpn__n" => l2vpn__n, "l2vpn_id" => l2vpn_id, "l2vpn_id__n" => l2vpn_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "qinq_role" => qinq_role, "qinq_role__empty" => qinq_role__empty, "qinq_role__ic" => qinq_role__ic, "qinq_role__ie" => qinq_role__ie, "qinq_role__iew" => qinq_role__iew, "qinq_role__iregex" => qinq_role__iregex, "qinq_role__isw" => qinq_role__isw, "qinq_role__n" => qinq_role__n, "qinq_role__nic" => qinq_role__nic, "qinq_role__nie" => qinq_role__nie, "qinq_role__niew" => qinq_role__niew, "qinq_role__nisw" => qinq_role__nisw, "qinq_role__regex" => qinq_role__regex, "qinq_svlan_id" => qinq_svlan_id, "qinq_svlan_id__n" => qinq_svlan_id__n, "qinq_svlan_vid" => qinq_svlan_vid, "qinq_svlan_vid__empty" => qinq_svlan_vid__empty, "qinq_svlan_vid__gt" => qinq_svlan_vid__gt, "qinq_svlan_vid__gte" => qinq_svlan_vid__gte, "qinq_svlan_vid__lt" => qinq_svlan_vid__lt, "qinq_svlan_vid__lte" => qinq_svlan_vid__lte, "qinq_svlan_vid__n" => qinq_svlan_vid__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "vid" => vid, "vid__empty" => vid__empty, "vid__gt" => vid__gt, "vid__gte" => vid__gte, "vid__lt" => vid__lt, "vid__lte" => vid__lte, "vid__n" => vid__n, "vminterface_id" => vminterface_id },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a VLAN object.
    def partial_update(id : Int32, patched_writable_vlan_request : NetboxClient::PatchedWritableVLANRequest? = nil) : Response(NetboxClient::VLAN)
      @conn.request(NetboxClient::VLAN,
        method: :PATCH,
        path: "/api/ipam/vlans/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_vlan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a VLAN object.
    def retrieve(id : Int32) : Response(NetboxClient::VLAN)
      @conn.request(NetboxClient::VLAN,
        method: :GET,
        path: "/api/ipam/vlans/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a VLAN object.
    def update(id : Int32, writable_vlan_request : NetboxClient::WritableVLANRequest) : Response(NetboxClient::VLAN)
      @conn.request(NetboxClient::VLAN,
        method: :PUT,
        path: "/api/ipam/vlans/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_vlan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
