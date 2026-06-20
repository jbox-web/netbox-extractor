require "json"

module NetboxClient
  module Api
  class Dcim::ConsoleServerPortTemplates
    def initialize(@conn : Connection); end

    #  Delete a list of console server port template objects.
    def bulk_destroy(console_server_port_template_request : Array(NetboxClient::ConsoleServerPortTemplateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/console-server-port-templates/",
        body: console_server_port_template_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of console server port template objects.
    def bulk_partial_update(console_server_port_template_request : Array(NetboxClient::ConsoleServerPortTemplateRequest)) : Response(Array(NetboxClient::ConsoleServerPortTemplate))
      @conn.request(Array(NetboxClient::ConsoleServerPortTemplate),
        method: :PATCH,
        path: "/api/dcim/console-server-port-templates/",
        body: console_server_port_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of console server port template objects.
    def bulk_update(console_server_port_template_request : Array(NetboxClient::ConsoleServerPortTemplateRequest)) : Response(Array(NetboxClient::ConsoleServerPortTemplate))
      @conn.request(Array(NetboxClient::ConsoleServerPortTemplate),
        method: :PUT,
        path: "/api/dcim/console-server-port-templates/",
        body: console_server_port_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of console server port template objects.
    def create(dcim_console_server_port_templates_create_request : NetboxClient::DcimConsoleServerPortTemplatesCreateRequest) : Response(NetboxClient::ConsoleServerPortTemplate)
      @conn.request(NetboxClient::ConsoleServerPortTemplate,
        method: :POST,
        path: "/api/dcim/console-server-port-templates/",
        body: dcim_console_server_port_templates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a console server port template object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/console-server-port-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of console server port template objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, module_type_id : Array(Int32)? = nil, module_type_id__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, _type : String? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedConsoleServerPortTemplateList)
      @conn.request(NetboxClient::PaginatedConsoleServerPortTemplateList,
        method: :GET,
        path: "/api/dcim/console-server-port-templates/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "module_type_id" => module_type_id, "module_type_id__n" => module_type_id__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "type" => _type, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a console server port template object.
    def partial_update(id : Int32, patched_writable_console_server_port_template_request : NetboxClient::PatchedWritableConsoleServerPortTemplateRequest? = nil) : Response(NetboxClient::ConsoleServerPortTemplate)
      @conn.request(NetboxClient::ConsoleServerPortTemplate,
        method: :PATCH,
        path: "/api/dcim/console-server-port-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_console_server_port_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a console server port template object.
    def retrieve(id : Int32) : Response(NetboxClient::ConsoleServerPortTemplate)
      @conn.request(NetboxClient::ConsoleServerPortTemplate,
        method: :GET,
        path: "/api/dcim/console-server-port-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a console server port template object.
    def update(id : Int32, writable_console_server_port_template_request : NetboxClient::WritableConsoleServerPortTemplateRequest) : Response(NetboxClient::ConsoleServerPortTemplate)
      @conn.request(NetboxClient::ConsoleServerPortTemplate,
        method: :PUT,
        path: "/api/dcim/console-server-port-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_console_server_port_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
