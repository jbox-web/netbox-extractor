require "json"

module NetboxClient
  module Api
  class Ipam::Prefixes
    def initialize(@conn : Connection); end

    #  Post a IP address object.
    def available_ips_create(id : Int32, ip_address_request : Array(NetboxClient::IPAddressRequest)) : Response(Array(NetboxClient::IPAddress))
      @conn.request(Array(NetboxClient::IPAddress),
        method: :POST,
        path: "/api/ipam/prefixes/{id}/available-ips/".sub("{id}", NetboxClient.enc(id)),
        body: ip_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IP address object.
    def available_ips_list(id : Int32) : Response(Array(NetboxClient::AvailableIP))
      @conn.request(Array(NetboxClient::AvailableIP),
        method: :GET,
        path: "/api/ipam/prefixes/{id}/available-ips/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a prefix object.
    def available_prefixes_create(id : Int32, prefix_request : Array(NetboxClient::PrefixRequest)) : Response(Array(NetboxClient::Prefix))
      @conn.request(Array(NetboxClient::Prefix),
        method: :POST,
        path: "/api/ipam/prefixes/{id}/available-prefixes/".sub("{id}", NetboxClient.enc(id)),
        body: prefix_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a prefix object.
    def available_prefixes_list(id : Int32) : Response(Array(NetboxClient::AvailablePrefix))
      @conn.request(Array(NetboxClient::AvailablePrefix),
        method: :GET,
        path: "/api/ipam/prefixes/{id}/available-prefixes/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a list of prefix objects.
    def bulk_destroy(prefix_request : Array(NetboxClient::PrefixRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/prefixes/",
        body: prefix_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of prefix objects.
    def bulk_partial_update(prefix_request : Array(NetboxClient::PrefixRequest)) : Response(Array(NetboxClient::Prefix))
      @conn.request(Array(NetboxClient::Prefix),
        method: :PATCH,
        path: "/api/ipam/prefixes/",
        body: prefix_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of prefix objects.
    def bulk_update(prefix_request : Array(NetboxClient::PrefixRequest)) : Response(Array(NetboxClient::Prefix))
      @conn.request(Array(NetboxClient::Prefix),
        method: :PUT,
        path: "/api/ipam/prefixes/",
        body: prefix_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of prefix objects.
    def create(ipam_prefixes_create_request : NetboxClient::IpamPrefixesCreateRequest) : Response(NetboxClient::Prefix)
      @conn.request(NetboxClient::Prefix,
        method: :POST,
        path: "/api/ipam/prefixes/",
        body: ipam_prefixes_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a prefix object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/prefixes/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of prefix objects.
    def list(*, children : Array(Int32)? = nil, children__empty : Array(Int32)? = nil, children__gt : Array(Int32)? = nil, children__gte : Array(Int32)? = nil, children__lt : Array(Int32)? = nil, children__lte : Array(Int32)? = nil, children__n : Array(Int32)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, contains : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, depth : Array(Int32)? = nil, depth__empty : Array(Int32)? = nil, depth__gt : Array(Int32)? = nil, depth__gte : Array(Int32)? = nil, depth__lt : Array(Int32)? = nil, depth__lte : Array(Int32)? = nil, depth__n : Array(Int32)? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, family : Float64? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, is_pool : Bool? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(String)? = nil, location_id__n : Array(String)? = nil, mark_utilized : Bool? = nil, mask_length : Array(Int32)? = nil, mask_length__gte : Float64? = nil, mask_length__lte : Float64? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, prefix : Array(String)? = nil, present_in_vrf : String? = nil, present_in_vrf_id : String? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, scope_id : Array(Int32)? = nil, scope_id__empty : Bool? = nil, scope_id__gt : Array(Int32)? = nil, scope_id__gte : Array(Int32)? = nil, scope_id__lt : Array(Int32)? = nil, scope_id__lte : Array(Int32)? = nil, scope_id__n : Array(Int32)? = nil, scope_type : String? = nil, scope_type__n : String? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, vlan_group : Array(String)? = nil, vlan_group__n : Array(String)? = nil, vlan_group_id : Array(Int32)? = nil, vlan_group_id__n : Array(Int32)? = nil, vlan_id : Array(Int32)? = nil, vlan_id__n : Array(Int32)? = nil, vlan_vid : Int32? = nil, vlan_vid__empty : Int32? = nil, vlan_vid__gt : Int32? = nil, vlan_vid__gte : Int32? = nil, vlan_vid__lt : Int32? = nil, vlan_vid__lte : Int32? = nil, vlan_vid__n : Int32? = nil, vrf : Array(String)? = nil, vrf__n : Array(String)? = nil, vrf_id : Array(Int32)? = nil, vrf_id__n : Array(Int32)? = nil, within : String? = nil, within_include : String? = nil) : Response(NetboxClient::PaginatedPrefixList)
      @conn.request(NetboxClient::PaginatedPrefixList,
        method: :GET,
        path: "/api/ipam/prefixes/",
        query: { "children" => children, "children__empty" => children__empty, "children__gt" => children__gt, "children__gte" => children__gte, "children__lt" => children__lt, "children__lte" => children__lte, "children__n" => children__n, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "contains" => contains, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "depth" => depth, "depth__empty" => depth__empty, "depth__gt" => depth__gt, "depth__gte" => depth__gte, "depth__lt" => depth__lt, "depth__lte" => depth__lte, "depth__n" => depth__n, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "family" => family, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "is_pool" => is_pool, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "mark_utilized" => mark_utilized, "mask_length" => mask_length, "mask_length__gte" => mask_length__gte, "mask_length__lte" => mask_length__lte, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "prefix" => prefix, "present_in_vrf" => present_in_vrf, "present_in_vrf_id" => present_in_vrf_id, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "scope_id" => scope_id, "scope_id__empty" => scope_id__empty, "scope_id__gt" => scope_id__gt, "scope_id__gte" => scope_id__gte, "scope_id__lt" => scope_id__lt, "scope_id__lte" => scope_id__lte, "scope_id__n" => scope_id__n, "scope_type" => scope_type, "scope_type__n" => scope_type__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "vlan_group" => vlan_group, "vlan_group__n" => vlan_group__n, "vlan_group_id" => vlan_group_id, "vlan_group_id__n" => vlan_group_id__n, "vlan_id" => vlan_id, "vlan_id__n" => vlan_id__n, "vlan_vid" => vlan_vid, "vlan_vid__empty" => vlan_vid__empty, "vlan_vid__gt" => vlan_vid__gt, "vlan_vid__gte" => vlan_vid__gte, "vlan_vid__lt" => vlan_vid__lt, "vlan_vid__lte" => vlan_vid__lte, "vlan_vid__n" => vlan_vid__n, "vrf" => vrf, "vrf__n" => vrf__n, "vrf_id" => vrf_id, "vrf_id__n" => vrf_id__n, "within" => within, "within_include" => within_include },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a prefix object.
    def partial_update(id : Int32, patched_writable_prefix_request : NetboxClient::PatchedWritablePrefixRequest? = nil) : Response(NetboxClient::Prefix)
      @conn.request(NetboxClient::Prefix,
        method: :PATCH,
        path: "/api/ipam/prefixes/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_prefix_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a prefix object.
    def retrieve(id : Int32) : Response(NetboxClient::Prefix)
      @conn.request(NetboxClient::Prefix,
        method: :GET,
        path: "/api/ipam/prefixes/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a prefix object.
    def update(id : Int32, writable_prefix_request : NetboxClient::WritablePrefixRequest) : Response(NetboxClient::Prefix)
      @conn.request(NetboxClient::Prefix,
        method: :PUT,
        path: "/api/ipam/prefixes/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_prefix_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
