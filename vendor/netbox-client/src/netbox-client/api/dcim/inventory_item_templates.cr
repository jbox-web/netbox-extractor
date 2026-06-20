require "json"

module NetboxClient
  module Api
  class Dcim::InventoryItemTemplates
    def initialize(@conn : Connection); end

    #  Delete a list of inventory item template objects.
    def bulk_destroy(inventory_item_template_request : Array(NetboxClient::InventoryItemTemplateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/inventory-item-templates/",
        body: inventory_item_template_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of inventory item template objects.
    def bulk_partial_update(inventory_item_template_request : Array(NetboxClient::InventoryItemTemplateRequest)) : Response(Array(NetboxClient::InventoryItemTemplate))
      @conn.request(Array(NetboxClient::InventoryItemTemplate),
        method: :PATCH,
        path: "/api/dcim/inventory-item-templates/",
        body: inventory_item_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of inventory item template objects.
    def bulk_update(inventory_item_template_request : Array(NetboxClient::InventoryItemTemplateRequest)) : Response(Array(NetboxClient::InventoryItemTemplate))
      @conn.request(Array(NetboxClient::InventoryItemTemplate),
        method: :PUT,
        path: "/api/dcim/inventory-item-templates/",
        body: inventory_item_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of inventory item template objects.
    def create(dcim_inventory_item_templates_create_request : NetboxClient::DcimInventoryItemTemplatesCreateRequest) : Response(NetboxClient::InventoryItemTemplate)
      @conn.request(NetboxClient::InventoryItemTemplate,
        method: :POST,
        path: "/api/dcim/inventory-item-templates/",
        body: dcim_inventory_item_templates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a inventory item template object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/inventory-item-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of inventory item template objects.
    def list(*, component_id : Array(Int32)? = nil, component_id__empty : Array(Int32)? = nil, component_id__gt : Array(Int32)? = nil, component_id__gte : Array(Int32)? = nil, component_id__lt : Array(Int32)? = nil, component_id__lte : Array(Int32)? = nil, component_id__n : Array(Int32)? = nil, component_type : String? = nil, component_type__n : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, manufacturer : Array(String)? = nil, manufacturer__n : Array(String)? = nil, manufacturer_id : Array(Int32)? = nil, manufacturer_id__n : Array(Int32)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, parent_id : Array(Int32)? = nil, parent_id__n : Array(Int32)? = nil, part_id : Array(String)? = nil, part_id__empty : Bool? = nil, part_id__ic : Array(String)? = nil, part_id__ie : Array(String)? = nil, part_id__iew : Array(String)? = nil, part_id__iregex : Array(String)? = nil, part_id__isw : Array(String)? = nil, part_id__n : Array(String)? = nil, part_id__nic : Array(String)? = nil, part_id__nie : Array(String)? = nil, part_id__niew : Array(String)? = nil, part_id__nisw : Array(String)? = nil, part_id__regex : Array(String)? = nil, q : String? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedInventoryItemTemplateList)
      @conn.request(NetboxClient::PaginatedInventoryItemTemplateList,
        method: :GET,
        path: "/api/dcim/inventory-item-templates/",
        query: { "component_id" => component_id, "component_id__empty" => component_id__empty, "component_id__gt" => component_id__gt, "component_id__gte" => component_id__gte, "component_id__lt" => component_id__lt, "component_id__lte" => component_id__lte, "component_id__n" => component_id__n, "component_type" => component_type, "component_type__n" => component_type__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "manufacturer" => manufacturer, "manufacturer__n" => manufacturer__n, "manufacturer_id" => manufacturer_id, "manufacturer_id__n" => manufacturer_id__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "parent_id" => parent_id, "parent_id__n" => parent_id__n, "part_id" => part_id, "part_id__empty" => part_id__empty, "part_id__ic" => part_id__ic, "part_id__ie" => part_id__ie, "part_id__iew" => part_id__iew, "part_id__iregex" => part_id__iregex, "part_id__isw" => part_id__isw, "part_id__n" => part_id__n, "part_id__nic" => part_id__nic, "part_id__nie" => part_id__nie, "part_id__niew" => part_id__niew, "part_id__nisw" => part_id__nisw, "part_id__regex" => part_id__regex, "q" => q, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a inventory item template object.
    def partial_update(id : Int32, patched_inventory_item_template_request : NetboxClient::PatchedInventoryItemTemplateRequest? = nil) : Response(NetboxClient::InventoryItemTemplate)
      @conn.request(NetboxClient::InventoryItemTemplate,
        method: :PATCH,
        path: "/api/dcim/inventory-item-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_inventory_item_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a inventory item template object.
    def retrieve(id : Int32) : Response(NetboxClient::InventoryItemTemplate)
      @conn.request(NetboxClient::InventoryItemTemplate,
        method: :GET,
        path: "/api/dcim/inventory-item-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a inventory item template object.
    def update(id : Int32, inventory_item_template_request : NetboxClient::InventoryItemTemplateRequest) : Response(NetboxClient::InventoryItemTemplate)
      @conn.request(NetboxClient::InventoryItemTemplate,
        method: :PUT,
        path: "/api/dcim/inventory-item-templates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: inventory_item_template_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
