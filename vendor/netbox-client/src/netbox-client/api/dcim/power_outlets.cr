require "json"

module NetboxClient
  module Api
  class Dcim::PowerOutlets
    def initialize(@conn : Connection); end

    #  Delete a list of power outlet objects.
    def bulk_destroy(power_outlet_request : Array(NetboxClient::PowerOutletRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/power-outlets/",
        body: power_outlet_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of power outlet objects.
    def bulk_partial_update(power_outlet_request : Array(NetboxClient::PowerOutletRequest)) : Response(Array(NetboxClient::PowerOutlet))
      @conn.request(Array(NetboxClient::PowerOutlet),
        method: :PATCH,
        path: "/api/dcim/power-outlets/",
        body: power_outlet_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of power outlet objects.
    def bulk_update(power_outlet_request : Array(NetboxClient::PowerOutletRequest)) : Response(Array(NetboxClient::PowerOutlet))
      @conn.request(Array(NetboxClient::PowerOutlet),
        method: :PUT,
        path: "/api/dcim/power-outlets/",
        body: power_outlet_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of power outlet objects.
    def create(dcim_power_outlets_create_request : NetboxClient::DcimPowerOutletsCreateRequest) : Response(NetboxClient::PowerOutlet)
      @conn.request(NetboxClient::PowerOutlet,
        method: :POST,
        path: "/api/dcim/power-outlets/",
        body: dcim_power_outlets_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a power outlet object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/power-outlets/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of power outlet objects.
    def list(*, cable_end : String? = nil, cable_id : Array(Int32)? = nil, cable_id__n : Array(Int32)? = nil, cabled : Bool? = nil, color : Array(String)? = nil, color__empty : Bool? = nil, color__ic : Array(String)? = nil, color__ie : Array(String)? = nil, color__iew : Array(String)? = nil, color__iregex : Array(String)? = nil, color__isw : Array(String)? = nil, color__n : Array(String)? = nil, color__nic : Array(String)? = nil, color__nie : Array(String)? = nil, color__niew : Array(String)? = nil, color__nisw : Array(String)? = nil, color__regex : Array(String)? = nil, connected : Bool? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device__n : Array(String)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, device_role : Array(String)? = nil, device_role__n : Array(String)? = nil, device_role_id : Array(Int32)? = nil, device_role_id__n : Array(Int32)? = nil, device_status : Array(String)? = nil, device_status__empty : Bool? = nil, device_status__ic : Array(String)? = nil, device_status__ie : Array(String)? = nil, device_status__iew : Array(String)? = nil, device_status__iregex : Array(String)? = nil, device_status__isw : Array(String)? = nil, device_status__n : Array(String)? = nil, device_status__nic : Array(String)? = nil, device_status__nie : Array(String)? = nil, device_status__niew : Array(String)? = nil, device_status__nisw : Array(String)? = nil, device_status__regex : Array(String)? = nil, device_type : Array(String)? = nil, device_type__n : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, feed_leg : Array(String)? = nil, feed_leg__empty : Bool? = nil, feed_leg__ic : Array(String)? = nil, feed_leg__ie : Array(String)? = nil, feed_leg__iew : Array(String)? = nil, feed_leg__iregex : Array(String)? = nil, feed_leg__isw : Array(String)? = nil, feed_leg__n : Array(String)? = nil, feed_leg__nic : Array(String)? = nil, feed_leg__nie : Array(String)? = nil, feed_leg__niew : Array(String)? = nil, feed_leg__nisw : Array(String)? = nil, feed_leg__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(Int32)? = nil, location_id__n : Array(Int32)? = nil, mark_connected : Bool? = nil, modified_by_request : String? = nil, module_id : Array(Int32)? = nil, module_id__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, occupied : Bool? = nil, offset : Int32? = nil, ordering : String? = nil, power_port_id : Array(Int32)? = nil, power_port_id__n : Array(Int32)? = nil, q : String? = nil, rack : Array(String)? = nil, rack__n : Array(String)? = nil, rack_id : Array(Int32)? = nil, rack_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, _type : Array(String)? = nil, type__empty : Bool? = nil, type__ic : Array(String)? = nil, type__ie : Array(String)? = nil, type__iew : Array(String)? = nil, type__iregex : Array(String)? = nil, type__isw : Array(String)? = nil, type__n : Array(String)? = nil, type__nic : Array(String)? = nil, type__nie : Array(String)? = nil, type__niew : Array(String)? = nil, type__nisw : Array(String)? = nil, type__regex : Array(String)? = nil, updated_by_request : String? = nil, virtual_chassis : Array(String)? = nil, virtual_chassis__n : Array(String)? = nil, virtual_chassis_id : Array(Int32)? = nil, virtual_chassis_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedPowerOutletList)
      @conn.request(NetboxClient::PaginatedPowerOutletList,
        method: :GET,
        path: "/api/dcim/power-outlets/",
        query: { "cable_end" => cable_end, "cable_id" => cable_id, "cable_id__n" => cable_id__n, "cabled" => cabled, "color" => color, "color__empty" => color__empty, "color__ic" => color__ic, "color__ie" => color__ie, "color__iew" => color__iew, "color__iregex" => color__iregex, "color__isw" => color__isw, "color__n" => color__n, "color__nic" => color__nic, "color__nie" => color__nie, "color__niew" => color__niew, "color__nisw" => color__nisw, "color__regex" => color__regex, "connected" => connected, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "device_role" => device_role, "device_role__n" => device_role__n, "device_role_id" => device_role_id, "device_role_id__n" => device_role_id__n, "device_status" => device_status, "device_status__empty" => device_status__empty, "device_status__ic" => device_status__ic, "device_status__ie" => device_status__ie, "device_status__iew" => device_status__iew, "device_status__iregex" => device_status__iregex, "device_status__isw" => device_status__isw, "device_status__n" => device_status__n, "device_status__nic" => device_status__nic, "device_status__nie" => device_status__nie, "device_status__niew" => device_status__niew, "device_status__nisw" => device_status__nisw, "device_status__regex" => device_status__regex, "device_type" => device_type, "device_type__n" => device_type__n, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "feed_leg" => feed_leg, "feed_leg__empty" => feed_leg__empty, "feed_leg__ic" => feed_leg__ic, "feed_leg__ie" => feed_leg__ie, "feed_leg__iew" => feed_leg__iew, "feed_leg__iregex" => feed_leg__iregex, "feed_leg__isw" => feed_leg__isw, "feed_leg__n" => feed_leg__n, "feed_leg__nic" => feed_leg__nic, "feed_leg__nie" => feed_leg__nie, "feed_leg__niew" => feed_leg__niew, "feed_leg__nisw" => feed_leg__nisw, "feed_leg__regex" => feed_leg__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "mark_connected" => mark_connected, "modified_by_request" => modified_by_request, "module_id" => module_id, "module_id__n" => module_id__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "occupied" => occupied, "offset" => offset, "ordering" => ordering, "power_port_id" => power_port_id, "power_port_id__n" => power_port_id__n, "q" => q, "rack" => rack, "rack__n" => rack__n, "rack_id" => rack_id, "rack_id__n" => rack_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "type" => _type, "type__empty" => type__empty, "type__ic" => type__ic, "type__ie" => type__ie, "type__iew" => type__iew, "type__iregex" => type__iregex, "type__isw" => type__isw, "type__n" => type__n, "type__nic" => type__nic, "type__nie" => type__nie, "type__niew" => type__niew, "type__nisw" => type__nisw, "type__regex" => type__regex, "updated_by_request" => updated_by_request, "virtual_chassis" => virtual_chassis, "virtual_chassis__n" => virtual_chassis__n, "virtual_chassis_id" => virtual_chassis_id, "virtual_chassis_id__n" => virtual_chassis_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a power outlet object.
    def partial_update(id : Int32, patched_writable_power_outlet_request : NetboxClient::PatchedWritablePowerOutletRequest? = nil) : Response(NetboxClient::PowerOutlet)
      @conn.request(NetboxClient::PowerOutlet,
        method: :PATCH,
        path: "/api/dcim/power-outlets/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_power_outlet_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a power outlet object.
    def retrieve(id : Int32) : Response(NetboxClient::PowerOutlet)
      @conn.request(NetboxClient::PowerOutlet,
        method: :GET,
        path: "/api/dcim/power-outlets/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Trace a complete cable path and return each segment as a three-tuple of (termination, cable, termination).
    def trace_retrieve(id : Int32) : Response(NetboxClient::PowerOutlet)
      @conn.request(NetboxClient::PowerOutlet,
        method: :GET,
        path: "/api/dcim/power-outlets/{id}/trace/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a power outlet object.
    def update(id : Int32, writable_power_outlet_request : NetboxClient::WritablePowerOutletRequest) : Response(NetboxClient::PowerOutlet)
      @conn.request(NetboxClient::PowerOutlet,
        method: :PUT,
        path: "/api/dcim/power-outlets/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_power_outlet_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
