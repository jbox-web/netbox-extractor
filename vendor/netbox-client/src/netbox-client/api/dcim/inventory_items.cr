require "json"

module NetboxClient
  module Api
  class Dcim::InventoryItems
    def initialize(@conn : Connection); end

    #  Delete a list of inventory item objects.
    def bulk_destroy(inventory_item_request : Array(NetboxClient::InventoryItemRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/inventory-items/",
        body: inventory_item_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of inventory item objects.
    def bulk_partial_update(inventory_item_request : Array(NetboxClient::InventoryItemRequest)) : Response(Array(NetboxClient::InventoryItem))
      @conn.request(Array(NetboxClient::InventoryItem),
        method: :PATCH,
        path: "/api/dcim/inventory-items/",
        body: inventory_item_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of inventory item objects.
    def bulk_update(inventory_item_request : Array(NetboxClient::InventoryItemRequest)) : Response(Array(NetboxClient::InventoryItem))
      @conn.request(Array(NetboxClient::InventoryItem),
        method: :PUT,
        path: "/api/dcim/inventory-items/",
        body: inventory_item_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of inventory item objects.
    def create(dcim_inventory_items_create_request : NetboxClient::DcimInventoryItemsCreateRequest) : Response(NetboxClient::InventoryItem)
      @conn.request(NetboxClient::InventoryItem,
        method: :POST,
        path: "/api/dcim/inventory-items/",
        body: dcim_inventory_items_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a inventory item object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/inventory-items/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of inventory item objects.
    def list(*, asset_tag : Array(String)? = nil, asset_tag__empty : Bool? = nil, asset_tag__ic : Array(String)? = nil, asset_tag__ie : Array(String)? = nil, asset_tag__iew : Array(String)? = nil, asset_tag__iregex : Array(String)? = nil, asset_tag__isw : Array(String)? = nil, asset_tag__n : Array(String)? = nil, asset_tag__nic : Array(String)? = nil, asset_tag__nie : Array(String)? = nil, asset_tag__niew : Array(String)? = nil, asset_tag__nisw : Array(String)? = nil, asset_tag__regex : Array(String)? = nil, component_id : Array(Int32)? = nil, component_id__empty : Array(Int32)? = nil, component_id__gt : Array(Int32)? = nil, component_id__gte : Array(Int32)? = nil, component_id__lt : Array(Int32)? = nil, component_id__lte : Array(Int32)? = nil, component_id__n : Array(Int32)? = nil, component_type : String? = nil, component_type__n : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device__n : Array(String)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, device_role : Array(String)? = nil, device_role__n : Array(String)? = nil, device_role_id : Array(Int32)? = nil, device_role_id__n : Array(Int32)? = nil, device_status : Array(String)? = nil, device_status__empty : Bool? = nil, device_status__ic : Array(String)? = nil, device_status__ie : Array(String)? = nil, device_status__iew : Array(String)? = nil, device_status__iregex : Array(String)? = nil, device_status__isw : Array(String)? = nil, device_status__n : Array(String)? = nil, device_status__nic : Array(String)? = nil, device_status__nie : Array(String)? = nil, device_status__niew : Array(String)? = nil, device_status__nisw : Array(String)? = nil, device_status__regex : Array(String)? = nil, device_type : Array(String)? = nil, device_type__n : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, discovered : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(Int32)? = nil, location_id__n : Array(Int32)? = nil, manufacturer : Array(String)? = nil, manufacturer__n : Array(String)? = nil, manufacturer_id : Array(Int32)? = nil, manufacturer_id__n : Array(Int32)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, parent_id : Array(Int32)? = nil, parent_id__n : Array(Int32)? = nil, part_id : Array(String)? = nil, part_id__empty : Bool? = nil, part_id__ic : Array(String)? = nil, part_id__ie : Array(String)? = nil, part_id__iew : Array(String)? = nil, part_id__iregex : Array(String)? = nil, part_id__isw : Array(String)? = nil, part_id__n : Array(String)? = nil, part_id__nic : Array(String)? = nil, part_id__nie : Array(String)? = nil, part_id__niew : Array(String)? = nil, part_id__nisw : Array(String)? = nil, part_id__regex : Array(String)? = nil, q : String? = nil, rack : Array(String)? = nil, rack__n : Array(String)? = nil, rack_id : Array(Int32)? = nil, rack_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, serial : Array(String)? = nil, serial__empty : Bool? = nil, serial__ic : Array(String)? = nil, serial__ie : Array(String)? = nil, serial__iew : Array(String)? = nil, serial__iregex : Array(String)? = nil, serial__isw : Array(String)? = nil, serial__n : Array(String)? = nil, serial__nic : Array(String)? = nil, serial__nie : Array(String)? = nil, serial__niew : Array(String)? = nil, serial__nisw : Array(String)? = nil, serial__regex : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, virtual_chassis : Array(String)? = nil, virtual_chassis__n : Array(String)? = nil, virtual_chassis_id : Array(Int32)? = nil, virtual_chassis_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedInventoryItemList)
      @conn.request(NetboxClient::PaginatedInventoryItemList,
        method: :GET,
        path: "/api/dcim/inventory-items/",
        query: { "asset_tag" => asset_tag, "asset_tag__empty" => asset_tag__empty, "asset_tag__ic" => asset_tag__ic, "asset_tag__ie" => asset_tag__ie, "asset_tag__iew" => asset_tag__iew, "asset_tag__iregex" => asset_tag__iregex, "asset_tag__isw" => asset_tag__isw, "asset_tag__n" => asset_tag__n, "asset_tag__nic" => asset_tag__nic, "asset_tag__nie" => asset_tag__nie, "asset_tag__niew" => asset_tag__niew, "asset_tag__nisw" => asset_tag__nisw, "asset_tag__regex" => asset_tag__regex, "component_id" => component_id, "component_id__empty" => component_id__empty, "component_id__gt" => component_id__gt, "component_id__gte" => component_id__gte, "component_id__lt" => component_id__lt, "component_id__lte" => component_id__lte, "component_id__n" => component_id__n, "component_type" => component_type, "component_type__n" => component_type__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "device_role" => device_role, "device_role__n" => device_role__n, "device_role_id" => device_role_id, "device_role_id__n" => device_role_id__n, "device_status" => device_status, "device_status__empty" => device_status__empty, "device_status__ic" => device_status__ic, "device_status__ie" => device_status__ie, "device_status__iew" => device_status__iew, "device_status__iregex" => device_status__iregex, "device_status__isw" => device_status__isw, "device_status__n" => device_status__n, "device_status__nic" => device_status__nic, "device_status__nie" => device_status__nie, "device_status__niew" => device_status__niew, "device_status__nisw" => device_status__nisw, "device_status__regex" => device_status__regex, "device_type" => device_type, "device_type__n" => device_type__n, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "discovered" => discovered, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "manufacturer" => manufacturer, "manufacturer__n" => manufacturer__n, "manufacturer_id" => manufacturer_id, "manufacturer_id__n" => manufacturer_id__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "parent_id" => parent_id, "parent_id__n" => parent_id__n, "part_id" => part_id, "part_id__empty" => part_id__empty, "part_id__ic" => part_id__ic, "part_id__ie" => part_id__ie, "part_id__iew" => part_id__iew, "part_id__iregex" => part_id__iregex, "part_id__isw" => part_id__isw, "part_id__n" => part_id__n, "part_id__nic" => part_id__nic, "part_id__nie" => part_id__nie, "part_id__niew" => part_id__niew, "part_id__nisw" => part_id__nisw, "part_id__regex" => part_id__regex, "q" => q, "rack" => rack, "rack__n" => rack__n, "rack_id" => rack_id, "rack_id__n" => rack_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "serial" => serial, "serial__empty" => serial__empty, "serial__ic" => serial__ic, "serial__ie" => serial__ie, "serial__iew" => serial__iew, "serial__iregex" => serial__iregex, "serial__isw" => serial__isw, "serial__n" => serial__n, "serial__nic" => serial__nic, "serial__nie" => serial__nie, "serial__niew" => serial__niew, "serial__nisw" => serial__nisw, "serial__regex" => serial__regex, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "virtual_chassis" => virtual_chassis, "virtual_chassis__n" => virtual_chassis__n, "virtual_chassis_id" => virtual_chassis_id, "virtual_chassis_id__n" => virtual_chassis_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a inventory item object.
    def partial_update(id : Int32, patched_writable_inventory_item_request : NetboxClient::PatchedWritableInventoryItemRequest? = nil) : Response(NetboxClient::InventoryItem)
      @conn.request(NetboxClient::InventoryItem,
        method: :PATCH,
        path: "/api/dcim/inventory-items/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_inventory_item_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a inventory item object.
    def retrieve(id : Int32) : Response(NetboxClient::InventoryItem)
      @conn.request(NetboxClient::InventoryItem,
        method: :GET,
        path: "/api/dcim/inventory-items/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a inventory item object.
    def update(id : Int32, writable_inventory_item_request : NetboxClient::WritableInventoryItemRequest) : Response(NetboxClient::InventoryItem)
      @conn.request(NetboxClient::InventoryItem,
        method: :PUT,
        path: "/api/dcim/inventory-items/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_inventory_item_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
