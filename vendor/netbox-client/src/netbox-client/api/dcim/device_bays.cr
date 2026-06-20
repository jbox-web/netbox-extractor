require "json"

module NetboxClient
  module Api
  class Dcim::DeviceBays
    def initialize(@conn : Connection); end

    #  Delete a list of device bay objects.
    def bulk_destroy(device_bay_request : Array(NetboxClient::DeviceBayRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/device-bays/",
        body: device_bay_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of device bay objects.
    def bulk_partial_update(device_bay_request : Array(NetboxClient::DeviceBayRequest)) : Response(Array(NetboxClient::DeviceBay))
      @conn.request(Array(NetboxClient::DeviceBay),
        method: :PATCH,
        path: "/api/dcim/device-bays/",
        body: device_bay_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of device bay objects.
    def bulk_update(device_bay_request : Array(NetboxClient::DeviceBayRequest)) : Response(Array(NetboxClient::DeviceBay))
      @conn.request(Array(NetboxClient::DeviceBay),
        method: :PUT,
        path: "/api/dcim/device-bays/",
        body: device_bay_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of device bay objects.
    def create(dcim_device_bays_create_request : NetboxClient::DcimDeviceBaysCreateRequest) : Response(NetboxClient::DeviceBay)
      @conn.request(NetboxClient::DeviceBay,
        method: :POST,
        path: "/api/dcim/device-bays/",
        body: dcim_device_bays_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a device bay object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/device-bays/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of device bay objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device__n : Array(String)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, device_role : Array(String)? = nil, device_role__n : Array(String)? = nil, device_role_id : Array(Int32)? = nil, device_role_id__n : Array(Int32)? = nil, device_status : Array(String)? = nil, device_status__empty : Bool? = nil, device_status__ic : Array(String)? = nil, device_status__ie : Array(String)? = nil, device_status__iew : Array(String)? = nil, device_status__iregex : Array(String)? = nil, device_status__isw : Array(String)? = nil, device_status__n : Array(String)? = nil, device_status__nic : Array(String)? = nil, device_status__nie : Array(String)? = nil, device_status__niew : Array(String)? = nil, device_status__nisw : Array(String)? = nil, device_status__regex : Array(String)? = nil, device_type : Array(String)? = nil, device_type__n : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, installed_device : Array(String)? = nil, installed_device__n : Array(String)? = nil, installed_device_id : Array(Int32)? = nil, installed_device_id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(Int32)? = nil, location_id__n : Array(Int32)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, rack : Array(String)? = nil, rack__n : Array(String)? = nil, rack_id : Array(Int32)? = nil, rack_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, virtual_chassis : Array(String)? = nil, virtual_chassis__n : Array(String)? = nil, virtual_chassis_id : Array(Int32)? = nil, virtual_chassis_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedDeviceBayList)
      @conn.request(NetboxClient::PaginatedDeviceBayList,
        method: :GET,
        path: "/api/dcim/device-bays/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "device_role" => device_role, "device_role__n" => device_role__n, "device_role_id" => device_role_id, "device_role_id__n" => device_role_id__n, "device_status" => device_status, "device_status__empty" => device_status__empty, "device_status__ic" => device_status__ic, "device_status__ie" => device_status__ie, "device_status__iew" => device_status__iew, "device_status__iregex" => device_status__iregex, "device_status__isw" => device_status__isw, "device_status__n" => device_status__n, "device_status__nic" => device_status__nic, "device_status__nie" => device_status__nie, "device_status__niew" => device_status__niew, "device_status__nisw" => device_status__nisw, "device_status__regex" => device_status__regex, "device_type" => device_type, "device_type__n" => device_type__n, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "installed_device" => installed_device, "installed_device__n" => installed_device__n, "installed_device_id" => installed_device_id, "installed_device_id__n" => installed_device_id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "rack" => rack, "rack__n" => rack__n, "rack_id" => rack_id, "rack_id__n" => rack_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "virtual_chassis" => virtual_chassis, "virtual_chassis__n" => virtual_chassis__n, "virtual_chassis_id" => virtual_chassis_id, "virtual_chassis_id__n" => virtual_chassis_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a device bay object.
    def partial_update(id : Int32, patched_device_bay_request : NetboxClient::PatchedDeviceBayRequest? = nil) : Response(NetboxClient::DeviceBay)
      @conn.request(NetboxClient::DeviceBay,
        method: :PATCH,
        path: "/api/dcim/device-bays/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_device_bay_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a device bay object.
    def retrieve(id : Int32) : Response(NetboxClient::DeviceBay)
      @conn.request(NetboxClient::DeviceBay,
        method: :GET,
        path: "/api/dcim/device-bays/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a device bay object.
    def update(id : Int32, device_bay_request : NetboxClient::DeviceBayRequest) : Response(NetboxClient::DeviceBay)
      @conn.request(NetboxClient::DeviceBay,
        method: :PUT,
        path: "/api/dcim/device-bays/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: device_bay_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
