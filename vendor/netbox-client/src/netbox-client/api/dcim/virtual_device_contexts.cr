require "json"

module NetboxClient
  module Api
  class Dcim::VirtualDeviceContexts
    def initialize(@conn : Connection); end

    #  Delete a list of virtual device context objects.
    def bulk_destroy(virtual_device_context_request : Array(NetboxClient::VirtualDeviceContextRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/virtual-device-contexts/",
        body: virtual_device_context_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of virtual device context objects.
    def bulk_partial_update(virtual_device_context_request : Array(NetboxClient::VirtualDeviceContextRequest)) : Response(Array(NetboxClient::VirtualDeviceContext))
      @conn.request(Array(NetboxClient::VirtualDeviceContext),
        method: :PATCH,
        path: "/api/dcim/virtual-device-contexts/",
        body: virtual_device_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of virtual device context objects.
    def bulk_update(virtual_device_context_request : Array(NetboxClient::VirtualDeviceContextRequest)) : Response(Array(NetboxClient::VirtualDeviceContext))
      @conn.request(Array(NetboxClient::VirtualDeviceContext),
        method: :PUT,
        path: "/api/dcim/virtual-device-contexts/",
        body: virtual_device_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of virtual device context objects.
    def create(dcim_virtual_device_contexts_create_request : NetboxClient::DcimVirtualDeviceContextsCreateRequest) : Response(NetboxClient::VirtualDeviceContext)
      @conn.request(NetboxClient::VirtualDeviceContext,
        method: :POST,
        path: "/api/dcim/virtual-device-contexts/",
        body: dcim_virtual_device_contexts_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a virtual device context object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/virtual-device-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of virtual device context objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(Int32)? = nil, device__n : Array(Int32)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, has_primary_ip : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, identifier : Array(Int32)? = nil, identifier__empty : Bool? = nil, identifier__gt : Array(Int32)? = nil, identifier__gte : Array(Int32)? = nil, identifier__lt : Array(Int32)? = nil, identifier__lte : Array(Int32)? = nil, identifier__n : Array(Int32)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, primary_ip4 : Array(String)? = nil, primary_ip4__n : Array(String)? = nil, primary_ip4_id : Array(Int32)? = nil, primary_ip4_id__n : Array(Int32)? = nil, primary_ip6 : Array(String)? = nil, primary_ip6__n : Array(String)? = nil, primary_ip6_id : Array(Int32)? = nil, primary_ip6_id__n : Array(Int32)? = nil, q : String? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedVirtualDeviceContextList)
      @conn.request(NetboxClient::PaginatedVirtualDeviceContextList,
        method: :GET,
        path: "/api/dcim/virtual-device-contexts/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "has_primary_ip" => has_primary_ip, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "identifier" => identifier, "identifier__empty" => identifier__empty, "identifier__gt" => identifier__gt, "identifier__gte" => identifier__gte, "identifier__lt" => identifier__lt, "identifier__lte" => identifier__lte, "identifier__n" => identifier__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "primary_ip4" => primary_ip4, "primary_ip4__n" => primary_ip4__n, "primary_ip4_id" => primary_ip4_id, "primary_ip4_id__n" => primary_ip4_id__n, "primary_ip6" => primary_ip6, "primary_ip6__n" => primary_ip6__n, "primary_ip6_id" => primary_ip6_id, "primary_ip6_id__n" => primary_ip6_id__n, "q" => q, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a virtual device context object.
    def partial_update(id : Int32, patched_writable_virtual_device_context_request : NetboxClient::PatchedWritableVirtualDeviceContextRequest? = nil) : Response(NetboxClient::VirtualDeviceContext)
      @conn.request(NetboxClient::VirtualDeviceContext,
        method: :PATCH,
        path: "/api/dcim/virtual-device-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_virtual_device_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a virtual device context object.
    def retrieve(id : Int32) : Response(NetboxClient::VirtualDeviceContext)
      @conn.request(NetboxClient::VirtualDeviceContext,
        method: :GET,
        path: "/api/dcim/virtual-device-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a virtual device context object.
    def update(id : Int32, writable_virtual_device_context_request : NetboxClient::WritableVirtualDeviceContextRequest) : Response(NetboxClient::VirtualDeviceContext)
      @conn.request(NetboxClient::VirtualDeviceContext,
        method: :PUT,
        path: "/api/dcim/virtual-device-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_virtual_device_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
