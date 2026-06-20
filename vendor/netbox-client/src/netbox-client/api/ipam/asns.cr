require "json"

module NetboxClient
  module Api
  class Ipam::Asns
    def initialize(@conn : Connection); end

    #  Delete a list of ASN objects.
    def bulk_destroy(asn_request : Array(NetboxClient::ASNRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/asns/",
        body: asn_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of ASN objects.
    def bulk_partial_update(asn_request : Array(NetboxClient::ASNRequest)) : Response(Array(NetboxClient::ASN))
      @conn.request(Array(NetboxClient::ASN),
        method: :PATCH,
        path: "/api/ipam/asns/",
        body: asn_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of ASN objects.
    def bulk_update(asn_request : Array(NetboxClient::ASNRequest)) : Response(Array(NetboxClient::ASN))
      @conn.request(Array(NetboxClient::ASN),
        method: :PUT,
        path: "/api/ipam/asns/",
        body: asn_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of ASN objects.
    def create(ipam_asns_create_request : NetboxClient::IpamAsnsCreateRequest) : Response(NetboxClient::ASN)
      @conn.request(NetboxClient::ASN,
        method: :POST,
        path: "/api/ipam/asns/",
        body: ipam_asns_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a ASN object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/asns/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of ASN objects.
    def list(*, asn : Array(Int32)? = nil, asn__empty : Bool? = nil, asn__gt : Array(Int32)? = nil, asn__gte : Array(Int32)? = nil, asn__lt : Array(Int32)? = nil, asn__lte : Array(Int32)? = nil, asn__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, provider : Array(String)? = nil, provider__n : Array(String)? = nil, provider_id : Array(Int32)? = nil, provider_id__n : Array(Int32)? = nil, q : String? = nil, rir : Array(String)? = nil, rir__n : Array(String)? = nil, rir_id : Array(Int32)? = nil, rir_id__n : Array(Int32)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedASNList)
      @conn.request(NetboxClient::PaginatedASNList,
        method: :GET,
        path: "/api/ipam/asns/",
        query: { "asn" => asn, "asn__empty" => asn__empty, "asn__gt" => asn__gt, "asn__gte" => asn__gte, "asn__lt" => asn__lt, "asn__lte" => asn__lte, "asn__n" => asn__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "provider" => provider, "provider__n" => provider__n, "provider_id" => provider_id, "provider_id__n" => provider_id__n, "q" => q, "rir" => rir, "rir__n" => rir__n, "rir_id" => rir_id, "rir_id__n" => rir_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a ASN object.
    def partial_update(id : Int32, patched_asn_request : NetboxClient::PatchedASNRequest? = nil) : Response(NetboxClient::ASN)
      @conn.request(NetboxClient::ASN,
        method: :PATCH,
        path: "/api/ipam/asns/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_asn_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a ASN object.
    def retrieve(id : Int32) : Response(NetboxClient::ASN)
      @conn.request(NetboxClient::ASN,
        method: :GET,
        path: "/api/ipam/asns/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a ASN object.
    def update(id : Int32, asn_request : NetboxClient::ASNRequest) : Response(NetboxClient::ASN)
      @conn.request(NetboxClient::ASN,
        method: :PUT,
        path: "/api/ipam/asns/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: asn_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
