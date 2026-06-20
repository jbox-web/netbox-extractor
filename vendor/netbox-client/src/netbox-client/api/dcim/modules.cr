require "json"

module NetboxClient
  module Api
  class Dcim::Modules
    def initialize(@conn : Connection); end

    #  Delete a list of module objects.
    def bulk_destroy(module_request : Array(NetboxClient::ModuleRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/modules/",
        body: module_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of module objects.
    def bulk_partial_update(module_request : Array(NetboxClient::ModuleRequest)) : Response(Array(NetboxClient::ModelModule))
      @conn.request(Array(NetboxClient::ModelModule),
        method: :PATCH,
        path: "/api/dcim/modules/",
        body: module_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of module objects.
    def bulk_update(module_request : Array(NetboxClient::ModuleRequest)) : Response(Array(NetboxClient::ModelModule))
      @conn.request(Array(NetboxClient::ModelModule),
        method: :PUT,
        path: "/api/dcim/modules/",
        body: module_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of module objects.
    def create(dcim_modules_create_request : NetboxClient::DcimModulesCreateRequest) : Response(NetboxClient::ModelModule)
      @conn.request(NetboxClient::ModelModule,
        method: :POST,
        path: "/api/dcim/modules/",
        body: dcim_modules_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a module object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/modules/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of module objects.
    def list(*, asset_tag : Array(String)? = nil, asset_tag__empty : Bool? = nil, asset_tag__ic : Array(String)? = nil, asset_tag__ie : Array(String)? = nil, asset_tag__iew : Array(String)? = nil, asset_tag__iregex : Array(String)? = nil, asset_tag__isw : Array(String)? = nil, asset_tag__n : Array(String)? = nil, asset_tag__nic : Array(String)? = nil, asset_tag__nie : Array(String)? = nil, asset_tag__niew : Array(String)? = nil, asset_tag__nisw : Array(String)? = nil, asset_tag__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device__n : Array(String)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(Int32)? = nil, location_id__n : Array(Int32)? = nil, manufacturer : Array(String)? = nil, manufacturer__n : Array(String)? = nil, manufacturer_id : Array(Int32)? = nil, manufacturer_id__n : Array(Int32)? = nil, modified_by_request : String? = nil, module_bay_id : Array(String)? = nil, module_bay_id__n : Array(String)? = nil, module_type : Array(String)? = nil, module_type__n : Array(String)? = nil, module_type_id : Array(Int32)? = nil, module_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, rack : Array(String)? = nil, rack__n : Array(String)? = nil, rack_id : Array(Int32)? = nil, rack_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, serial : Array(String)? = nil, serial__empty : Bool? = nil, serial__ic : Array(String)? = nil, serial__ie : Array(String)? = nil, serial__iew : Array(String)? = nil, serial__iregex : Array(String)? = nil, serial__isw : Array(String)? = nil, serial__n : Array(String)? = nil, serial__nic : Array(String)? = nil, serial__nie : Array(String)? = nil, serial__niew : Array(String)? = nil, serial__nisw : Array(String)? = nil, serial__regex : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedModuleList)
      @conn.request(NetboxClient::PaginatedModuleList,
        method: :GET,
        path: "/api/dcim/modules/",
        query: { "asset_tag" => asset_tag, "asset_tag__empty" => asset_tag__empty, "asset_tag__ic" => asset_tag__ic, "asset_tag__ie" => asset_tag__ie, "asset_tag__iew" => asset_tag__iew, "asset_tag__iregex" => asset_tag__iregex, "asset_tag__isw" => asset_tag__isw, "asset_tag__n" => asset_tag__n, "asset_tag__nic" => asset_tag__nic, "asset_tag__nie" => asset_tag__nie, "asset_tag__niew" => asset_tag__niew, "asset_tag__nisw" => asset_tag__nisw, "asset_tag__regex" => asset_tag__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "manufacturer" => manufacturer, "manufacturer__n" => manufacturer__n, "manufacturer_id" => manufacturer_id, "manufacturer_id__n" => manufacturer_id__n, "modified_by_request" => modified_by_request, "module_bay_id" => module_bay_id, "module_bay_id__n" => module_bay_id__n, "module_type" => module_type, "module_type__n" => module_type__n, "module_type_id" => module_type_id, "module_type_id__n" => module_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "rack" => rack, "rack__n" => rack__n, "rack_id" => rack_id, "rack_id__n" => rack_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "serial" => serial, "serial__empty" => serial__empty, "serial__ic" => serial__ic, "serial__ie" => serial__ie, "serial__iew" => serial__iew, "serial__iregex" => serial__iregex, "serial__isw" => serial__isw, "serial__n" => serial__n, "serial__nic" => serial__nic, "serial__nie" => serial__nie, "serial__niew" => serial__niew, "serial__nisw" => serial__nisw, "serial__regex" => serial__regex, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a module object.
    def partial_update(id : Int32, patched_writable_module_request : NetboxClient::PatchedWritableModuleRequest? = nil) : Response(NetboxClient::ModelModule)
      @conn.request(NetboxClient::ModelModule,
        method: :PATCH,
        path: "/api/dcim/modules/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_module_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a module object.
    def retrieve(id : Int32) : Response(NetboxClient::ModelModule)
      @conn.request(NetboxClient::ModelModule,
        method: :GET,
        path: "/api/dcim/modules/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a module object.
    def update(id : Int32, writable_module_request : NetboxClient::WritableModuleRequest) : Response(NetboxClient::ModelModule)
      @conn.request(NetboxClient::ModelModule,
        method: :PUT,
        path: "/api/dcim/modules/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_module_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
