require "json"

module NetboxClient
  module Api
  class Wireless::WirelessLinks
    def initialize(@conn : Connection); end

    #  Delete a list of wireless link objects.
    def bulk_destroy(wireless_link_request : Array(NetboxClient::WirelessLinkRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/wireless/wireless-links/",
        body: wireless_link_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of wireless link objects.
    def bulk_partial_update(wireless_link_request : Array(NetboxClient::WirelessLinkRequest)) : Response(Array(NetboxClient::WirelessLink))
      @conn.request(Array(NetboxClient::WirelessLink),
        method: :PATCH,
        path: "/api/wireless/wireless-links/",
        body: wireless_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of wireless link objects.
    def bulk_update(wireless_link_request : Array(NetboxClient::WirelessLinkRequest)) : Response(Array(NetboxClient::WirelessLink))
      @conn.request(Array(NetboxClient::WirelessLink),
        method: :PUT,
        path: "/api/wireless/wireless-links/",
        body: wireless_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of wireless link objects.
    def create(wireless_wireless_links_create_request : NetboxClient::WirelessWirelessLinksCreateRequest) : Response(NetboxClient::WirelessLink)
      @conn.request(NetboxClient::WirelessLink,
        method: :POST,
        path: "/api/wireless/wireless-links/",
        body: wireless_wireless_links_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a wireless link object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/wireless/wireless-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of wireless link objects.
    def list(*, auth_cipher : Array(String)? = nil, auth_cipher__empty : Bool? = nil, auth_cipher__ic : Array(String)? = nil, auth_cipher__ie : Array(String)? = nil, auth_cipher__iew : Array(String)? = nil, auth_cipher__iregex : Array(String)? = nil, auth_cipher__isw : Array(String)? = nil, auth_cipher__n : Array(String)? = nil, auth_cipher__nic : Array(String)? = nil, auth_cipher__nie : Array(String)? = nil, auth_cipher__niew : Array(String)? = nil, auth_cipher__nisw : Array(String)? = nil, auth_cipher__regex : Array(String)? = nil, auth_psk : Array(String)? = nil, auth_psk__empty : Bool? = nil, auth_psk__ic : Array(String)? = nil, auth_psk__ie : Array(String)? = nil, auth_psk__iew : Array(String)? = nil, auth_psk__iregex : Array(String)? = nil, auth_psk__isw : Array(String)? = nil, auth_psk__n : Array(String)? = nil, auth_psk__nic : Array(String)? = nil, auth_psk__nie : Array(String)? = nil, auth_psk__niew : Array(String)? = nil, auth_psk__nisw : Array(String)? = nil, auth_psk__regex : Array(String)? = nil, auth_type : Array(String)? = nil, auth_type__empty : Bool? = nil, auth_type__ic : Array(String)? = nil, auth_type__ie : Array(String)? = nil, auth_type__iew : Array(String)? = nil, auth_type__iregex : Array(String)? = nil, auth_type__isw : Array(String)? = nil, auth_type__n : Array(String)? = nil, auth_type__nic : Array(String)? = nil, auth_type__nie : Array(String)? = nil, auth_type__niew : Array(String)? = nil, auth_type__nisw : Array(String)? = nil, auth_type__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, distance : Array(Float64)? = nil, distance__empty : Bool? = nil, distance__gt : Array(Float64)? = nil, distance__gte : Array(Float64)? = nil, distance__lt : Array(Float64)? = nil, distance__lte : Array(Float64)? = nil, distance__n : Array(Float64)? = nil, distance_unit : String? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_a_id : Array(Int32)? = nil, interface_a_id__n : Array(Int32)? = nil, interface_b_id : Array(Int32)? = nil, interface_b_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, ssid : Array(String)? = nil, ssid__empty : Bool? = nil, ssid__ic : Array(String)? = nil, ssid__ie : Array(String)? = nil, ssid__iew : Array(String)? = nil, ssid__iregex : Array(String)? = nil, ssid__isw : Array(String)? = nil, ssid__n : Array(String)? = nil, ssid__nic : Array(String)? = nil, ssid__nie : Array(String)? = nil, ssid__niew : Array(String)? = nil, ssid__nisw : Array(String)? = nil, ssid__regex : Array(String)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedWirelessLinkList)
      @conn.request(NetboxClient::PaginatedWirelessLinkList,
        method: :GET,
        path: "/api/wireless/wireless-links/",
        query: { "auth_cipher" => auth_cipher, "auth_cipher__empty" => auth_cipher__empty, "auth_cipher__ic" => auth_cipher__ic, "auth_cipher__ie" => auth_cipher__ie, "auth_cipher__iew" => auth_cipher__iew, "auth_cipher__iregex" => auth_cipher__iregex, "auth_cipher__isw" => auth_cipher__isw, "auth_cipher__n" => auth_cipher__n, "auth_cipher__nic" => auth_cipher__nic, "auth_cipher__nie" => auth_cipher__nie, "auth_cipher__niew" => auth_cipher__niew, "auth_cipher__nisw" => auth_cipher__nisw, "auth_cipher__regex" => auth_cipher__regex, "auth_psk" => auth_psk, "auth_psk__empty" => auth_psk__empty, "auth_psk__ic" => auth_psk__ic, "auth_psk__ie" => auth_psk__ie, "auth_psk__iew" => auth_psk__iew, "auth_psk__iregex" => auth_psk__iregex, "auth_psk__isw" => auth_psk__isw, "auth_psk__n" => auth_psk__n, "auth_psk__nic" => auth_psk__nic, "auth_psk__nie" => auth_psk__nie, "auth_psk__niew" => auth_psk__niew, "auth_psk__nisw" => auth_psk__nisw, "auth_psk__regex" => auth_psk__regex, "auth_type" => auth_type, "auth_type__empty" => auth_type__empty, "auth_type__ic" => auth_type__ic, "auth_type__ie" => auth_type__ie, "auth_type__iew" => auth_type__iew, "auth_type__iregex" => auth_type__iregex, "auth_type__isw" => auth_type__isw, "auth_type__n" => auth_type__n, "auth_type__nic" => auth_type__nic, "auth_type__nie" => auth_type__nie, "auth_type__niew" => auth_type__niew, "auth_type__nisw" => auth_type__nisw, "auth_type__regex" => auth_type__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "distance" => distance, "distance__empty" => distance__empty, "distance__gt" => distance__gt, "distance__gte" => distance__gte, "distance__lt" => distance__lt, "distance__lte" => distance__lte, "distance__n" => distance__n, "distance_unit" => distance_unit, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_a_id" => interface_a_id, "interface_a_id__n" => interface_a_id__n, "interface_b_id" => interface_b_id, "interface_b_id__n" => interface_b_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "q" => q, "ssid" => ssid, "ssid__empty" => ssid__empty, "ssid__ic" => ssid__ic, "ssid__ie" => ssid__ie, "ssid__iew" => ssid__iew, "ssid__iregex" => ssid__iregex, "ssid__isw" => ssid__isw, "ssid__n" => ssid__n, "ssid__nic" => ssid__nic, "ssid__nie" => ssid__nie, "ssid__niew" => ssid__niew, "ssid__nisw" => ssid__nisw, "ssid__regex" => ssid__regex, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a wireless link object.
    def partial_update(id : Int32, patched_writable_wireless_link_request : NetboxClient::PatchedWritableWirelessLinkRequest? = nil) : Response(NetboxClient::WirelessLink)
      @conn.request(NetboxClient::WirelessLink,
        method: :PATCH,
        path: "/api/wireless/wireless-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_wireless_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a wireless link object.
    def retrieve(id : Int32) : Response(NetboxClient::WirelessLink)
      @conn.request(NetboxClient::WirelessLink,
        method: :GET,
        path: "/api/wireless/wireless-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a wireless link object.
    def update(id : Int32, writable_wireless_link_request : NetboxClient::WritableWirelessLinkRequest) : Response(NetboxClient::WirelessLink)
      @conn.request(NetboxClient::WirelessLink,
        method: :PUT,
        path: "/api/wireless/wireless-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_wireless_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
