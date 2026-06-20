require "json"

module NetboxClient
  module Api
  class Virtualization::VirtualMachines
    def initialize(@conn : Connection); end

    #  Delete a list of virtual machine objects.
    def bulk_destroy(virtual_machine_with_config_context_request : Array(NetboxClient::VirtualMachineWithConfigContextRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/virtualization/virtual-machines/",
        body: virtual_machine_with_config_context_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of virtual machine objects.
    def bulk_partial_update(virtual_machine_with_config_context_request : Array(NetboxClient::VirtualMachineWithConfigContextRequest)) : Response(Array(NetboxClient::VirtualMachineWithConfigContext))
      @conn.request(Array(NetboxClient::VirtualMachineWithConfigContext),
        method: :PATCH,
        path: "/api/virtualization/virtual-machines/",
        body: virtual_machine_with_config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of virtual machine objects.
    def bulk_update(virtual_machine_with_config_context_request : Array(NetboxClient::VirtualMachineWithConfigContextRequest)) : Response(Array(NetboxClient::VirtualMachineWithConfigContext))
      @conn.request(Array(NetboxClient::VirtualMachineWithConfigContext),
        method: :PUT,
        path: "/api/virtualization/virtual-machines/",
        body: virtual_machine_with_config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of virtual machine objects.
    def create(virtualization_virtual_machines_create_request : NetboxClient::VirtualizationVirtualMachinesCreateRequest) : Response(NetboxClient::VirtualMachineWithConfigContext)
      @conn.request(NetboxClient::VirtualMachineWithConfigContext,
        method: :POST,
        path: "/api/virtualization/virtual-machines/",
        body: virtualization_virtual_machines_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a virtual machine object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/virtualization/virtual-machines/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of virtual machine objects.
    def list(*, cluster : Array(String)? = nil, cluster__n : Array(String)? = nil, cluster_group : Array(String)? = nil, cluster_group__n : Array(String)? = nil, cluster_group_id : Array(Int32)? = nil, cluster_group_id__n : Array(Int32)? = nil, cluster_id : Array(Int32)? = nil, cluster_id__n : Array(Int32)? = nil, cluster_type : Array(String)? = nil, cluster_type__n : Array(String)? = nil, cluster_type_id : Array(Int32)? = nil, cluster_type_id__n : Array(Int32)? = nil, config_template_id : Array(Int32)? = nil, config_template_id__n : Array(Int32)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device__n : Array(String)? = nil, device_id : Array(Int32)? = nil, device_id__n : Array(Int32)? = nil, disk : Array(Int32)? = nil, disk__empty : Bool? = nil, disk__gt : Array(Int32)? = nil, disk__gte : Array(Int32)? = nil, disk__lt : Array(Int32)? = nil, disk__lte : Array(Int32)? = nil, disk__n : Array(Int32)? = nil, has_primary_ip : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_count : Array(Int32)? = nil, interface_count__empty : Bool? = nil, interface_count__gt : Array(Int32)? = nil, interface_count__gte : Array(Int32)? = nil, interface_count__lt : Array(Int32)? = nil, interface_count__lte : Array(Int32)? = nil, interface_count__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, local_context_data : Bool? = nil, mac_address : Array(String)? = nil, mac_address__ic : Array(String)? = nil, mac_address__ie : Array(String)? = nil, mac_address__iew : Array(String)? = nil, mac_address__iregex : Array(String)? = nil, mac_address__isw : Array(String)? = nil, mac_address__n : Array(String)? = nil, mac_address__nic : Array(String)? = nil, mac_address__nie : Array(String)? = nil, mac_address__niew : Array(String)? = nil, mac_address__nisw : Array(String)? = nil, mac_address__regex : Array(String)? = nil, memory : Array(Int32)? = nil, memory__empty : Bool? = nil, memory__gt : Array(Int32)? = nil, memory__gte : Array(Int32)? = nil, memory__lt : Array(Int32)? = nil, memory__lte : Array(Int32)? = nil, memory__n : Array(Int32)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, platform : Array(String)? = nil, platform__n : Array(String)? = nil, platform_id : Array(String)? = nil, platform_id__n : Array(String)? = nil, primary_ip4 : Array(String)? = nil, primary_ip4__n : Array(String)? = nil, primary_ip4_id : Array(Int32)? = nil, primary_ip4_id__n : Array(Int32)? = nil, primary_ip6 : Array(String)? = nil, primary_ip6__n : Array(String)? = nil, primary_ip6_id : Array(Int32)? = nil, primary_ip6_id__n : Array(Int32)? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(String)? = nil, role_id__n : Array(String)? = nil, serial : Array(String)? = nil, serial__empty : Bool? = nil, serial__ic : Array(String)? = nil, serial__ie : Array(String)? = nil, serial__iew : Array(String)? = nil, serial__iregex : Array(String)? = nil, serial__isw : Array(String)? = nil, serial__n : Array(String)? = nil, serial__nic : Array(String)? = nil, serial__nie : Array(String)? = nil, serial__niew : Array(String)? = nil, serial__nisw : Array(String)? = nil, serial__regex : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, vcpus : Array(Float64)? = nil, vcpus__empty : Bool? = nil, vcpus__gt : Array(Float64)? = nil, vcpus__gte : Array(Float64)? = nil, vcpus__lt : Array(Float64)? = nil, vcpus__lte : Array(Float64)? = nil, vcpus__n : Array(Float64)? = nil, virtual_disk_count : Array(Int32)? = nil, virtual_disk_count__empty : Bool? = nil, virtual_disk_count__gt : Array(Int32)? = nil, virtual_disk_count__gte : Array(Int32)? = nil, virtual_disk_count__lt : Array(Int32)? = nil, virtual_disk_count__lte : Array(Int32)? = nil, virtual_disk_count__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedVirtualMachineWithConfigContextList)
      @conn.request(NetboxClient::PaginatedVirtualMachineWithConfigContextList,
        method: :GET,
        path: "/api/virtualization/virtual-machines/",
        query: { "cluster" => cluster, "cluster__n" => cluster__n, "cluster_group" => cluster_group, "cluster_group__n" => cluster_group__n, "cluster_group_id" => cluster_group_id, "cluster_group_id__n" => cluster_group_id__n, "cluster_id" => cluster_id, "cluster_id__n" => cluster_id__n, "cluster_type" => cluster_type, "cluster_type__n" => cluster_type__n, "cluster_type_id" => cluster_type_id, "cluster_type_id__n" => cluster_type_id__n, "config_template_id" => config_template_id, "config_template_id__n" => config_template_id__n, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device__n" => device__n, "device_id" => device_id, "device_id__n" => device_id__n, "disk" => disk, "disk__empty" => disk__empty, "disk__gt" => disk__gt, "disk__gte" => disk__gte, "disk__lt" => disk__lt, "disk__lte" => disk__lte, "disk__n" => disk__n, "has_primary_ip" => has_primary_ip, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_count" => interface_count, "interface_count__empty" => interface_count__empty, "interface_count__gt" => interface_count__gt, "interface_count__gte" => interface_count__gte, "interface_count__lt" => interface_count__lt, "interface_count__lte" => interface_count__lte, "interface_count__n" => interface_count__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "local_context_data" => local_context_data, "mac_address" => mac_address, "mac_address__ic" => mac_address__ic, "mac_address__ie" => mac_address__ie, "mac_address__iew" => mac_address__iew, "mac_address__iregex" => mac_address__iregex, "mac_address__isw" => mac_address__isw, "mac_address__n" => mac_address__n, "mac_address__nic" => mac_address__nic, "mac_address__nie" => mac_address__nie, "mac_address__niew" => mac_address__niew, "mac_address__nisw" => mac_address__nisw, "mac_address__regex" => mac_address__regex, "memory" => memory, "memory__empty" => memory__empty, "memory__gt" => memory__gt, "memory__gte" => memory__gte, "memory__lt" => memory__lt, "memory__lte" => memory__lte, "memory__n" => memory__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "platform" => platform, "platform__n" => platform__n, "platform_id" => platform_id, "platform_id__n" => platform_id__n, "primary_ip4" => primary_ip4, "primary_ip4__n" => primary_ip4__n, "primary_ip4_id" => primary_ip4_id, "primary_ip4_id__n" => primary_ip4_id__n, "primary_ip6" => primary_ip6, "primary_ip6__n" => primary_ip6__n, "primary_ip6_id" => primary_ip6_id, "primary_ip6_id__n" => primary_ip6_id__n, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "serial" => serial, "serial__empty" => serial__empty, "serial__ic" => serial__ic, "serial__ie" => serial__ie, "serial__iew" => serial__iew, "serial__iregex" => serial__iregex, "serial__isw" => serial__isw, "serial__n" => serial__n, "serial__nic" => serial__nic, "serial__nie" => serial__nie, "serial__niew" => serial__niew, "serial__nisw" => serial__nisw, "serial__regex" => serial__regex, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "vcpus" => vcpus, "vcpus__empty" => vcpus__empty, "vcpus__gt" => vcpus__gt, "vcpus__gte" => vcpus__gte, "vcpus__lt" => vcpus__lt, "vcpus__lte" => vcpus__lte, "vcpus__n" => vcpus__n, "virtual_disk_count" => virtual_disk_count, "virtual_disk_count__empty" => virtual_disk_count__empty, "virtual_disk_count__gt" => virtual_disk_count__gt, "virtual_disk_count__gte" => virtual_disk_count__gte, "virtual_disk_count__lt" => virtual_disk_count__lt, "virtual_disk_count__lte" => virtual_disk_count__lte, "virtual_disk_count__n" => virtual_disk_count__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a virtual machine object.
    def partial_update(id : Int32, patched_writable_virtual_machine_with_config_context_request : NetboxClient::PatchedWritableVirtualMachineWithConfigContextRequest? = nil) : Response(NetboxClient::VirtualMachineWithConfigContext)
      @conn.request(NetboxClient::VirtualMachineWithConfigContext,
        method: :PATCH,
        path: "/api/virtualization/virtual-machines/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_virtual_machine_with_config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Resolve and render the preferred ConfigTemplate for this Device.
    def render_config_create(id : Int32, writable_virtual_machine_with_config_context_request : NetboxClient::WritableVirtualMachineWithConfigContextRequest, *, format : String? = nil) : Response(NetboxClient::VirtualMachineWithConfigContext)
      @conn.request(NetboxClient::VirtualMachineWithConfigContext,
        method: :POST,
        path: "/api/virtualization/virtual-machines/{id}/render-config/".sub("{id}", NetboxClient.enc(id)),
        body: writable_virtual_machine_with_config_context_request,
        query: { "format" => format },
        accept: %w[application/json text/plain],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a virtual machine object.
    def retrieve(id : Int32) : Response(NetboxClient::VirtualMachineWithConfigContext)
      @conn.request(NetboxClient::VirtualMachineWithConfigContext,
        method: :GET,
        path: "/api/virtualization/virtual-machines/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a virtual machine object.
    def update(id : Int32, writable_virtual_machine_with_config_context_request : NetboxClient::WritableVirtualMachineWithConfigContextRequest) : Response(NetboxClient::VirtualMachineWithConfigContext)
      @conn.request(NetboxClient::VirtualMachineWithConfigContext,
        method: :PUT,
        path: "/api/virtualization/virtual-machines/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_virtual_machine_with_config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
