require "json"

module NetboxClient
  module Api
  class Dcim::RackTypes
    def initialize(@conn : Connection); end

    #  Delete a list of rack type objects.
    def bulk_destroy(rack_type_request : Array(NetboxClient::RackTypeRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/rack-types/",
        body: rack_type_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of rack type objects.
    def bulk_partial_update(rack_type_request : Array(NetboxClient::RackTypeRequest)) : Response(Array(NetboxClient::RackType))
      @conn.request(Array(NetboxClient::RackType),
        method: :PATCH,
        path: "/api/dcim/rack-types/",
        body: rack_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of rack type objects.
    def bulk_update(rack_type_request : Array(NetboxClient::RackTypeRequest)) : Response(Array(NetboxClient::RackType))
      @conn.request(Array(NetboxClient::RackType),
        method: :PUT,
        path: "/api/dcim/rack-types/",
        body: rack_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of rack type objects.
    def create(dcim_rack_types_create_request : NetboxClient::DcimRackTypesCreateRequest) : Response(NetboxClient::RackType)
      @conn.request(NetboxClient::RackType,
        method: :POST,
        path: "/api/dcim/rack-types/",
        body: dcim_rack_types_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a rack type object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/rack-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of rack type objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, desc_units : Bool? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, form_factor : Array(String)? = nil, form_factor__empty : Bool? = nil, form_factor__ic : Array(String)? = nil, form_factor__ie : Array(String)? = nil, form_factor__iew : Array(String)? = nil, form_factor__iregex : Array(String)? = nil, form_factor__isw : Array(String)? = nil, form_factor__n : Array(String)? = nil, form_factor__nic : Array(String)? = nil, form_factor__nie : Array(String)? = nil, form_factor__niew : Array(String)? = nil, form_factor__nisw : Array(String)? = nil, form_factor__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, manufacturer : Array(String)? = nil, manufacturer__n : Array(String)? = nil, manufacturer_id : Array(Int32)? = nil, manufacturer_id__n : Array(Int32)? = nil, max_weight : Array(Int32)? = nil, max_weight__empty : Bool? = nil, max_weight__gt : Array(Int32)? = nil, max_weight__gte : Array(Int32)? = nil, max_weight__lt : Array(Int32)? = nil, max_weight__lte : Array(Int32)? = nil, max_weight__n : Array(Int32)? = nil, model : Array(String)? = nil, model__empty : Bool? = nil, model__ic : Array(String)? = nil, model__ie : Array(String)? = nil, model__iew : Array(String)? = nil, model__iregex : Array(String)? = nil, model__isw : Array(String)? = nil, model__n : Array(String)? = nil, model__nic : Array(String)? = nil, model__nie : Array(String)? = nil, model__niew : Array(String)? = nil, model__nisw : Array(String)? = nil, model__regex : Array(String)? = nil, modified_by_request : String? = nil, mounting_depth : Array(Int32)? = nil, mounting_depth__empty : Bool? = nil, mounting_depth__gt : Array(Int32)? = nil, mounting_depth__gte : Array(Int32)? = nil, mounting_depth__lt : Array(Int32)? = nil, mounting_depth__lte : Array(Int32)? = nil, mounting_depth__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, outer_depth : Array(Int32)? = nil, outer_depth__empty : Bool? = nil, outer_depth__gt : Array(Int32)? = nil, outer_depth__gte : Array(Int32)? = nil, outer_depth__lt : Array(Int32)? = nil, outer_depth__lte : Array(Int32)? = nil, outer_depth__n : Array(Int32)? = nil, outer_height : Array(Int32)? = nil, outer_height__empty : Bool? = nil, outer_height__gt : Array(Int32)? = nil, outer_height__gte : Array(Int32)? = nil, outer_height__lt : Array(Int32)? = nil, outer_height__lte : Array(Int32)? = nil, outer_height__n : Array(Int32)? = nil, outer_unit : String? = nil, outer_width : Array(Int32)? = nil, outer_width__empty : Bool? = nil, outer_width__gt : Array(Int32)? = nil, outer_width__gte : Array(Int32)? = nil, outer_width__lt : Array(Int32)? = nil, outer_width__lte : Array(Int32)? = nil, outer_width__n : Array(Int32)? = nil, q : String? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, starting_unit : Array(Int32)? = nil, starting_unit__empty : Bool? = nil, starting_unit__gt : Array(Int32)? = nil, starting_unit__gte : Array(Int32)? = nil, starting_unit__lt : Array(Int32)? = nil, starting_unit__lte : Array(Int32)? = nil, starting_unit__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, u_height : Array(Int32)? = nil, u_height__empty : Bool? = nil, u_height__gt : Array(Int32)? = nil, u_height__gte : Array(Int32)? = nil, u_height__lt : Array(Int32)? = nil, u_height__lte : Array(Int32)? = nil, u_height__n : Array(Int32)? = nil, updated_by_request : String? = nil, weight : Array(Float64)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Float64)? = nil, weight__gte : Array(Float64)? = nil, weight__lt : Array(Float64)? = nil, weight__lte : Array(Float64)? = nil, weight__n : Array(Float64)? = nil, weight_unit : String? = nil, width : Array(Int32)? = nil, width__ic : Array(Int32)? = nil, width__ie : Array(Int32)? = nil, width__iew : Array(Int32)? = nil, width__iregex : Array(Int32)? = nil, width__isw : Array(Int32)? = nil, width__n : Array(Int32)? = nil, width__nic : Array(Int32)? = nil, width__nie : Array(Int32)? = nil, width__niew : Array(Int32)? = nil, width__nisw : Array(Int32)? = nil, width__regex : Array(Int32)? = nil) : Response(NetboxClient::PaginatedRackTypeList)
      @conn.request(NetboxClient::PaginatedRackTypeList,
        method: :GET,
        path: "/api/dcim/rack-types/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "desc_units" => desc_units, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "form_factor" => form_factor, "form_factor__empty" => form_factor__empty, "form_factor__ic" => form_factor__ic, "form_factor__ie" => form_factor__ie, "form_factor__iew" => form_factor__iew, "form_factor__iregex" => form_factor__iregex, "form_factor__isw" => form_factor__isw, "form_factor__n" => form_factor__n, "form_factor__nic" => form_factor__nic, "form_factor__nie" => form_factor__nie, "form_factor__niew" => form_factor__niew, "form_factor__nisw" => form_factor__nisw, "form_factor__regex" => form_factor__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "manufacturer" => manufacturer, "manufacturer__n" => manufacturer__n, "manufacturer_id" => manufacturer_id, "manufacturer_id__n" => manufacturer_id__n, "max_weight" => max_weight, "max_weight__empty" => max_weight__empty, "max_weight__gt" => max_weight__gt, "max_weight__gte" => max_weight__gte, "max_weight__lt" => max_weight__lt, "max_weight__lte" => max_weight__lte, "max_weight__n" => max_weight__n, "model" => model, "model__empty" => model__empty, "model__ic" => model__ic, "model__ie" => model__ie, "model__iew" => model__iew, "model__iregex" => model__iregex, "model__isw" => model__isw, "model__n" => model__n, "model__nic" => model__nic, "model__nie" => model__nie, "model__niew" => model__niew, "model__nisw" => model__nisw, "model__regex" => model__regex, "modified_by_request" => modified_by_request, "mounting_depth" => mounting_depth, "mounting_depth__empty" => mounting_depth__empty, "mounting_depth__gt" => mounting_depth__gt, "mounting_depth__gte" => mounting_depth__gte, "mounting_depth__lt" => mounting_depth__lt, "mounting_depth__lte" => mounting_depth__lte, "mounting_depth__n" => mounting_depth__n, "offset" => offset, "ordering" => ordering, "outer_depth" => outer_depth, "outer_depth__empty" => outer_depth__empty, "outer_depth__gt" => outer_depth__gt, "outer_depth__gte" => outer_depth__gte, "outer_depth__lt" => outer_depth__lt, "outer_depth__lte" => outer_depth__lte, "outer_depth__n" => outer_depth__n, "outer_height" => outer_height, "outer_height__empty" => outer_height__empty, "outer_height__gt" => outer_height__gt, "outer_height__gte" => outer_height__gte, "outer_height__lt" => outer_height__lt, "outer_height__lte" => outer_height__lte, "outer_height__n" => outer_height__n, "outer_unit" => outer_unit, "outer_width" => outer_width, "outer_width__empty" => outer_width__empty, "outer_width__gt" => outer_width__gt, "outer_width__gte" => outer_width__gte, "outer_width__lt" => outer_width__lt, "outer_width__lte" => outer_width__lte, "outer_width__n" => outer_width__n, "q" => q, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "starting_unit" => starting_unit, "starting_unit__empty" => starting_unit__empty, "starting_unit__gt" => starting_unit__gt, "starting_unit__gte" => starting_unit__gte, "starting_unit__lt" => starting_unit__lt, "starting_unit__lte" => starting_unit__lte, "starting_unit__n" => starting_unit__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "u_height" => u_height, "u_height__empty" => u_height__empty, "u_height__gt" => u_height__gt, "u_height__gte" => u_height__gte, "u_height__lt" => u_height__lt, "u_height__lte" => u_height__lte, "u_height__n" => u_height__n, "updated_by_request" => updated_by_request, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n, "weight_unit" => weight_unit, "width" => width, "width__ic" => width__ic, "width__ie" => width__ie, "width__iew" => width__iew, "width__iregex" => width__iregex, "width__isw" => width__isw, "width__n" => width__n, "width__nic" => width__nic, "width__nie" => width__nie, "width__niew" => width__niew, "width__nisw" => width__nisw, "width__regex" => width__regex },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a rack type object.
    def partial_update(id : Int32, patched_writable_rack_type_request : NetboxClient::PatchedWritableRackTypeRequest? = nil) : Response(NetboxClient::RackType)
      @conn.request(NetboxClient::RackType,
        method: :PATCH,
        path: "/api/dcim/rack-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_rack_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a rack type object.
    def retrieve(id : Int32) : Response(NetboxClient::RackType)
      @conn.request(NetboxClient::RackType,
        method: :GET,
        path: "/api/dcim/rack-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a rack type object.
    def update(id : Int32, writable_rack_type_request : NetboxClient::WritableRackTypeRequest) : Response(NetboxClient::RackType)
      @conn.request(NetboxClient::RackType,
        method: :PUT,
        path: "/api/dcim/rack-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_rack_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
