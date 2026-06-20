require "json"

module NetboxClient
  module Api
  class Dcim::ModuleTypes
    def initialize(@conn : Connection); end

    #  Delete a list of module type objects.
    def bulk_destroy(module_type_request : Array(NetboxClient::ModuleTypeRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/module-types/",
        body: module_type_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of module type objects.
    def bulk_partial_update(module_type_request : Array(NetboxClient::ModuleTypeRequest)) : Response(Array(NetboxClient::ModuleType))
      @conn.request(Array(NetboxClient::ModuleType),
        method: :PATCH,
        path: "/api/dcim/module-types/",
        body: module_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of module type objects.
    def bulk_update(module_type_request : Array(NetboxClient::ModuleTypeRequest)) : Response(Array(NetboxClient::ModuleType))
      @conn.request(Array(NetboxClient::ModuleType),
        method: :PUT,
        path: "/api/dcim/module-types/",
        body: module_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of module type objects.
    def create(dcim_module_types_create_request : NetboxClient::DcimModuleTypesCreateRequest) : Response(NetboxClient::ModuleType)
      @conn.request(NetboxClient::ModuleType,
        method: :POST,
        path: "/api/dcim/module-types/",
        body: dcim_module_types_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a module type object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/module-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of module type objects.
    def list(*, airflow : String? = nil, console_ports : Bool? = nil, console_server_ports : Bool? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interfaces : Bool? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, manufacturer : Array(String)? = nil, manufacturer__n : Array(String)? = nil, manufacturer_id : Array(Int32)? = nil, manufacturer_id__n : Array(Int32)? = nil, model : Array(String)? = nil, model__empty : Bool? = nil, model__ic : Array(String)? = nil, model__ie : Array(String)? = nil, model__iew : Array(String)? = nil, model__iregex : Array(String)? = nil, model__isw : Array(String)? = nil, model__n : Array(String)? = nil, model__nic : Array(String)? = nil, model__nie : Array(String)? = nil, model__niew : Array(String)? = nil, model__nisw : Array(String)? = nil, model__regex : Array(String)? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, part_number : Array(String)? = nil, part_number__empty : Bool? = nil, part_number__ic : Array(String)? = nil, part_number__ie : Array(String)? = nil, part_number__iew : Array(String)? = nil, part_number__iregex : Array(String)? = nil, part_number__isw : Array(String)? = nil, part_number__n : Array(String)? = nil, part_number__nic : Array(String)? = nil, part_number__nie : Array(String)? = nil, part_number__niew : Array(String)? = nil, part_number__nisw : Array(String)? = nil, part_number__regex : Array(String)? = nil, pass_through_ports : Bool? = nil, power_outlets : Bool? = nil, power_ports : Bool? = nil, profile : Array(String)? = nil, profile__n : Array(String)? = nil, profile_id : Array(Int32)? = nil, profile_id__n : Array(Int32)? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, weight : Array(Float64)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Float64)? = nil, weight__gte : Array(Float64)? = nil, weight__lt : Array(Float64)? = nil, weight__lte : Array(Float64)? = nil, weight__n : Array(Float64)? = nil, weight_unit : String? = nil) : Response(NetboxClient::PaginatedModuleTypeList)
      @conn.request(NetboxClient::PaginatedModuleTypeList,
        method: :GET,
        path: "/api/dcim/module-types/",
        query: { "airflow" => airflow, "console_ports" => console_ports, "console_server_ports" => console_server_ports, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interfaces" => interfaces, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "manufacturer" => manufacturer, "manufacturer__n" => manufacturer__n, "manufacturer_id" => manufacturer_id, "manufacturer_id__n" => manufacturer_id__n, "model" => model, "model__empty" => model__empty, "model__ic" => model__ic, "model__ie" => model__ie, "model__iew" => model__iew, "model__iregex" => model__iregex, "model__isw" => model__isw, "model__n" => model__n, "model__nic" => model__nic, "model__nie" => model__nie, "model__niew" => model__niew, "model__nisw" => model__nisw, "model__regex" => model__regex, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "part_number" => part_number, "part_number__empty" => part_number__empty, "part_number__ic" => part_number__ic, "part_number__ie" => part_number__ie, "part_number__iew" => part_number__iew, "part_number__iregex" => part_number__iregex, "part_number__isw" => part_number__isw, "part_number__n" => part_number__n, "part_number__nic" => part_number__nic, "part_number__nie" => part_number__nie, "part_number__niew" => part_number__niew, "part_number__nisw" => part_number__nisw, "part_number__regex" => part_number__regex, "pass_through_ports" => pass_through_ports, "power_outlets" => power_outlets, "power_ports" => power_ports, "profile" => profile, "profile__n" => profile__n, "profile_id" => profile_id, "profile_id__n" => profile_id__n, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n, "weight_unit" => weight_unit },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a module type object.
    def partial_update(id : Int32, patched_writable_module_type_request : NetboxClient::PatchedWritableModuleTypeRequest? = nil) : Response(NetboxClient::ModuleType)
      @conn.request(NetboxClient::ModuleType,
        method: :PATCH,
        path: "/api/dcim/module-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_module_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a module type object.
    def retrieve(id : Int32) : Response(NetboxClient::ModuleType)
      @conn.request(NetboxClient::ModuleType,
        method: :GET,
        path: "/api/dcim/module-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a module type object.
    def update(id : Int32, writable_module_type_request : NetboxClient::WritableModuleTypeRequest) : Response(NetboxClient::ModuleType)
      @conn.request(NetboxClient::ModuleType,
        method: :PUT,
        path: "/api/dcim/module-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_module_type_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
