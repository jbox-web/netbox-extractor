require "json"

module NetboxClient
  module Api
  class Dcim::Sites
    def initialize(@conn : Connection); end

    #  Delete a list of site objects.
    def bulk_destroy(site_request : Array(NetboxClient::SiteRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/sites/",
        body: site_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of site objects.
    def bulk_partial_update(site_request : Array(NetboxClient::SiteRequest)) : Response(Array(NetboxClient::Site))
      @conn.request(Array(NetboxClient::Site),
        method: :PATCH,
        path: "/api/dcim/sites/",
        body: site_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of site objects.
    def bulk_update(site_request : Array(NetboxClient::SiteRequest)) : Response(Array(NetboxClient::Site))
      @conn.request(Array(NetboxClient::Site),
        method: :PUT,
        path: "/api/dcim/sites/",
        body: site_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of site objects.
    def create(dcim_sites_create_request : NetboxClient::DcimSitesCreateRequest) : Response(NetboxClient::Site)
      @conn.request(NetboxClient::Site,
        method: :POST,
        path: "/api/dcim/sites/",
        body: dcim_sites_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a site object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/sites/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of site objects.
    def list(*, asn : Array(String)? = nil, asn__n : Array(String)? = nil, asn_id : Array(Int32)? = nil, asn_id__n : Array(Int32)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, facility : Array(String)? = nil, facility__empty : Bool? = nil, facility__ic : Array(String)? = nil, facility__ie : Array(String)? = nil, facility__iew : Array(String)? = nil, facility__iregex : Array(String)? = nil, facility__isw : Array(String)? = nil, facility__n : Array(String)? = nil, facility__nic : Array(String)? = nil, facility__nie : Array(String)? = nil, facility__niew : Array(String)? = nil, facility__nisw : Array(String)? = nil, facility__regex : Array(String)? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(String)? = nil, group_id__n : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, latitude : Array(Float64)? = nil, latitude__empty : Bool? = nil, latitude__gt : Array(Float64)? = nil, latitude__gte : Array(Float64)? = nil, latitude__lt : Array(Float64)? = nil, latitude__lte : Array(Float64)? = nil, latitude__n : Array(Float64)? = nil, limit : Int32? = nil, longitude : Array(Float64)? = nil, longitude__empty : Bool? = nil, longitude__gt : Array(Float64)? = nil, longitude__gte : Array(Float64)? = nil, longitude__lt : Array(Float64)? = nil, longitude__lte : Array(Float64)? = nil, longitude__n : Array(Float64)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, time_zone : Array(String)? = nil, time_zone__ic : Array(String)? = nil, time_zone__ie : Array(String)? = nil, time_zone__iew : Array(String)? = nil, time_zone__iregex : Array(String)? = nil, time_zone__isw : Array(String)? = nil, time_zone__n : Array(String)? = nil, time_zone__nic : Array(String)? = nil, time_zone__nie : Array(String)? = nil, time_zone__niew : Array(String)? = nil, time_zone__nisw : Array(String)? = nil, time_zone__regex : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedSiteList)
      @conn.request(NetboxClient::PaginatedSiteList,
        method: :GET,
        path: "/api/dcim/sites/",
        query: { "asn" => asn, "asn__n" => asn__n, "asn_id" => asn_id, "asn_id__n" => asn_id__n, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "facility" => facility, "facility__empty" => facility__empty, "facility__ic" => facility__ic, "facility__ie" => facility__ie, "facility__iew" => facility__iew, "facility__iregex" => facility__iregex, "facility__isw" => facility__isw, "facility__n" => facility__n, "facility__nic" => facility__nic, "facility__nie" => facility__nie, "facility__niew" => facility__niew, "facility__nisw" => facility__nisw, "facility__regex" => facility__regex, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "latitude" => latitude, "latitude__empty" => latitude__empty, "latitude__gt" => latitude__gt, "latitude__gte" => latitude__gte, "latitude__lt" => latitude__lt, "latitude__lte" => latitude__lte, "latitude__n" => latitude__n, "limit" => limit, "longitude" => longitude, "longitude__empty" => longitude__empty, "longitude__gt" => longitude__gt, "longitude__gte" => longitude__gte, "longitude__lt" => longitude__lt, "longitude__lte" => longitude__lte, "longitude__n" => longitude__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "time_zone" => time_zone, "time_zone__ic" => time_zone__ic, "time_zone__ie" => time_zone__ie, "time_zone__iew" => time_zone__iew, "time_zone__iregex" => time_zone__iregex, "time_zone__isw" => time_zone__isw, "time_zone__n" => time_zone__n, "time_zone__nic" => time_zone__nic, "time_zone__nie" => time_zone__nie, "time_zone__niew" => time_zone__niew, "time_zone__nisw" => time_zone__nisw, "time_zone__regex" => time_zone__regex, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a site object.
    def partial_update(id : Int32, patched_writable_site_request : NetboxClient::PatchedWritableSiteRequest? = nil) : Response(NetboxClient::Site)
      @conn.request(NetboxClient::Site,
        method: :PATCH,
        path: "/api/dcim/sites/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_site_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a site object.
    def retrieve(id : Int32) : Response(NetboxClient::Site)
      @conn.request(NetboxClient::Site,
        method: :GET,
        path: "/api/dcim/sites/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a site object.
    def update(id : Int32, writable_site_request : NetboxClient::WritableSiteRequest) : Response(NetboxClient::Site)
      @conn.request(NetboxClient::Site,
        method: :PUT,
        path: "/api/dcim/sites/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_site_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
