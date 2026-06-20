require "json"

module NetboxClient
  module Api
  class Dcim::PowerOutletTemplates
    def initialize(@conn : Connection); end

    #  Delete a list of power outlet template objects.
    def bulk_destroy(power_outlet_template_request : Array(NetboxClient::PowerOutletTemplateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/power-outlet-templates/",
        body: power_outlet_template_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of power outlet template objects.
    def bulk_partial_update(power_outlet_template_request : Array(NetboxClient::PowerOutletTemplateRequest)) : Response(Array(NetboxClient::PowerOutletTemplate))
      @conn.request(Array(NetboxClient::PowerOutletTemplate),
        method: :PATCH,
        path: "/api/dcim/power-outlet-templates/",
        body: power_outlet_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of power outlet template objects.
    def bulk_update(power_outlet_template_request : Array(NetboxClient::PowerOutletTemplateRequest)) : Response(Array(NetboxClient::PowerOutletTemplate))
      @conn.request(Array(NetboxClient::PowerOutletTemplate),
        method: :PUT,
        path: "/api/dcim/power-outlet-templates/",
        body: power_outlet_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of power outlet template objects.
    def create(dcim_power_outlet_templates_create_request : NetboxClient::DcimPowerOutletTemplatesCreateRequest) : Response(NetboxClient::PowerOutletTemplate)
      @conn.request(NetboxClient::PowerOutletTemplate,
        method: :POST,
        path: "/api/dcim/power-outlet-templates/",
        body: dcim_power_outlet_templates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a power outlet template object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/power-outlet-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of power outlet template objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, feed_leg : Array(String)? = nil, feed_leg__empty : Bool? = nil, feed_leg__ic : Array(String)? = nil, feed_leg__ie : Array(String)? = nil, feed_leg__iew : Array(String)? = nil, feed_leg__iregex : Array(String)? = nil, feed_leg__isw : Array(String)? = nil, feed_leg__n : Array(String)? = nil, feed_leg__nic : Array(String)? = nil, feed_leg__nie : Array(String)? = nil, feed_leg__niew : Array(String)? = nil, feed_leg__nisw : Array(String)? = nil, feed_leg__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, module_type_id : Array(Int32)? = nil, module_type_id__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, power_port_id : Array(Int32)? = nil, power_port_id__n : Array(Int32)? = nil, q : String? = nil, _type : String? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedPowerOutletTemplateList)
      @conn.request(NetboxClient::PaginatedPowerOutletTemplateList,
        method: :GET,
        path: "/api/dcim/power-outlet-templates/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "feed_leg" => feed_leg, "feed_leg__empty" => feed_leg__empty, "feed_leg__ic" => feed_leg__ic, "feed_leg__ie" => feed_leg__ie, "feed_leg__iew" => feed_leg__iew, "feed_leg__iregex" => feed_leg__iregex, "feed_leg__isw" => feed_leg__isw, "feed_leg__n" => feed_leg__n, "feed_leg__nic" => feed_leg__nic, "feed_leg__nie" => feed_leg__nie, "feed_leg__niew" => feed_leg__niew, "feed_leg__nisw" => feed_leg__nisw, "feed_leg__regex" => feed_leg__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "module_type_id" => module_type_id, "module_type_id__n" => module_type_id__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "power_port_id" => power_port_id, "power_port_id__n" => power_port_id__n, "q" => q, "type" => _type, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a power outlet template object.
    def partial_update(id : Int32, patched_writable_power_outlet_template_request : NetboxClient::PatchedWritablePowerOutletTemplateRequest? = nil) : Response(NetboxClient::PowerOutletTemplate)
      @conn.request(NetboxClient::PowerOutletTemplate,
        method: :PATCH,
        path: "/api/dcim/power-outlet-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_power_outlet_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a power outlet template object.
    def retrieve(id : Int32) : Response(NetboxClient::PowerOutletTemplate)
      @conn.request(NetboxClient::PowerOutletTemplate,
        method: :GET,
        path: "/api/dcim/power-outlet-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a power outlet template object.
    def update(id : Int32, writable_power_outlet_template_request : NetboxClient::WritablePowerOutletTemplateRequest) : Response(NetboxClient::PowerOutletTemplate)
      @conn.request(NetboxClient::PowerOutletTemplate,
        method: :PUT,
        path: "/api/dcim/power-outlet-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_power_outlet_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
