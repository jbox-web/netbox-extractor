require "json"

module NetboxClient
  module Api
  class Dcim::MacAddresses
    def initialize(@conn : Connection); end

    #  Delete a list of MAC address objects.
    def bulk_destroy(mac_address_request : Array(NetboxClient::MACAddressRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/mac-addresses/",
        body: mac_address_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of MAC address objects.
    def bulk_partial_update(mac_address_request : Array(NetboxClient::MACAddressRequest)) : Response(Array(NetboxClient::MACAddress))
      @conn.request(Array(NetboxClient::MACAddress),
        method: :PATCH,
        path: "/api/dcim/mac-addresses/",
        body: mac_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of MAC address objects.
    def bulk_update(mac_address_request : Array(NetboxClient::MACAddressRequest)) : Response(Array(NetboxClient::MACAddress))
      @conn.request(Array(NetboxClient::MACAddress),
        method: :PUT,
        path: "/api/dcim/mac-addresses/",
        body: mac_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of MAC address objects.
    def create(dcim_mac_addresses_create_request : NetboxClient::DcimMacAddressesCreateRequest) : Response(NetboxClient::MACAddress)
      @conn.request(NetboxClient::MACAddress,
        method: :POST,
        path: "/api/dcim/mac-addresses/",
        body: dcim_mac_addresses_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a MAC address object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/mac-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of MAC address objects.
    def list(*, assigned : Bool? = nil, assigned_object_id : Array(Int32)? = nil, assigned_object_id__empty : Bool? = nil, assigned_object_id__gt : Array(Int32)? = nil, assigned_object_id__gte : Array(Int32)? = nil, assigned_object_id__lt : Array(Int32)? = nil, assigned_object_id__lte : Array(Int32)? = nil, assigned_object_id__n : Array(Int32)? = nil, assigned_object_type : String? = nil, assigned_object_type__n : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device_id : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface : Array(String)? = nil, interface__n : Array(String)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mac_address : Array(String)? = nil, mac_address__ic : Array(String)? = nil, mac_address__ie : Array(String)? = nil, mac_address__iew : Array(String)? = nil, mac_address__iregex : Array(String)? = nil, mac_address__isw : Array(String)? = nil, mac_address__n : Array(String)? = nil, mac_address__nic : Array(String)? = nil, mac_address__nie : Array(String)? = nil, mac_address__niew : Array(String)? = nil, mac_address__nisw : Array(String)? = nil, mac_address__regex : Array(String)? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, primary : Bool? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, virtual_machine : Array(String)? = nil, virtual_machine_id : Array(Int32)? = nil, vminterface : Array(String)? = nil, vminterface__n : Array(String)? = nil, vminterface_id : Array(Int32)? = nil, vminterface_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedMACAddressList)
      @conn.request(NetboxClient::PaginatedMACAddressList,
        method: :GET,
        path: "/api/dcim/mac-addresses/",
        query: { "assigned" => assigned, "assigned_object_id" => assigned_object_id, "assigned_object_id__empty" => assigned_object_id__empty, "assigned_object_id__gt" => assigned_object_id__gt, "assigned_object_id__gte" => assigned_object_id__gte, "assigned_object_id__lt" => assigned_object_id__lt, "assigned_object_id__lte" => assigned_object_id__lte, "assigned_object_id__n" => assigned_object_id__n, "assigned_object_type" => assigned_object_type, "assigned_object_type__n" => assigned_object_type__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device_id" => device_id, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface" => interface, "interface__n" => interface__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mac_address" => mac_address, "mac_address__ic" => mac_address__ic, "mac_address__ie" => mac_address__ie, "mac_address__iew" => mac_address__iew, "mac_address__iregex" => mac_address__iregex, "mac_address__isw" => mac_address__isw, "mac_address__n" => mac_address__n, "mac_address__nic" => mac_address__nic, "mac_address__nie" => mac_address__nie, "mac_address__niew" => mac_address__niew, "mac_address__nisw" => mac_address__nisw, "mac_address__regex" => mac_address__regex, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "primary" => primary, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "virtual_machine" => virtual_machine, "virtual_machine_id" => virtual_machine_id, "vminterface" => vminterface, "vminterface__n" => vminterface__n, "vminterface_id" => vminterface_id, "vminterface_id__n" => vminterface_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a MAC address object.
    def partial_update(id : Int32, patched_mac_address_request : NetboxClient::PatchedMACAddressRequest? = nil) : Response(NetboxClient::MACAddress)
      @conn.request(NetboxClient::MACAddress,
        method: :PATCH,
        path: "/api/dcim/mac-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_mac_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a MAC address object.
    def retrieve(id : Int32) : Response(NetboxClient::MACAddress)
      @conn.request(NetboxClient::MACAddress,
        method: :GET,
        path: "/api/dcim/mac-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a MAC address object.
    def update(id : Int32, mac_address_request : NetboxClient::MACAddressRequest) : Response(NetboxClient::MACAddress)
      @conn.request(NetboxClient::MACAddress,
        method: :PUT,
        path: "/api/dcim/mac-addresses/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: mac_address_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
