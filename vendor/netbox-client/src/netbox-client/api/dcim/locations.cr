require "json"

module NetboxClient
  module Api
  class Dcim::Locations
    def initialize(@conn : Connection); end

    #  Delete a list of location objects.
    def bulk_destroy(location_request : Array(NetboxClient::LocationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/locations/",
        body: location_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of location objects.
    def bulk_partial_update(location_request : Array(NetboxClient::LocationRequest)) : Response(Array(NetboxClient::Location))
      @conn.request(Array(NetboxClient::Location),
        method: :PATCH,
        path: "/api/dcim/locations/",
        body: location_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of location objects.
    def bulk_update(location_request : Array(NetboxClient::LocationRequest)) : Response(Array(NetboxClient::Location))
      @conn.request(Array(NetboxClient::Location),
        method: :PUT,
        path: "/api/dcim/locations/",
        body: location_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of location objects.
    def create(dcim_locations_create_request : NetboxClient::DcimLocationsCreateRequest) : Response(NetboxClient::Location)
      @conn.request(NetboxClient::Location,
        method: :POST,
        path: "/api/dcim/locations/",
        body: dcim_locations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a location object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/locations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of location objects.
    def list(*, ancestor : Array(String)? = nil, ancestor__n : Array(String)? = nil, ancestor_id : Array(String)? = nil, ancestor_id__n : Array(String)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, facility : Array(String)? = nil, facility__empty : Bool? = nil, facility__ic : Array(String)? = nil, facility__ie : Array(String)? = nil, facility__iew : Array(String)? = nil, facility__iregex : Array(String)? = nil, facility__isw : Array(String)? = nil, facility__n : Array(String)? = nil, facility__nic : Array(String)? = nil, facility__nie : Array(String)? = nil, facility__niew : Array(String)? = nil, facility__nisw : Array(String)? = nil, facility__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, parent : Array(String)? = nil, parent__n : Array(String)? = nil, parent_id : Array(Int32)? = nil, parent_id__n : Array(Int32)? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedLocationList)
      @conn.request(NetboxClient::PaginatedLocationList,
        method: :GET,
        path: "/api/dcim/locations/",
        query: { "ancestor" => ancestor, "ancestor__n" => ancestor__n, "ancestor_id" => ancestor_id, "ancestor_id__n" => ancestor_id__n, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "facility" => facility, "facility__empty" => facility__empty, "facility__ic" => facility__ic, "facility__ie" => facility__ie, "facility__iew" => facility__iew, "facility__iregex" => facility__iregex, "facility__isw" => facility__isw, "facility__n" => facility__n, "facility__nic" => facility__nic, "facility__nie" => facility__nie, "facility__niew" => facility__niew, "facility__nisw" => facility__nisw, "facility__regex" => facility__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "parent" => parent, "parent__n" => parent__n, "parent_id" => parent_id, "parent_id__n" => parent_id__n, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a location object.
    def partial_update(id : Int32, patched_writable_location_request : NetboxClient::PatchedWritableLocationRequest? = nil) : Response(NetboxClient::Location)
      @conn.request(NetboxClient::Location,
        method: :PATCH,
        path: "/api/dcim/locations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_location_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a location object.
    def retrieve(id : Int32) : Response(NetboxClient::Location)
      @conn.request(NetboxClient::Location,
        method: :GET,
        path: "/api/dcim/locations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a location object.
    def update(id : Int32, writable_location_request : NetboxClient::WritableLocationRequest) : Response(NetboxClient::Location)
      @conn.request(NetboxClient::Location,
        method: :PUT,
        path: "/api/dcim/locations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_location_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
