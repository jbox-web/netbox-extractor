require "json"

module NetboxClient
  module Api
  class Virtualization::Interfaces
    def initialize(@conn : Connection); end

    #  Delete a list of interface objects.
    def bulk_destroy(vm_interface_request : Array(NetboxClient::VMInterfaceRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/virtualization/interfaces/",
        body: vm_interface_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of interface objects.
    def bulk_partial_update(vm_interface_request : Array(NetboxClient::VMInterfaceRequest)) : Response(Array(NetboxClient::VMInterface))
      @conn.request(Array(NetboxClient::VMInterface),
        method: :PATCH,
        path: "/api/virtualization/interfaces/",
        body: vm_interface_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of interface objects.
    def bulk_update(vm_interface_request : Array(NetboxClient::VMInterfaceRequest)) : Response(Array(NetboxClient::VMInterface))
      @conn.request(Array(NetboxClient::VMInterface),
        method: :PUT,
        path: "/api/virtualization/interfaces/",
        body: vm_interface_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of interface objects.
    def create(virtualization_interfaces_create_request : NetboxClient::VirtualizationInterfacesCreateRequest) : Response(NetboxClient::VMInterface)
      @conn.request(NetboxClient::VMInterface,
        method: :POST,
        path: "/api/virtualization/interfaces/",
        body: virtualization_interfaces_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a interface object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/virtualization/interfaces/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of interface objects.
    def list(*, bridge_id : Array(Int32)? = nil, bridge_id__n : Array(Int32)? = nil, cluster : Array(String)? = nil, cluster__n : Array(String)? = nil, cluster_id : Array(Int32)? = nil, cluster_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, enabled : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, l2vpn : Array(String)? = nil, l2vpn__n : Array(String)? = nil, l2vpn_id : Array(Int32)? = nil, l2vpn_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mac_address : Array(String)? = nil, mac_address__ic : Array(String)? = nil, mac_address__ie : Array(String)? = nil, mac_address__iew : Array(String)? = nil, mac_address__iregex : Array(String)? = nil, mac_address__isw : Array(String)? = nil, mac_address__n : Array(String)? = nil, mac_address__nic : Array(String)? = nil, mac_address__nie : Array(String)? = nil, mac_address__niew : Array(String)? = nil, mac_address__nisw : Array(String)? = nil, mac_address__regex : Array(String)? = nil, mode : Array(String)? = nil, mode__empty : Bool? = nil, mode__ic : Array(String)? = nil, mode__ie : Array(String)? = nil, mode__iew : Array(String)? = nil, mode__iregex : Array(String)? = nil, mode__isw : Array(String)? = nil, mode__n : Array(String)? = nil, mode__nic : Array(String)? = nil, mode__nie : Array(String)? = nil, mode__niew : Array(String)? = nil, mode__nisw : Array(String)? = nil, mode__regex : Array(String)? = nil, modified_by_request : String? = nil, mtu : Array(Int32)? = nil, mtu__empty : Bool? = nil, mtu__gt : Array(Int32)? = nil, mtu__gte : Array(Int32)? = nil, mtu__lt : Array(Int32)? = nil, mtu__lte : Array(Int32)? = nil, mtu__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, parent_id : Array(Int32)? = nil, parent_id__n : Array(Int32)? = nil, primary_mac_address : Array(String)? = nil, primary_mac_address__n : Array(String)? = nil, primary_mac_address_id : Array(Int32)? = nil, primary_mac_address_id__n : Array(Int32)? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, virtual_machine : Array(String)? = nil, virtual_machine__n : Array(String)? = nil, virtual_machine_id : Array(Int32)? = nil, virtual_machine_id__n : Array(Int32)? = nil, vlan : String? = nil, vlan_id : String? = nil, vlan_translation_policy : Array(String)? = nil, vlan_translation_policy__n : Array(String)? = nil, vlan_translation_policy_id : Array(Int32)? = nil, vlan_translation_policy_id__n : Array(Int32)? = nil, vrf : Array(String)? = nil, vrf__n : Array(String)? = nil, vrf_id : Array(Int32)? = nil, vrf_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedVMInterfaceList)
      @conn.request(NetboxClient::PaginatedVMInterfaceList,
        method: :GET,
        path: "/api/virtualization/interfaces/",
        query: { "bridge_id" => bridge_id, "bridge_id__n" => bridge_id__n, "cluster" => cluster, "cluster__n" => cluster__n, "cluster_id" => cluster_id, "cluster_id__n" => cluster_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "enabled" => enabled, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "l2vpn" => l2vpn, "l2vpn__n" => l2vpn__n, "l2vpn_id" => l2vpn_id, "l2vpn_id__n" => l2vpn_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mac_address" => mac_address, "mac_address__ic" => mac_address__ic, "mac_address__ie" => mac_address__ie, "mac_address__iew" => mac_address__iew, "mac_address__iregex" => mac_address__iregex, "mac_address__isw" => mac_address__isw, "mac_address__n" => mac_address__n, "mac_address__nic" => mac_address__nic, "mac_address__nie" => mac_address__nie, "mac_address__niew" => mac_address__niew, "mac_address__nisw" => mac_address__nisw, "mac_address__regex" => mac_address__regex, "mode" => mode, "mode__empty" => mode__empty, "mode__ic" => mode__ic, "mode__ie" => mode__ie, "mode__iew" => mode__iew, "mode__iregex" => mode__iregex, "mode__isw" => mode__isw, "mode__n" => mode__n, "mode__nic" => mode__nic, "mode__nie" => mode__nie, "mode__niew" => mode__niew, "mode__nisw" => mode__nisw, "mode__regex" => mode__regex, "modified_by_request" => modified_by_request, "mtu" => mtu, "mtu__empty" => mtu__empty, "mtu__gt" => mtu__gt, "mtu__gte" => mtu__gte, "mtu__lt" => mtu__lt, "mtu__lte" => mtu__lte, "mtu__n" => mtu__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "parent_id" => parent_id, "parent_id__n" => parent_id__n, "primary_mac_address" => primary_mac_address, "primary_mac_address__n" => primary_mac_address__n, "primary_mac_address_id" => primary_mac_address_id, "primary_mac_address_id__n" => primary_mac_address_id__n, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "virtual_machine" => virtual_machine, "virtual_machine__n" => virtual_machine__n, "virtual_machine_id" => virtual_machine_id, "virtual_machine_id__n" => virtual_machine_id__n, "vlan" => vlan, "vlan_id" => vlan_id, "vlan_translation_policy" => vlan_translation_policy, "vlan_translation_policy__n" => vlan_translation_policy__n, "vlan_translation_policy_id" => vlan_translation_policy_id, "vlan_translation_policy_id__n" => vlan_translation_policy_id__n, "vrf" => vrf, "vrf__n" => vrf__n, "vrf_id" => vrf_id, "vrf_id__n" => vrf_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a interface object.
    def partial_update(id : Int32, patched_writable_vm_interface_request : NetboxClient::PatchedWritableVMInterfaceRequest? = nil) : Response(NetboxClient::VMInterface)
      @conn.request(NetboxClient::VMInterface,
        method: :PATCH,
        path: "/api/virtualization/interfaces/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_vm_interface_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a interface object.
    def retrieve(id : Int32) : Response(NetboxClient::VMInterface)
      @conn.request(NetboxClient::VMInterface,
        method: :GET,
        path: "/api/virtualization/interfaces/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a interface object.
    def update(id : Int32, writable_vm_interface_request : NetboxClient::WritableVMInterfaceRequest) : Response(NetboxClient::VMInterface)
      @conn.request(NetboxClient::VMInterface,
        method: :PUT,
        path: "/api/virtualization/interfaces/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_vm_interface_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
