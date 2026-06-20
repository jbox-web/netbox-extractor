require "json"

module NetboxClient
  module Api
  class Dcim::InterfaceTemplates
    def initialize(@conn : Connection); end

    #  Delete a list of interface template objects.
    def bulk_destroy(interface_template_request : Array(NetboxClient::InterfaceTemplateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/interface-templates/",
        body: interface_template_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of interface template objects.
    def bulk_partial_update(interface_template_request : Array(NetboxClient::InterfaceTemplateRequest)) : Response(Array(NetboxClient::InterfaceTemplate))
      @conn.request(Array(NetboxClient::InterfaceTemplate),
        method: :PATCH,
        path: "/api/dcim/interface-templates/",
        body: interface_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of interface template objects.
    def bulk_update(interface_template_request : Array(NetboxClient::InterfaceTemplateRequest)) : Response(Array(NetboxClient::InterfaceTemplate))
      @conn.request(Array(NetboxClient::InterfaceTemplate),
        method: :PUT,
        path: "/api/dcim/interface-templates/",
        body: interface_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of interface template objects.
    def create(dcim_interface_templates_create_request : NetboxClient::DcimInterfaceTemplatesCreateRequest) : Response(NetboxClient::InterfaceTemplate)
      @conn.request(NetboxClient::InterfaceTemplate,
        method: :POST,
        path: "/api/dcim/interface-templates/",
        body: dcim_interface_templates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a interface template object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/interface-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of interface template objects.
    def list(*, bridge_id : Array(Int32)? = nil, bridge_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, enabled : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mgmt_only : Bool? = nil, modified_by_request : String? = nil, module_type_id : Array(Int32)? = nil, module_type_id__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, poe_mode : Array(String)? = nil, poe_mode__empty : Bool? = nil, poe_mode__ic : Array(String)? = nil, poe_mode__ie : Array(String)? = nil, poe_mode__iew : Array(String)? = nil, poe_mode__iregex : Array(String)? = nil, poe_mode__isw : Array(String)? = nil, poe_mode__n : Array(String)? = nil, poe_mode__nic : Array(String)? = nil, poe_mode__nie : Array(String)? = nil, poe_mode__niew : Array(String)? = nil, poe_mode__nisw : Array(String)? = nil, poe_mode__regex : Array(String)? = nil, poe_type : Array(String)? = nil, poe_type__empty : Bool? = nil, poe_type__ic : Array(String)? = nil, poe_type__ie : Array(String)? = nil, poe_type__iew : Array(String)? = nil, poe_type__iregex : Array(String)? = nil, poe_type__isw : Array(String)? = nil, poe_type__n : Array(String)? = nil, poe_type__nic : Array(String)? = nil, poe_type__nie : Array(String)? = nil, poe_type__niew : Array(String)? = nil, poe_type__nisw : Array(String)? = nil, poe_type__regex : Array(String)? = nil, q : String? = nil, rf_role : Array(String)? = nil, rf_role__empty : Bool? = nil, rf_role__ic : Array(String)? = nil, rf_role__ie : Array(String)? = nil, rf_role__iew : Array(String)? = nil, rf_role__iregex : Array(String)? = nil, rf_role__isw : Array(String)? = nil, rf_role__n : Array(String)? = nil, rf_role__nic : Array(String)? = nil, rf_role__nie : Array(String)? = nil, rf_role__niew : Array(String)? = nil, rf_role__nisw : Array(String)? = nil, rf_role__regex : Array(String)? = nil, _type : Array(String)? = nil, type__empty : Bool? = nil, type__ic : Array(String)? = nil, type__ie : Array(String)? = nil, type__iew : Array(String)? = nil, type__iregex : Array(String)? = nil, type__isw : Array(String)? = nil, type__n : Array(String)? = nil, type__nic : Array(String)? = nil, type__nie : Array(String)? = nil, type__niew : Array(String)? = nil, type__nisw : Array(String)? = nil, type__regex : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedInterfaceTemplateList)
      @conn.request(NetboxClient::PaginatedInterfaceTemplateList,
        method: :GET,
        path: "/api/dcim/interface-templates/",
        query: { "bridge_id" => bridge_id, "bridge_id__n" => bridge_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "enabled" => enabled, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mgmt_only" => mgmt_only, "modified_by_request" => modified_by_request, "module_type_id" => module_type_id, "module_type_id__n" => module_type_id__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "poe_mode" => poe_mode, "poe_mode__empty" => poe_mode__empty, "poe_mode__ic" => poe_mode__ic, "poe_mode__ie" => poe_mode__ie, "poe_mode__iew" => poe_mode__iew, "poe_mode__iregex" => poe_mode__iregex, "poe_mode__isw" => poe_mode__isw, "poe_mode__n" => poe_mode__n, "poe_mode__nic" => poe_mode__nic, "poe_mode__nie" => poe_mode__nie, "poe_mode__niew" => poe_mode__niew, "poe_mode__nisw" => poe_mode__nisw, "poe_mode__regex" => poe_mode__regex, "poe_type" => poe_type, "poe_type__empty" => poe_type__empty, "poe_type__ic" => poe_type__ic, "poe_type__ie" => poe_type__ie, "poe_type__iew" => poe_type__iew, "poe_type__iregex" => poe_type__iregex, "poe_type__isw" => poe_type__isw, "poe_type__n" => poe_type__n, "poe_type__nic" => poe_type__nic, "poe_type__nie" => poe_type__nie, "poe_type__niew" => poe_type__niew, "poe_type__nisw" => poe_type__nisw, "poe_type__regex" => poe_type__regex, "q" => q, "rf_role" => rf_role, "rf_role__empty" => rf_role__empty, "rf_role__ic" => rf_role__ic, "rf_role__ie" => rf_role__ie, "rf_role__iew" => rf_role__iew, "rf_role__iregex" => rf_role__iregex, "rf_role__isw" => rf_role__isw, "rf_role__n" => rf_role__n, "rf_role__nic" => rf_role__nic, "rf_role__nie" => rf_role__nie, "rf_role__niew" => rf_role__niew, "rf_role__nisw" => rf_role__nisw, "rf_role__regex" => rf_role__regex, "type" => _type, "type__empty" => type__empty, "type__ic" => type__ic, "type__ie" => type__ie, "type__iew" => type__iew, "type__iregex" => type__iregex, "type__isw" => type__isw, "type__n" => type__n, "type__nic" => type__nic, "type__nie" => type__nie, "type__niew" => type__niew, "type__nisw" => type__nisw, "type__regex" => type__regex, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a interface template object.
    def partial_update(id : Int32, patched_writable_interface_template_request : NetboxClient::PatchedWritableInterfaceTemplateRequest? = nil) : Response(NetboxClient::InterfaceTemplate)
      @conn.request(NetboxClient::InterfaceTemplate,
        method: :PATCH,
        path: "/api/dcim/interface-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_interface_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a interface template object.
    def retrieve(id : Int32) : Response(NetboxClient::InterfaceTemplate)
      @conn.request(NetboxClient::InterfaceTemplate,
        method: :GET,
        path: "/api/dcim/interface-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a interface template object.
    def update(id : Int32, writable_interface_template_request : NetboxClient::WritableInterfaceTemplateRequest) : Response(NetboxClient::InterfaceTemplate)
      @conn.request(NetboxClient::InterfaceTemplate,
        method: :PUT,
        path: "/api/dcim/interface-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_interface_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
