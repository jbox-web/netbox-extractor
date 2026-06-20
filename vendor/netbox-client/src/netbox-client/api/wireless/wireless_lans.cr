require "json"

module NetboxClient
  module Api
  class Wireless::WirelessLans
    def initialize(@conn : Connection); end

    #  Delete a list of wireless LAN objects.
    def bulk_destroy(wireless_lan_request : Array(NetboxClient::WirelessLANRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/wireless/wireless-lans/",
        body: wireless_lan_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of wireless LAN objects.
    def bulk_partial_update(wireless_lan_request : Array(NetboxClient::WirelessLANRequest)) : Response(Array(NetboxClient::WirelessLAN))
      @conn.request(Array(NetboxClient::WirelessLAN),
        method: :PATCH,
        path: "/api/wireless/wireless-lans/",
        body: wireless_lan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of wireless LAN objects.
    def bulk_update(wireless_lan_request : Array(NetboxClient::WirelessLANRequest)) : Response(Array(NetboxClient::WirelessLAN))
      @conn.request(Array(NetboxClient::WirelessLAN),
        method: :PUT,
        path: "/api/wireless/wireless-lans/",
        body: wireless_lan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of wireless LAN objects.
    def create(wireless_wireless_lans_create_request : NetboxClient::WirelessWirelessLansCreateRequest) : Response(NetboxClient::WirelessLAN)
      @conn.request(NetboxClient::WirelessLAN,
        method: :POST,
        path: "/api/wireless/wireless-lans/",
        body: wireless_wireless_lans_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a wireless LAN object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/wireless/wireless-lans/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of wireless LAN objects.
    def list(*, auth_cipher : Array(String)? = nil, auth_cipher__empty : Bool? = nil, auth_cipher__ic : Array(String)? = nil, auth_cipher__ie : Array(String)? = nil, auth_cipher__iew : Array(String)? = nil, auth_cipher__iregex : Array(String)? = nil, auth_cipher__isw : Array(String)? = nil, auth_cipher__n : Array(String)? = nil, auth_cipher__nic : Array(String)? = nil, auth_cipher__nie : Array(String)? = nil, auth_cipher__niew : Array(String)? = nil, auth_cipher__nisw : Array(String)? = nil, auth_cipher__regex : Array(String)? = nil, auth_psk : Array(String)? = nil, auth_psk__empty : Bool? = nil, auth_psk__ic : Array(String)? = nil, auth_psk__ie : Array(String)? = nil, auth_psk__iew : Array(String)? = nil, auth_psk__iregex : Array(String)? = nil, auth_psk__isw : Array(String)? = nil, auth_psk__n : Array(String)? = nil, auth_psk__nic : Array(String)? = nil, auth_psk__nie : Array(String)? = nil, auth_psk__niew : Array(String)? = nil, auth_psk__nisw : Array(String)? = nil, auth_psk__regex : Array(String)? = nil, auth_type : Array(String)? = nil, auth_type__empty : Bool? = nil, auth_type__ic : Array(String)? = nil, auth_type__ie : Array(String)? = nil, auth_type__iew : Array(String)? = nil, auth_type__iregex : Array(String)? = nil, auth_type__isw : Array(String)? = nil, auth_type__n : Array(String)? = nil, auth_type__nic : Array(String)? = nil, auth_type__nie : Array(String)? = nil, auth_type__niew : Array(String)? = nil, auth_type__nisw : Array(String)? = nil, auth_type__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(String)? = nil, group_id__n : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_id : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(String)? = nil, location_id__n : Array(String)? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, scope_id : Array(Int32)? = nil, scope_id__empty : Bool? = nil, scope_id__gt : Array(Int32)? = nil, scope_id__gte : Array(Int32)? = nil, scope_id__lt : Array(Int32)? = nil, scope_id__lte : Array(Int32)? = nil, scope_id__n : Array(Int32)? = nil, scope_type : String? = nil, scope_type__n : String? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, ssid : Array(String)? = nil, ssid__empty : Bool? = nil, ssid__ic : Array(String)? = nil, ssid__ie : Array(String)? = nil, ssid__iew : Array(String)? = nil, ssid__iregex : Array(String)? = nil, ssid__isw : Array(String)? = nil, ssid__n : Array(String)? = nil, ssid__nic : Array(String)? = nil, ssid__nie : Array(String)? = nil, ssid__niew : Array(String)? = nil, ssid__nisw : Array(String)? = nil, ssid__regex : Array(String)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, vlan_id : Array(Int32)? = nil, vlan_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedWirelessLANList)
      @conn.request(NetboxClient::PaginatedWirelessLANList,
        method: :GET,
        path: "/api/wireless/wireless-lans/",
        query: { "auth_cipher" => auth_cipher, "auth_cipher__empty" => auth_cipher__empty, "auth_cipher__ic" => auth_cipher__ic, "auth_cipher__ie" => auth_cipher__ie, "auth_cipher__iew" => auth_cipher__iew, "auth_cipher__iregex" => auth_cipher__iregex, "auth_cipher__isw" => auth_cipher__isw, "auth_cipher__n" => auth_cipher__n, "auth_cipher__nic" => auth_cipher__nic, "auth_cipher__nie" => auth_cipher__nie, "auth_cipher__niew" => auth_cipher__niew, "auth_cipher__nisw" => auth_cipher__nisw, "auth_cipher__regex" => auth_cipher__regex, "auth_psk" => auth_psk, "auth_psk__empty" => auth_psk__empty, "auth_psk__ic" => auth_psk__ic, "auth_psk__ie" => auth_psk__ie, "auth_psk__iew" => auth_psk__iew, "auth_psk__iregex" => auth_psk__iregex, "auth_psk__isw" => auth_psk__isw, "auth_psk__n" => auth_psk__n, "auth_psk__nic" => auth_psk__nic, "auth_psk__nie" => auth_psk__nie, "auth_psk__niew" => auth_psk__niew, "auth_psk__nisw" => auth_psk__nisw, "auth_psk__regex" => auth_psk__regex, "auth_type" => auth_type, "auth_type__empty" => auth_type__empty, "auth_type__ic" => auth_type__ic, "auth_type__ie" => auth_type__ie, "auth_type__iew" => auth_type__iew, "auth_type__iregex" => auth_type__iregex, "auth_type__isw" => auth_type__isw, "auth_type__n" => auth_type__n, "auth_type__nic" => auth_type__nic, "auth_type__nie" => auth_type__nie, "auth_type__niew" => auth_type__niew, "auth_type__nisw" => auth_type__nisw, "auth_type__regex" => auth_type__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_id" => interface_id, "interface_id__n" => interface_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "scope_id" => scope_id, "scope_id__empty" => scope_id__empty, "scope_id__gt" => scope_id__gt, "scope_id__gte" => scope_id__gte, "scope_id__lt" => scope_id__lt, "scope_id__lte" => scope_id__lte, "scope_id__n" => scope_id__n, "scope_type" => scope_type, "scope_type__n" => scope_type__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "ssid" => ssid, "ssid__empty" => ssid__empty, "ssid__ic" => ssid__ic, "ssid__ie" => ssid__ie, "ssid__iew" => ssid__iew, "ssid__iregex" => ssid__iregex, "ssid__isw" => ssid__isw, "ssid__n" => ssid__n, "ssid__nic" => ssid__nic, "ssid__nie" => ssid__nie, "ssid__niew" => ssid__niew, "ssid__nisw" => ssid__nisw, "ssid__regex" => ssid__regex, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "vlan_id" => vlan_id, "vlan_id__n" => vlan_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a wireless LAN object.
    def partial_update(id : Int32, patched_writable_wireless_lan_request : NetboxClient::PatchedWritableWirelessLANRequest? = nil) : Response(NetboxClient::WirelessLAN)
      @conn.request(NetboxClient::WirelessLAN,
        method: :PATCH,
        path: "/api/wireless/wireless-lans/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_wireless_lan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a wireless LAN object.
    def retrieve(id : Int32) : Response(NetboxClient::WirelessLAN)
      @conn.request(NetboxClient::WirelessLAN,
        method: :GET,
        path: "/api/wireless/wireless-lans/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a wireless LAN object.
    def update(id : Int32, writable_wireless_lan_request : NetboxClient::WritableWirelessLANRequest) : Response(NetboxClient::WirelessLAN)
      @conn.request(NetboxClient::WirelessLAN,
        method: :PUT,
        path: "/api/wireless/wireless-lans/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_wireless_lan_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
