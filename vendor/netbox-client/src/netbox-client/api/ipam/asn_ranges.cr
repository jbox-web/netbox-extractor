require "json"

module NetboxClient
  module Api
  class Ipam::AsnRanges
    def initialize(@conn : Connection); end

    #  Post a ASN object.
    def available_asns_create(id : Int32, asn_request : Array(NetboxClient::ASNRequest)) : Response(Array(NetboxClient::ASN))
      @conn.request(Array(NetboxClient::ASN),
        method: :POST,
        path: "/api/ipam/asn-ranges/{id}/available-asns/".sub("{id}", NetboxClient.enc(id)),
        body: asn_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a ASN object.
    def available_asns_list(id : Int32) : Response(Array(NetboxClient::AvailableASN))
      @conn.request(Array(NetboxClient::AvailableASN),
        method: :GET,
        path: "/api/ipam/asn-ranges/{id}/available-asns/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a list of ASN range objects.
    def bulk_destroy(asn_range_request : Array(NetboxClient::ASNRangeRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/asn-ranges/",
        body: asn_range_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of ASN range objects.
    def bulk_partial_update(asn_range_request : Array(NetboxClient::ASNRangeRequest)) : Response(Array(NetboxClient::ASNRange))
      @conn.request(Array(NetboxClient::ASNRange),
        method: :PATCH,
        path: "/api/ipam/asn-ranges/",
        body: asn_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of ASN range objects.
    def bulk_update(asn_range_request : Array(NetboxClient::ASNRangeRequest)) : Response(Array(NetboxClient::ASNRange))
      @conn.request(Array(NetboxClient::ASNRange),
        method: :PUT,
        path: "/api/ipam/asn-ranges/",
        body: asn_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of ASN range objects.
    def create(ipam_asn_ranges_create_request : NetboxClient::IpamAsnRangesCreateRequest) : Response(NetboxClient::ASNRange)
      @conn.request(NetboxClient::ASNRange,
        method: :POST,
        path: "/api/ipam/asn-ranges/",
        body: ipam_asn_ranges_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a ASN range object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/asn-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of ASN range objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, _end : Array(Int32)? = nil, end__empty : Bool? = nil, end__gt : Array(Int32)? = nil, end__gte : Array(Int32)? = nil, end__lt : Array(Int32)? = nil, end__lte : Array(Int32)? = nil, end__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, rir : Array(String)? = nil, rir__n : Array(String)? = nil, rir_id : Array(Int32)? = nil, rir_id__n : Array(Int32)? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, start : Array(Int32)? = nil, start__empty : Bool? = nil, start__gt : Array(Int32)? = nil, start__gte : Array(Int32)? = nil, start__lt : Array(Int32)? = nil, start__lte : Array(Int32)? = nil, start__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedASNRangeList)
      @conn.request(NetboxClient::PaginatedASNRangeList,
        method: :GET,
        path: "/api/ipam/asn-ranges/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "end" => _end, "end__empty" => end__empty, "end__gt" => end__gt, "end__gte" => end__gte, "end__lt" => end__lt, "end__lte" => end__lte, "end__n" => end__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "rir" => rir, "rir__n" => rir__n, "rir_id" => rir_id, "rir_id__n" => rir_id__n, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "start" => start, "start__empty" => start__empty, "start__gt" => start__gt, "start__gte" => start__gte, "start__lt" => start__lt, "start__lte" => start__lte, "start__n" => start__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a ASN range object.
    def partial_update(id : Int32, patched_asn_range_request : NetboxClient::PatchedASNRangeRequest? = nil) : Response(NetboxClient::ASNRange)
      @conn.request(NetboxClient::ASNRange,
        method: :PATCH,
        path: "/api/ipam/asn-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_asn_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a ASN range object.
    def retrieve(id : Int32) : Response(NetboxClient::ASNRange)
      @conn.request(NetboxClient::ASNRange,
        method: :GET,
        path: "/api/ipam/asn-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a ASN range object.
    def update(id : Int32, asn_range_request : NetboxClient::ASNRangeRequest) : Response(NetboxClient::ASNRange)
      @conn.request(NetboxClient::ASNRange,
        method: :PUT,
        path: "/api/ipam/asn-ranges/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: asn_range_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
