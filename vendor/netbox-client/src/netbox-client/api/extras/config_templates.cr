require "json"

module NetboxClient
  module Api
  class Extras::ConfigTemplates
    def initialize(@conn : Connection); end

    #  Delete a list of config template objects.
    def bulk_destroy(config_template_request : Array(NetboxClient::ConfigTemplateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/config-templates/",
        body: config_template_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of config template objects.
    def bulk_partial_update(config_template_request : Array(NetboxClient::ConfigTemplateRequest)) : Response(Array(NetboxClient::ConfigTemplate))
      @conn.request(Array(NetboxClient::ConfigTemplate),
        method: :PATCH,
        path: "/api/extras/config-templates/",
        body: config_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of config template objects.
    def bulk_update(config_template_request : Array(NetboxClient::ConfigTemplateRequest)) : Response(Array(NetboxClient::ConfigTemplate))
      @conn.request(Array(NetboxClient::ConfigTemplate),
        method: :PUT,
        path: "/api/extras/config-templates/",
        body: config_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of config template objects.
    def create(extras_config_templates_create_request : NetboxClient::ExtrasConfigTemplatesCreateRequest) : Response(NetboxClient::ConfigTemplate)
      @conn.request(NetboxClient::ConfigTemplate,
        method: :POST,
        path: "/api/extras/config-templates/",
        body: extras_config_templates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a config template object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/config-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of config template objects.
    def list(*, as_attachment : Bool? = nil, auto_sync_enabled : Bool? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, data_file_id : Array(Int32)? = nil, data_file_id__n : Array(Int32)? = nil, data_source_id : Array(Int32)? = nil, data_source_id__n : Array(Int32)? = nil, data_synced : Array(Time)? = nil, data_synced__empty : Bool? = nil, data_synced__gt : Array(Time)? = nil, data_synced__gte : Array(Time)? = nil, data_synced__lt : Array(Time)? = nil, data_synced__lte : Array(Time)? = nil, data_synced__n : Array(Time)? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, file_extension : Array(String)? = nil, file_extension__empty : Bool? = nil, file_extension__ic : Array(String)? = nil, file_extension__ie : Array(String)? = nil, file_extension__iew : Array(String)? = nil, file_extension__iregex : Array(String)? = nil, file_extension__isw : Array(String)? = nil, file_extension__n : Array(String)? = nil, file_extension__nic : Array(String)? = nil, file_extension__nie : Array(String)? = nil, file_extension__niew : Array(String)? = nil, file_extension__nisw : Array(String)? = nil, file_extension__regex : Array(String)? = nil, file_name : Array(String)? = nil, file_name__empty : Bool? = nil, file_name__ic : Array(String)? = nil, file_name__ie : Array(String)? = nil, file_name__iew : Array(String)? = nil, file_name__iregex : Array(String)? = nil, file_name__isw : Array(String)? = nil, file_name__n : Array(String)? = nil, file_name__nic : Array(String)? = nil, file_name__nie : Array(String)? = nil, file_name__niew : Array(String)? = nil, file_name__nisw : Array(String)? = nil, file_name__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mime_type : Array(String)? = nil, mime_type__empty : Bool? = nil, mime_type__ic : Array(String)? = nil, mime_type__ie : Array(String)? = nil, mime_type__iew : Array(String)? = nil, mime_type__iregex : Array(String)? = nil, mime_type__isw : Array(String)? = nil, mime_type__n : Array(String)? = nil, mime_type__nic : Array(String)? = nil, mime_type__nie : Array(String)? = nil, mime_type__niew : Array(String)? = nil, mime_type__nisw : Array(String)? = nil, mime_type__regex : Array(String)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedConfigTemplateList)
      @conn.request(NetboxClient::PaginatedConfigTemplateList,
        method: :GET,
        path: "/api/extras/config-templates/",
        query: { "as_attachment" => as_attachment, "auto_sync_enabled" => auto_sync_enabled, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "data_file_id" => data_file_id, "data_file_id__n" => data_file_id__n, "data_source_id" => data_source_id, "data_source_id__n" => data_source_id__n, "data_synced" => data_synced, "data_synced__empty" => data_synced__empty, "data_synced__gt" => data_synced__gt, "data_synced__gte" => data_synced__gte, "data_synced__lt" => data_synced__lt, "data_synced__lte" => data_synced__lte, "data_synced__n" => data_synced__n, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "file_extension" => file_extension, "file_extension__empty" => file_extension__empty, "file_extension__ic" => file_extension__ic, "file_extension__ie" => file_extension__ie, "file_extension__iew" => file_extension__iew, "file_extension__iregex" => file_extension__iregex, "file_extension__isw" => file_extension__isw, "file_extension__n" => file_extension__n, "file_extension__nic" => file_extension__nic, "file_extension__nie" => file_extension__nie, "file_extension__niew" => file_extension__niew, "file_extension__nisw" => file_extension__nisw, "file_extension__regex" => file_extension__regex, "file_name" => file_name, "file_name__empty" => file_name__empty, "file_name__ic" => file_name__ic, "file_name__ie" => file_name__ie, "file_name__iew" => file_name__iew, "file_name__iregex" => file_name__iregex, "file_name__isw" => file_name__isw, "file_name__n" => file_name__n, "file_name__nic" => file_name__nic, "file_name__nie" => file_name__nie, "file_name__niew" => file_name__niew, "file_name__nisw" => file_name__nisw, "file_name__regex" => file_name__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mime_type" => mime_type, "mime_type__empty" => mime_type__empty, "mime_type__ic" => mime_type__ic, "mime_type__ie" => mime_type__ie, "mime_type__iew" => mime_type__iew, "mime_type__iregex" => mime_type__iregex, "mime_type__isw" => mime_type__isw, "mime_type__n" => mime_type__n, "mime_type__nic" => mime_type__nic, "mime_type__nie" => mime_type__nie, "mime_type__niew" => mime_type__niew, "mime_type__nisw" => mime_type__nisw, "mime_type__regex" => mime_type__regex, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a config template object.
    def partial_update(id : Int32, patched_config_template_request : NetboxClient::PatchedConfigTemplateRequest? = nil) : Response(NetboxClient::ConfigTemplate)
      @conn.request(NetboxClient::ConfigTemplate,
        method: :PATCH,
        path: "/api/extras/config-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_config_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Render a ConfigTemplate using the context data provided (if any). If the client requests \&quot;text/plain\&quot; data, return the raw rendered content, rather than serialized JSON.
    def render_create(id : Int32, config_template_request : NetboxClient::ConfigTemplateRequest, *, format : String? = nil) : Response(NetboxClient::ConfigTemplate)
      @conn.request(NetboxClient::ConfigTemplate,
        method: :POST,
        path: "/api/extras/config-templates/{id}/render/".sub("{id}", NetboxClient.enc(id)),
        body: config_template_request,
        query: { "format" => format },
        accept: %w[application/json text/plain],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a config template object.
    def retrieve(id : Int32) : Response(NetboxClient::ConfigTemplate)
      @conn.request(NetboxClient::ConfigTemplate,
        method: :GET,
        path: "/api/extras/config-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Provide a /sync API endpoint to synchronize an object&#39;s data from its associated DataFile (if any).
    def sync_create(id : Int32, config_template_request : NetboxClient::ConfigTemplateRequest) : Response(NetboxClient::ConfigTemplate)
      @conn.request(NetboxClient::ConfigTemplate,
        method: :POST,
        path: "/api/extras/config-templates/{id}/sync/".sub("{id}", NetboxClient.enc(id)),
        body: config_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a config template object.
    def update(id : Int32, config_template_request : NetboxClient::ConfigTemplateRequest) : Response(NetboxClient::ConfigTemplate)
      @conn.request(NetboxClient::ConfigTemplate,
        method: :PUT,
        path: "/api/extras/config-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: config_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
