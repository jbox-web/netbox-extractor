require "json"

module NetboxClient
  module Api
  class Ipam::IpRanges
    def initialize(@conn : Connection); end

    #  Post a IP address object.
    def available_ips_create(id : Int32, ip_address_request : Array(NetboxClient::IPAddressRequest)) : Response(Array(NetboxClient::IPAddress))
      @conn.request(Array(NetboxClient::IPAddress),
        method: :POST,
        path: "/api/ipam/ip-ranges/{id}/available-ips/".sub("{id}", NetboxClient.enc(id)),
        body: ip_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IP address object.
    def available_ips_list(id : Int32) : Response(Array(NetboxClient::AvailableIP))
      @conn.request(Array(NetboxClient::AvailableIP),
        method: :GET,
        path: "/api/ipam/ip-ranges/{id}/available-ips/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a list of IP range objects.
    def bulk_destroy(ip_range_request : Array(NetboxClient::IPRangeRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/ip-ranges/",
        body: ip_range_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of IP range objects.
    def bulk_partial_update(ip_range_request : Array(NetboxClient::IPRangeRequest)) : Response(Array(NetboxClient::IPRange))
      @conn.request(Array(NetboxClient::IPRange),
        method: :PATCH,
        path: "/api/ipam/ip-ranges/",
        body: ip_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of IP range objects.
    def bulk_update(ip_range_request : Array(NetboxClient::IPRangeRequest)) : Response(Array(NetboxClient::IPRange))
      @conn.request(Array(NetboxClient::IPRange),
        method: :PUT,
        path: "/api/ipam/ip-ranges/",
        body: ip_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of IP range objects.
    def create(ipam_ip_ranges_create_request : NetboxClient::IpamIpRangesCreateRequest) : Response(NetboxClient::IPRange)
      @conn.request(NetboxClient::IPRange,
        method: :POST,
        path: "/api/ipam/ip-ranges/",
        body: ipam_ip_ranges_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a IP range object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/ip-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of IP range objects.
    def list(*, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, contains : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, end_address : Array(String)? = nil, family : Float64? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mark_populated : Bool? = nil, mark_utilized : Bool? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, parent : Array(String)? = nil, q : String? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, size : Array(Int32)? = nil, size__empty : Bool? = nil, size__gt : Array(Int32)? = nil, size__gte : Array(Int32)? = nil, size__lt : Array(Int32)? = nil, size__lte : Array(Int32)? = nil, size__n : Array(Int32)? = nil, start_address : Array(String)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, vrf : Array(String)? = nil, vrf__n : Array(String)? = nil, vrf_id : Array(Int32)? = nil, vrf_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedIPRangeList)
      @conn.request(NetboxClient::PaginatedIPRangeList,
        method: :GET,
        path: "/api/ipam/ip-ranges/",
        query: { "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "contains" => contains, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "end_address" => end_address, "family" => family, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mark_populated" => mark_populated, "mark_utilized" => mark_utilized, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "parent" => parent, "q" => q, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "size" => size, "size__empty" => size__empty, "size__gt" => size__gt, "size__gte" => size__gte, "size__lt" => size__lt, "size__lte" => size__lte, "size__n" => size__n, "start_address" => start_address, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "vrf" => vrf, "vrf__n" => vrf__n, "vrf_id" => vrf_id, "vrf_id__n" => vrf_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a IP range object.
    def partial_update(id : Int32, patched_writable_ip_range_request : NetboxClient::PatchedWritableIPRangeRequest? = nil) : Response(NetboxClient::IPRange)
      @conn.request(NetboxClient::IPRange,
        method: :PATCH,
        path: "/api/ipam/ip-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_ip_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IP range object.
    def retrieve(id : Int32) : Response(NetboxClient::IPRange)
      @conn.request(NetboxClient::IPRange,
        method: :GET,
        path: "/api/ipam/ip-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a IP range object.
    def update(id : Int32, writable_ip_range_request : NetboxClient::WritableIPRangeRequest) : Response(NetboxClient::IPRange)
      @conn.request(NetboxClient::IPRange,
        method: :PUT,
        path: "/api/ipam/ip-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_ip_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
