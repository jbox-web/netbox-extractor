require "json"

module NetboxClient
  module Api
  class Ipam::IpAddresses
    def initialize(@conn : Connection); end

    #  Delete a list of IP address objects.
    def bulk_destroy(ip_address_request : Array(NetboxClient::IPAddressRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/ip-addresses/",
        body: ip_address_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of IP address objects.
    def bulk_partial_update(ip_address_request : Array(NetboxClient::IPAddressRequest)) : Response(Array(NetboxClient::IPAddress))
      @conn.request(Array(NetboxClient::IPAddress),
        method: :PATCH,
        path: "/api/ipam/ip-addresses/",
        body: ip_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of IP address objects.
    def bulk_update(ip_address_request : Array(NetboxClient::IPAddressRequest)) : Response(Array(NetboxClient::IPAddress))
      @conn.request(Array(NetboxClient::IPAddress),
        method: :PUT,
        path: "/api/ipam/ip-addresses/",
        body: ip_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of IP address objects.
    def create(ipam_ip_addresses_create_request : NetboxClient::IpamIpAddressesCreateRequest) : Response(NetboxClient::IPAddress)
      @conn.request(NetboxClient::IPAddress,
        method: :POST,
        path: "/api/ipam/ip-addresses/",
        body: ipam_ip_addresses_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a IP address object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/ip-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of IP address objects.
    def list(*, address : Array(String)? = nil, assigned : Bool? = nil, assigned_object_id : Array(Int32)? = nil, assigned_object_id__empty : Bool? = nil, assigned_object_id__gt : Array(Int32)? = nil, assigned_object_id__gte : Array(Int32)? = nil, assigned_object_id__lt : Array(Int32)? = nil, assigned_object_id__lte : Array(Int32)? = nil, assigned_object_id__n : Array(Int32)? = nil, assigned_object_type : String? = nil, assigned_object_type__n : String? = nil, assigned_to_interface : Bool? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device_id : Array(Int32)? = nil, dns_name : Array(String)? = nil, dns_name__empty : Bool? = nil, dns_name__ic : Array(String)? = nil, dns_name__ie : Array(String)? = nil, dns_name__iew : Array(String)? = nil, dns_name__iregex : Array(String)? = nil, dns_name__isw : Array(String)? = nil, dns_name__n : Array(String)? = nil, dns_name__nic : Array(String)? = nil, dns_name__nie : Array(String)? = nil, dns_name__niew : Array(String)? = nil, dns_name__nisw : Array(String)? = nil, dns_name__regex : Array(String)? = nil, family : Float64? = nil, fhrpgroup_id : Array(Int32)? = nil, fhrpgroup_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface : Array(String)? = nil, interface__n : Array(String)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mask_length : Array(Int32)? = nil, mask_length__gte : Float64? = nil, mask_length__lte : Float64? = nil, modified_by_request : String? = nil, nat_inside_id : Array(Int32)? = nil, nat_inside_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, parent : Array(String)? = nil, present_in_vrf : String? = nil, present_in_vrf_id : String? = nil, q : String? = nil, role : Array(String)? = nil, role__empty : Bool? = nil, role__ic : Array(String)? = nil, role__ie : Array(String)? = nil, role__iew : Array(String)? = nil, role__iregex : Array(String)? = nil, role__isw : Array(String)? = nil, role__n : Array(String)? = nil, role__nic : Array(String)? = nil, role__nie : Array(String)? = nil, role__niew : Array(String)? = nil, role__nisw : Array(String)? = nil, role__regex : Array(String)? = nil, service_id : Array(Int32)? = nil, service_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, virtual_machine : Array(String)? = nil, virtual_machine_id : Array(Int32)? = nil, vminterface : Array(String)? = nil, vminterface__n : Array(String)? = nil, vminterface_id : Array(Int32)? = nil, vminterface_id__n : Array(Int32)? = nil, vrf : Array(String)? = nil, vrf__n : Array(String)? = nil, vrf_id : Array(Int32)? = nil, vrf_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedIPAddressList)
      @conn.request(NetboxClient::PaginatedIPAddressList,
        method: :GET,
        path: "/api/ipam/ip-addresses/",
        query: { "address" => address, "assigned" => assigned, "assigned_object_id" => assigned_object_id, "assigned_object_id__empty" => assigned_object_id__empty, "assigned_object_id__gt" => assigned_object_id__gt, "assigned_object_id__gte" => assigned_object_id__gte, "assigned_object_id__lt" => assigned_object_id__lt, "assigned_object_id__lte" => assigned_object_id__lte, "assigned_object_id__n" => assigned_object_id__n, "assigned_object_type" => assigned_object_type, "assigned_object_type__n" => assigned_object_type__n, "assigned_to_interface" => assigned_to_interface, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device_id" => device_id, "dns_name" => dns_name, "dns_name__empty" => dns_name__empty, "dns_name__ic" => dns_name__ic, "dns_name__ie" => dns_name__ie, "dns_name__iew" => dns_name__iew, "dns_name__iregex" => dns_name__iregex, "dns_name__isw" => dns_name__isw, "dns_name__n" => dns_name__n, "dns_name__nic" => dns_name__nic, "dns_name__nie" => dns_name__nie, "dns_name__niew" => dns_name__niew, "dns_name__nisw" => dns_name__nisw, "dns_name__regex" => dns_name__regex, "family" => family, "fhrpgroup_id" => fhrpgroup_id, "fhrpgroup_id__n" => fhrpgroup_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface" => interface, "interface__n" => interface__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mask_length" => mask_length, "mask_length__gte" => mask_length__gte, "mask_length__lte" => mask_length__lte, "modified_by_request" => modified_by_request, "nat_inside_id" => nat_inside_id, "nat_inside_id__n" => nat_inside_id__n, "offset" => offset, "ordering" => ordering, "parent" => parent, "present_in_vrf" => present_in_vrf, "present_in_vrf_id" => present_in_vrf_id, "q" => q, "role" => role, "role__empty" => role__empty, "role__ic" => role__ic, "role__ie" => role__ie, "role__iew" => role__iew, "role__iregex" => role__iregex, "role__isw" => role__isw, "role__n" => role__n, "role__nic" => role__nic, "role__nie" => role__nie, "role__niew" => role__niew, "role__nisw" => role__nisw, "role__regex" => role__regex, "service_id" => service_id, "service_id__n" => service_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "virtual_machine" => virtual_machine, "virtual_machine_id" => virtual_machine_id, "vminterface" => vminterface, "vminterface__n" => vminterface__n, "vminterface_id" => vminterface_id, "vminterface_id__n" => vminterface_id__n, "vrf" => vrf, "vrf__n" => vrf__n, "vrf_id" => vrf_id, "vrf_id__n" => vrf_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a IP address object.
    def partial_update(id : Int32, patched_writable_ip_address_request : NetboxClient::PatchedWritableIPAddressRequest? = nil) : Response(NetboxClient::IPAddress)
      @conn.request(NetboxClient::IPAddress,
        method: :PATCH,
        path: "/api/ipam/ip-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_ip_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IP address object.
    def retrieve(id : Int32) : Response(NetboxClient::IPAddress)
      @conn.request(NetboxClient::IPAddress,
        method: :GET,
        path: "/api/ipam/ip-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a IP address object.
    def update(id : Int32, writable_ip_address_request : NetboxClient::WritableIPAddressRequest) : Response(NetboxClient::IPAddress)
      @conn.request(NetboxClient::IPAddress,
        method: :PUT,
        path: "/api/ipam/ip-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_ip_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
