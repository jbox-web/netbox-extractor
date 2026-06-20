require "json"

module NetboxClient
  module Api
  class Dcim::Racks
    def initialize(@conn : Connection); end

    #  Delete a list of rack objects.
    def bulk_destroy(rack_request : Array(NetboxClient::RackRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/racks/",
        body: rack_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of rack objects.
    def bulk_partial_update(rack_request : Array(NetboxClient::RackRequest)) : Response(Array(NetboxClient::Rack))
      @conn.request(Array(NetboxClient::Rack),
        method: :PATCH,
        path: "/api/dcim/racks/",
        body: rack_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of rack objects.
    def bulk_update(rack_request : Array(NetboxClient::RackRequest)) : Response(Array(NetboxClient::Rack))
      @conn.request(Array(NetboxClient::Rack),
        method: :PUT,
        path: "/api/dcim/racks/",
        body: rack_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of rack objects.
    def create(dcim_racks_create_request : NetboxClient::DcimRacksCreateRequest) : Response(NetboxClient::Rack)
      @conn.request(NetboxClient::Rack,
        method: :POST,
        path: "/api/dcim/racks/",
        body: dcim_racks_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a rack object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/racks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Rack elevation representing the list of rack units. Also supports rendering the elevation as an SVG.
    def elevation_retrieve(id : Int32, *, exclude : Int32? = nil, expand_devices : Bool? = nil, face : String? = nil, include_images : Bool? = nil, legend_width : Int32? = nil, limit : Int32? = nil, margin_width : Int32? = nil, offset : Int32? = nil, q : String? = nil, render : String? = nil, unit_height : Int32? = nil, unit_width : Int32? = nil) : Response(NetboxClient::PaginatedRackUnitList)
      @conn.request(NetboxClient::PaginatedRackUnitList,
        method: :GET,
        path: "/api/dcim/racks/{id}/elevation/".sub("{id}", NetboxClient.enc(id)),
        query: { "exclude" => exclude, "expand_devices" => expand_devices, "face" => face, "include_images" => include_images, "legend_width" => legend_width, "limit" => limit, "margin_width" => margin_width, "offset" => offset, "q" => q, "render" => render, "unit_height" => unit_height, "unit_width" => unit_width },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of rack objects.
    def list(*, airflow : String? = nil, asset_tag : Array(String)? = nil, asset_tag__empty : Bool? = nil, asset_tag__ic : Array(String)? = nil, asset_tag__ie : Array(String)? = nil, asset_tag__iew : Array(String)? = nil, asset_tag__iregex : Array(String)? = nil, asset_tag__isw : Array(String)? = nil, asset_tag__n : Array(String)? = nil, asset_tag__nic : Array(String)? = nil, asset_tag__nie : Array(String)? = nil, asset_tag__niew : Array(String)? = nil, asset_tag__nisw : Array(String)? = nil, asset_tag__regex : Array(String)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, desc_units : Bool? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, facility_id : Array(String)? = nil, facility_id__empty : Bool? = nil, facility_id__ic : Array(String)? = nil, facility_id__ie : Array(String)? = nil, facility_id__iew : Array(String)? = nil, facility_id__iregex : Array(String)? = nil, facility_id__isw : Array(String)? = nil, facility_id__n : Array(String)? = nil, facility_id__nic : Array(String)? = nil, facility_id__nie : Array(String)? = nil, facility_id__niew : Array(String)? = nil, facility_id__nisw : Array(String)? = nil, facility_id__regex : Array(String)? = nil, form_factor : Array(String)? = nil, form_factor__empty : Bool? = nil, form_factor__ic : Array(String)? = nil, form_factor__ie : Array(String)? = nil, form_factor__iew : Array(String)? = nil, form_factor__iregex : Array(String)? = nil, form_factor__isw : Array(String)? = nil, form_factor__n : Array(String)? = nil, form_factor__nic : Array(String)? = nil, form_factor__nie : Array(String)? = nil, form_factor__niew : Array(String)? = nil, form_factor__nisw : Array(String)? = nil, form_factor__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(String)? = nil, location_id__n : Array(String)? = nil, manufacturer : Array(String)? = nil, manufacturer__n : Array(String)? = nil, manufacturer_id : Array(Int32)? = nil, manufacturer_id__n : Array(Int32)? = nil, max_weight : Array(Int32)? = nil, max_weight__empty : Bool? = nil, max_weight__gt : Array(Int32)? = nil, max_weight__gte : Array(Int32)? = nil, max_weight__lt : Array(Int32)? = nil, max_weight__lte : Array(Int32)? = nil, max_weight__n : Array(Int32)? = nil, modified_by_request : String? = nil, mounting_depth : Array(Int32)? = nil, mounting_depth__empty : Bool? = nil, mounting_depth__gt : Array(Int32)? = nil, mounting_depth__gte : Array(Int32)? = nil, mounting_depth__lt : Array(Int32)? = nil, mounting_depth__lte : Array(Int32)? = nil, mounting_depth__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, outer_depth : Array(Int32)? = nil, outer_depth__empty : Bool? = nil, outer_depth__gt : Array(Int32)? = nil, outer_depth__gte : Array(Int32)? = nil, outer_depth__lt : Array(Int32)? = nil, outer_depth__lte : Array(Int32)? = nil, outer_depth__n : Array(Int32)? = nil, outer_height : Array(Int32)? = nil, outer_height__empty : Bool? = nil, outer_height__gt : Array(Int32)? = nil, outer_height__gte : Array(Int32)? = nil, outer_height__lt : Array(Int32)? = nil, outer_height__lte : Array(Int32)? = nil, outer_height__n : Array(Int32)? = nil, outer_unit : String? = nil, outer_width : Array(Int32)? = nil, outer_width__empty : Bool? = nil, outer_width__gt : Array(Int32)? = nil, outer_width__gte : Array(Int32)? = nil, outer_width__lt : Array(Int32)? = nil, outer_width__lte : Array(Int32)? = nil, outer_width__n : Array(Int32)? = nil, q : String? = nil, rack_type : Array(String)? = nil, rack_type__n : Array(String)? = nil, rack_type_id : Array(Int32)? = nil, rack_type_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, serial : Array(String)? = nil, serial__empty : Bool? = nil, serial__ic : Array(String)? = nil, serial__ie : Array(String)? = nil, serial__iew : Array(String)? = nil, serial__iregex : Array(String)? = nil, serial__isw : Array(String)? = nil, serial__n : Array(String)? = nil, serial__nic : Array(String)? = nil, serial__nie : Array(String)? = nil, serial__niew : Array(String)? = nil, serial__nisw : Array(String)? = nil, serial__regex : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, starting_unit : Array(Int32)? = nil, starting_unit__empty : Bool? = nil, starting_unit__gt : Array(Int32)? = nil, starting_unit__gte : Array(Int32)? = nil, starting_unit__lt : Array(Int32)? = nil, starting_unit__lte : Array(Int32)? = nil, starting_unit__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, u_height : Array(Int32)? = nil, u_height__empty : Bool? = nil, u_height__gt : Array(Int32)? = nil, u_height__gte : Array(Int32)? = nil, u_height__lt : Array(Int32)? = nil, u_height__lte : Array(Int32)? = nil, u_height__n : Array(Int32)? = nil, updated_by_request : String? = nil, weight : Array(Float64)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Float64)? = nil, weight__gte : Array(Float64)? = nil, weight__lt : Array(Float64)? = nil, weight__lte : Array(Float64)? = nil, weight__n : Array(Float64)? = nil, weight_unit : String? = nil, width : Array(Int32)? = nil, width__ic : Array(Int32)? = nil, width__ie : Array(Int32)? = nil, width__iew : Array(Int32)? = nil, width__iregex : Array(Int32)? = nil, width__isw : Array(Int32)? = nil, width__n : Array(Int32)? = nil, width__nic : Array(Int32)? = nil, width__nie : Array(Int32)? = nil, width__niew : Array(Int32)? = nil, width__nisw : Array(Int32)? = nil, width__regex : Array(Int32)? = nil) : Response(NetboxClient::PaginatedRackList)
      @conn.request(NetboxClient::PaginatedRackList,
        method: :GET,
        path: "/api/dcim/racks/",
        query: { "airflow" => airflow, "asset_tag" => asset_tag, "asset_tag__empty" => asset_tag__empty, "asset_tag__ic" => asset_tag__ic, "asset_tag__ie" => asset_tag__ie, "asset_tag__iew" => asset_tag__iew, "asset_tag__iregex" => asset_tag__iregex, "asset_tag__isw" => asset_tag__isw, "asset_tag__n" => asset_tag__n, "asset_tag__nic" => asset_tag__nic, "asset_tag__nie" => asset_tag__nie, "asset_tag__niew" => asset_tag__niew, "asset_tag__nisw" => asset_tag__nisw, "asset_tag__regex" => asset_tag__regex, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "desc_units" => desc_units, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "facility_id" => facility_id, "facility_id__empty" => facility_id__empty, "facility_id__ic" => facility_id__ic, "facility_id__ie" => facility_id__ie, "facility_id__iew" => facility_id__iew, "facility_id__iregex" => facility_id__iregex, "facility_id__isw" => facility_id__isw, "facility_id__n" => facility_id__n, "facility_id__nic" => facility_id__nic, "facility_id__nie" => facility_id__nie, "facility_id__niew" => facility_id__niew, "facility_id__nisw" => facility_id__nisw, "facility_id__regex" => facility_id__regex, "form_factor" => form_factor, "form_factor__empty" => form_factor__empty, "form_factor__ic" => form_factor__ic, "form_factor__ie" => form_factor__ie, "form_factor__iew" => form_factor__iew, "form_factor__iregex" => form_factor__iregex, "form_factor__isw" => form_factor__isw, "form_factor__n" => form_factor__n, "form_factor__nic" => form_factor__nic, "form_factor__nie" => form_factor__nie, "form_factor__niew" => form_factor__niew, "form_factor__nisw" => form_factor__nisw, "form_factor__regex" => form_factor__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "manufacturer" => manufacturer, "manufacturer__n" => manufacturer__n, "manufacturer_id" => manufacturer_id, "manufacturer_id__n" => manufacturer_id__n, "max_weight" => max_weight, "max_weight__empty" => max_weight__empty, "max_weight__gt" => max_weight__gt, "max_weight__gte" => max_weight__gte, "max_weight__lt" => max_weight__lt, "max_weight__lte" => max_weight__lte, "max_weight__n" => max_weight__n, "modified_by_request" => modified_by_request, "mounting_depth" => mounting_depth, "mounting_depth__empty" => mounting_depth__empty, "mounting_depth__gt" => mounting_depth__gt, "mounting_depth__gte" => mounting_depth__gte, "mounting_depth__lt" => mounting_depth__lt, "mounting_depth__lte" => mounting_depth__lte, "mounting_depth__n" => mounting_depth__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "outer_depth" => outer_depth, "outer_depth__empty" => outer_depth__empty, "outer_depth__gt" => outer_depth__gt, "outer_depth__gte" => outer_depth__gte, "outer_depth__lt" => outer_depth__lt, "outer_depth__lte" => outer_depth__lte, "outer_depth__n" => outer_depth__n, "outer_height" => outer_height, "outer_height__empty" => outer_height__empty, "outer_height__gt" => outer_height__gt, "outer_height__gte" => outer_height__gte, "outer_height__lt" => outer_height__lt, "outer_height__lte" => outer_height__lte, "outer_height__n" => outer_height__n, "outer_unit" => outer_unit, "outer_width" => outer_width, "outer_width__empty" => outer_width__empty, "outer_width__gt" => outer_width__gt, "outer_width__gte" => outer_width__gte, "outer_width__lt" => outer_width__lt, "outer_width__lte" => outer_width__lte, "outer_width__n" => outer_width__n, "q" => q, "rack_type" => rack_type, "rack_type__n" => rack_type__n, "rack_type_id" => rack_type_id, "rack_type_id__n" => rack_type_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "serial" => serial, "serial__empty" => serial__empty, "serial__ic" => serial__ic, "serial__ie" => serial__ie, "serial__iew" => serial__iew, "serial__iregex" => serial__iregex, "serial__isw" => serial__isw, "serial__n" => serial__n, "serial__nic" => serial__nic, "serial__nie" => serial__nie, "serial__niew" => serial__niew, "serial__nisw" => serial__nisw, "serial__regex" => serial__regex, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "starting_unit" => starting_unit, "starting_unit__empty" => starting_unit__empty, "starting_unit__gt" => starting_unit__gt, "starting_unit__gte" => starting_unit__gte, "starting_unit__lt" => starting_unit__lt, "starting_unit__lte" => starting_unit__lte, "starting_unit__n" => starting_unit__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "u_height" => u_height, "u_height__empty" => u_height__empty, "u_height__gt" => u_height__gt, "u_height__gte" => u_height__gte, "u_height__lt" => u_height__lt, "u_height__lte" => u_height__lte, "u_height__n" => u_height__n, "updated_by_request" => updated_by_request, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n, "weight_unit" => weight_unit, "width" => width, "width__ic" => width__ic, "width__ie" => width__ie, "width__iew" => width__iew, "width__iregex" => width__iregex, "width__isw" => width__isw, "width__n" => width__n, "width__nic" => width__nic, "width__nie" => width__nie, "width__niew" => width__niew, "width__nisw" => width__nisw, "width__regex" => width__regex },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a rack object.
    def partial_update(id : Int32, patched_writable_rack_request : NetboxClient::PatchedWritableRackRequest? = nil) : Response(NetboxClient::Rack)
      @conn.request(NetboxClient::Rack,
        method: :PATCH,
        path: "/api/dcim/racks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_rack_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a rack object.
    def retrieve(id : Int32) : Response(NetboxClient::Rack)
      @conn.request(NetboxClient::Rack,
        method: :GET,
        path: "/api/dcim/racks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a rack object.
    def update(id : Int32, writable_rack_request : NetboxClient::WritableRackRequest) : Response(NetboxClient::Rack)
      @conn.request(NetboxClient::Rack,
        method: :PUT,
        path: "/api/dcim/racks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_rack_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
