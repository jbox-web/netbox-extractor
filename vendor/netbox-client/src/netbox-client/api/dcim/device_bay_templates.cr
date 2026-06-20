require "json"

module NetboxClient
  module Api
  class Dcim::DeviceBayTemplates
    def initialize(@conn : Connection); end

    #  Delete a list of device bay template objects.
    def bulk_destroy(device_bay_template_request : Array(NetboxClient::DeviceBayTemplateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/device-bay-templates/",
        body: device_bay_template_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of device bay template objects.
    def bulk_partial_update(device_bay_template_request : Array(NetboxClient::DeviceBayTemplateRequest)) : Response(Array(NetboxClient::DeviceBayTemplate))
      @conn.request(Array(NetboxClient::DeviceBayTemplate),
        method: :PATCH,
        path: "/api/dcim/device-bay-templates/",
        body: device_bay_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of device bay template objects.
    def bulk_update(device_bay_template_request : Array(NetboxClient::DeviceBayTemplateRequest)) : Response(Array(NetboxClient::DeviceBayTemplate))
      @conn.request(Array(NetboxClient::DeviceBayTemplate),
        method: :PUT,
        path: "/api/dcim/device-bay-templates/",
        body: device_bay_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of device bay template objects.
    def create(dcim_device_bay_templates_create_request : NetboxClient::DcimDeviceBayTemplatesCreateRequest) : Response(NetboxClient::DeviceBayTemplate)
      @conn.request(NetboxClient::DeviceBayTemplate,
        method: :POST,
        path: "/api/dcim/device-bay-templates/",
        body: dcim_device_bay_templates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a device bay template object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/device-bay-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of device bay template objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedDeviceBayTemplateList)
      @conn.request(NetboxClient::PaginatedDeviceBayTemplateList,
        method: :GET,
        path: "/api/dcim/device-bay-templates/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a device bay template object.
    def partial_update(id : Int32, patched_device_bay_template_request : NetboxClient::PatchedDeviceBayTemplateRequest? = nil) : Response(NetboxClient::DeviceBayTemplate)
      @conn.request(NetboxClient::DeviceBayTemplate,
        method: :PATCH,
        path: "/api/dcim/device-bay-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_device_bay_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a device bay template object.
    def retrieve(id : Int32) : Response(NetboxClient::DeviceBayTemplate)
      @conn.request(NetboxClient::DeviceBayTemplate,
        method: :GET,
        path: "/api/dcim/device-bay-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a device bay template object.
    def update(id : Int32, device_bay_template_request : NetboxClient::DeviceBayTemplateRequest) : Response(NetboxClient::DeviceBayTemplate)
      @conn.request(NetboxClient::DeviceBayTemplate,
        method: :PUT,
        path: "/api/dcim/device-bay-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: device_bay_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
