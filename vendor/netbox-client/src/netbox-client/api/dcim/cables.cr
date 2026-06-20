require "json"

module NetboxClient
  module Api
  class Dcim::Cables
    def initialize(@conn : Connection); end

    #  Delete a list of cable objects.
    def bulk_destroy(cable_request : Array(NetboxClient::CableRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/cables/",
        body: cable_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of cable objects.
    def bulk_partial_update(cable_request : Array(NetboxClient::CableRequest)) : Response(Array(NetboxClient::Cable))
      @conn.request(Array(NetboxClient::Cable),
        method: :PATCH,
        path: "/api/dcim/cables/",
        body: cable_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of cable objects.
    def bulk_update(cable_request : Array(NetboxClient::CableRequest)) : Response(Array(NetboxClient::Cable))
      @conn.request(Array(NetboxClient::Cable),
        method: :PUT,
        path: "/api/dcim/cables/",
        body: cable_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of cable objects.
    def create(dcim_cables_create_request : NetboxClient::DcimCablesCreateRequest? = nil) : Response(NetboxClient::Cable)
      @conn.request(NetboxClient::Cable,
        method: :POST,
        path: "/api/dcim/cables/",
        body: dcim_cables_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a cable object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/cables/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of cable objects.
    def list(*, circuittermination_id : Array(Int32)? = nil, color : Array(String)? = nil, color__empty : Bool? = nil, color__ic : Array(String)? = nil, color__ie : Array(String)? = nil, color__iew : Array(String)? = nil, color__iregex : Array(String)? = nil, color__isw : Array(String)? = nil, color__n : Array(String)? = nil, color__nic : Array(String)? = nil, color__nie : Array(String)? = nil, color__niew : Array(String)? = nil, color__nisw : Array(String)? = nil, color__regex : Array(String)? = nil, consoleport_id : Array(Int32)? = nil, consoleserverport_id : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device_id : Array(Int32)? = nil, frontport_id : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_id : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, length : Array(Float64)? = nil, length__empty : Bool? = nil, length__gt : Array(Float64)? = nil, length__gte : Array(Float64)? = nil, length__lt : Array(Float64)? = nil, length__lte : Array(Float64)? = nil, length__n : Array(Float64)? = nil, length_unit : String? = nil, limit : Int32? = nil, location : Array(String)? = nil, location_id : Array(Int32)? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, powerfeed_id : Array(Int32)? = nil, poweroutlet_id : Array(Int32)? = nil, powerport_id : Array(Int32)? = nil, q : String? = nil, rack : Array(String)? = nil, rack_id : Array(Int32)? = nil, rearport_id : Array(Int32)? = nil, site : Array(String)? = nil, site_id : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, termination_a_id : Array(Int32)? = nil, termination_a_type : String? = nil, termination_a_type__n : String? = nil, termination_b_id : Array(Int32)? = nil, termination_b_type : String? = nil, termination_b_type__n : String? = nil, _type : Array(String)? = nil, type__empty : Bool? = nil, type__ic : Array(String)? = nil, type__ie : Array(String)? = nil, type__iew : Array(String)? = nil, type__iregex : Array(String)? = nil, type__isw : Array(String)? = nil, type__n : Array(String)? = nil, type__nic : Array(String)? = nil, type__nie : Array(String)? = nil, type__niew : Array(String)? = nil, type__nisw : Array(String)? = nil, type__regex : Array(String)? = nil, unterminated : Bool? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedCableList)
      @conn.request(NetboxClient::PaginatedCableList,
        method: :GET,
        path: "/api/dcim/cables/",
        query: { "circuittermination_id" => circuittermination_id, "color" => color, "color__empty" => color__empty, "color__ic" => color__ic, "color__ie" => color__ie, "color__iew" => color__iew, "color__iregex" => color__iregex, "color__isw" => color__isw, "color__n" => color__n, "color__nic" => color__nic, "color__nie" => color__nie, "color__niew" => color__niew, "color__nisw" => color__nisw, "color__regex" => color__regex, "consoleport_id" => consoleport_id, "consoleserverport_id" => consoleserverport_id, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device_id" => device_id, "frontport_id" => frontport_id, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_id" => interface_id, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "length" => length, "length__empty" => length__empty, "length__gt" => length__gt, "length__gte" => length__gte, "length__lt" => length__lt, "length__lte" => length__lte, "length__n" => length__n, "length_unit" => length_unit, "limit" => limit, "location" => location, "location_id" => location_id, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "powerfeed_id" => powerfeed_id, "poweroutlet_id" => poweroutlet_id, "powerport_id" => powerport_id, "q" => q, "rack" => rack, "rack_id" => rack_id, "rearport_id" => rearport_id, "site" => site, "site_id" => site_id, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "termination_a_id" => termination_a_id, "termination_a_type" => termination_a_type, "termination_a_type__n" => termination_a_type__n, "termination_b_id" => termination_b_id, "termination_b_type" => termination_b_type, "termination_b_type__n" => termination_b_type__n, "type" => _type, "type__empty" => type__empty, "type__ic" => type__ic, "type__ie" => type__ie, "type__iew" => type__iew, "type__iregex" => type__iregex, "type__isw" => type__isw, "type__n" => type__n, "type__nic" => type__nic, "type__nie" => type__nie, "type__niew" => type__niew, "type__nisw" => type__nisw, "type__regex" => type__regex, "unterminated" => unterminated, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a cable object.
    def partial_update(id : Int32, patched_writable_cable_request : NetboxClient::PatchedWritableCableRequest? = nil) : Response(NetboxClient::Cable)
      @conn.request(NetboxClient::Cable,
        method: :PATCH,
        path: "/api/dcim/cables/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_cable_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a cable object.
    def retrieve(id : Int32) : Response(NetboxClient::Cable)
      @conn.request(NetboxClient::Cable,
        method: :GET,
        path: "/api/dcim/cables/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a cable object.
    def update(id : Int32, writable_cable_request : NetboxClient::WritableCableRequest? = nil) : Response(NetboxClient::Cable)
      @conn.request(NetboxClient::Cable,
        method: :PUT,
        path: "/api/dcim/cables/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_cable_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
