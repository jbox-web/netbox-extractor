require "json"

module NetboxClient
  module Api
  class Ipam::VlanGroups
    def initialize(@conn : Connection); end

    #  Post a VLAN object.
    def available_vlans_create(id : Int32, vlan_request : Array(NetboxClient::VLANRequest)) : Response(Array(NetboxClient::VLAN))
      @conn.request(Array(NetboxClient::VLAN),
        method: :POST,
        path: "/api/ipam/vlan-groups/{id}/available-vlans/".sub("{id}", NetboxClient.enc(id)),
        body: vlan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a VLAN object.
    def available_vlans_list(id : Int32) : Response(Array(NetboxClient::AvailableVLAN))
      @conn.request(Array(NetboxClient::AvailableVLAN),
        method: :GET,
        path: "/api/ipam/vlan-groups/{id}/available-vlans/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a list of VLAN group objects.
    def bulk_destroy(vlan_group_request : Array(NetboxClient::VLANGroupRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vlan-groups/",
        body: vlan_group_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of VLAN group objects.
    def bulk_partial_update(vlan_group_request : Array(NetboxClient::VLANGroupRequest)) : Response(Array(NetboxClient::VLANGroup))
      @conn.request(Array(NetboxClient::VLANGroup),
        method: :PATCH,
        path: "/api/ipam/vlan-groups/",
        body: vlan_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of VLAN group objects.
    def bulk_update(vlan_group_request : Array(NetboxClient::VLANGroupRequest)) : Response(Array(NetboxClient::VLANGroup))
      @conn.request(Array(NetboxClient::VLANGroup),
        method: :PUT,
        path: "/api/ipam/vlan-groups/",
        body: vlan_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of VLAN group objects.
    def create(ipam_vlan_groups_create_request : NetboxClient::IpamVlanGroupsCreateRequest) : Response(NetboxClient::VLANGroup)
      @conn.request(NetboxClient::VLANGroup,
        method: :POST,
        path: "/api/ipam/vlan-groups/",
        body: ipam_vlan_groups_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a VLAN group object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vlan-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of VLAN group objects.
    def list(*, cluster : Int32? = nil, cluster_group : Int32? = nil, contains_vid : Float64? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, rack : Int32? = nil, region : Int32? = nil, scope_id : Array(Int32)? = nil, scope_id__empty : Bool? = nil, scope_id__gt : Array(Int32)? = nil, scope_id__gte : Array(Int32)? = nil, scope_id__lt : Array(Int32)? = nil, scope_id__lte : Array(Int32)? = nil, scope_id__n : Array(Int32)? = nil, scope_type : String? = nil, scope_type__n : String? = nil, site : Int32? = nil, site_group : Int32? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedVLANGroupList)
      @conn.request(NetboxClient::PaginatedVLANGroupList,
        method: :GET,
        path: "/api/ipam/vlan-groups/",
        query: { "cluster" => cluster, "cluster_group" => cluster_group, "contains_vid" => contains_vid, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "rack" => rack, "region" => region, "scope_id" => scope_id, "scope_id__empty" => scope_id__empty, "scope_id__gt" => scope_id__gt, "scope_id__gte" => scope_id__gte, "scope_id__lt" => scope_id__lt, "scope_id__lte" => scope_id__lte, "scope_id__n" => scope_id__n, "scope_type" => scope_type, "scope_type__n" => scope_type__n, "site" => site, "site_group" => site_group, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a VLAN group object.
    def partial_update(id : Int32, patched_vlan_group_request : NetboxClient::PatchedVLANGroupRequest? = nil) : Response(NetboxClient::VLANGroup)
      @conn.request(NetboxClient::VLANGroup,
        method: :PATCH,
        path: "/api/ipam/vlan-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_vlan_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a VLAN group object.
    def retrieve(id : Int32) : Response(NetboxClient::VLANGroup)
      @conn.request(NetboxClient::VLANGroup,
        method: :GET,
        path: "/api/ipam/vlan-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a VLAN group object.
    def update(id : Int32, vlan_group_request : NetboxClient::VLANGroupRequest) : Response(NetboxClient::VLANGroup)
      @conn.request(NetboxClient::VLANGroup,
        method: :PUT,
        path: "/api/ipam/vlan-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: vlan_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
