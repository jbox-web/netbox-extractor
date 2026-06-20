require "json"

module NetboxClient
  module Api
  class Dcim::PowerFeeds
    def initialize(@conn : Connection); end

    #  Delete a list of power feed objects.
    def bulk_destroy(power_feed_request : Array(NetboxClient::PowerFeedRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/power-feeds/",
        body: power_feed_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of power feed objects.
    def bulk_partial_update(power_feed_request : Array(NetboxClient::PowerFeedRequest)) : Response(Array(NetboxClient::PowerFeed))
      @conn.request(Array(NetboxClient::PowerFeed),
        method: :PATCH,
        path: "/api/dcim/power-feeds/",
        body: power_feed_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of power feed objects.
    def bulk_update(power_feed_request : Array(NetboxClient::PowerFeedRequest)) : Response(Array(NetboxClient::PowerFeed))
      @conn.request(Array(NetboxClient::PowerFeed),
        method: :PUT,
        path: "/api/dcim/power-feeds/",
        body: power_feed_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of power feed objects.
    def create(dcim_power_feeds_create_request : NetboxClient::DcimPowerFeedsCreateRequest) : Response(NetboxClient::PowerFeed)
      @conn.request(NetboxClient::PowerFeed,
        method: :POST,
        path: "/api/dcim/power-feeds/",
        body: dcim_power_feeds_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a power feed object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/power-feeds/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of power feed objects.
    def list(*, amperage : Array(Int32)? = nil, amperage__empty : Bool? = nil, amperage__gt : Array(Int32)? = nil, amperage__gte : Array(Int32)? = nil, amperage__lt : Array(Int32)? = nil, amperage__lte : Array(Int32)? = nil, amperage__n : Array(Int32)? = nil, available_power : Array(Int32)? = nil, available_power__empty : Bool? = nil, available_power__gt : Array(Int32)? = nil, available_power__gte : Array(Int32)? = nil, available_power__lt : Array(Int32)? = nil, available_power__lte : Array(Int32)? = nil, available_power__n : Array(Int32)? = nil, cable_end : String? = nil, cable_id : Array(Int32)? = nil, cable_id__n : Array(Int32)? = nil, cabled : Bool? = nil, connected : Bool? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mark_connected : Bool? = nil, max_utilization : Array(Int32)? = nil, max_utilization__empty : Bool? = nil, max_utilization__gt : Array(Int32)? = nil, max_utilization__gte : Array(Int32)? = nil, max_utilization__lt : Array(Int32)? = nil, max_utilization__lte : Array(Int32)? = nil, max_utilization__n : Array(Int32)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, occupied : Bool? = nil, offset : Int32? = nil, ordering : String? = nil, phase : String? = nil, power_panel_id : Array(Int32)? = nil, power_panel_id__n : Array(Int32)? = nil, q : String? = nil, rack_id : Array(Int32)? = nil, rack_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, supply : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, _type : String? = nil, updated_by_request : String? = nil, voltage : Array(Int32)? = nil, voltage__empty : Bool? = nil, voltage__gt : Array(Int32)? = nil, voltage__gte : Array(Int32)? = nil, voltage__lt : Array(Int32)? = nil, voltage__lte : Array(Int32)? = nil, voltage__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedPowerFeedList)
      @conn.request(NetboxClient::PaginatedPowerFeedList,
        method: :GET,
        path: "/api/dcim/power-feeds/",
        query: { "amperage" => amperage, "amperage__empty" => amperage__empty, "amperage__gt" => amperage__gt, "amperage__gte" => amperage__gte, "amperage__lt" => amperage__lt, "amperage__lte" => amperage__lte, "amperage__n" => amperage__n, "available_power" => available_power, "available_power__empty" => available_power__empty, "available_power__gt" => available_power__gt, "available_power__gte" => available_power__gte, "available_power__lt" => available_power__lt, "available_power__lte" => available_power__lte, "available_power__n" => available_power__n, "cable_end" => cable_end, "cable_id" => cable_id, "cable_id__n" => cable_id__n, "cabled" => cabled, "connected" => connected, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mark_connected" => mark_connected, "max_utilization" => max_utilization, "max_utilization__empty" => max_utilization__empty, "max_utilization__gt" => max_utilization__gt, "max_utilization__gte" => max_utilization__gte, "max_utilization__lt" => max_utilization__lt, "max_utilization__lte" => max_utilization__lte, "max_utilization__n" => max_utilization__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "occupied" => occupied, "offset" => offset, "ordering" => ordering, "phase" => phase, "power_panel_id" => power_panel_id, "power_panel_id__n" => power_panel_id__n, "q" => q, "rack_id" => rack_id, "rack_id__n" => rack_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "supply" => supply, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "type" => _type, "updated_by_request" => updated_by_request, "voltage" => voltage, "voltage__empty" => voltage__empty, "voltage__gt" => voltage__gt, "voltage__gte" => voltage__gte, "voltage__lt" => voltage__lt, "voltage__lte" => voltage__lte, "voltage__n" => voltage__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a power feed object.
    def partial_update(id : Int32, patched_writable_power_feed_request : NetboxClient::PatchedWritablePowerFeedRequest? = nil) : Response(NetboxClient::PowerFeed)
      @conn.request(NetboxClient::PowerFeed,
        method: :PATCH,
        path: "/api/dcim/power-feeds/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_power_feed_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a power feed object.
    def retrieve(id : Int32) : Response(NetboxClient::PowerFeed)
      @conn.request(NetboxClient::PowerFeed,
        method: :GET,
        path: "/api/dcim/power-feeds/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Trace a complete cable path and return each segment as a three-tuple of (termination, cable, termination).
    def trace_retrieve(id : Int32) : Response(NetboxClient::PowerFeed)
      @conn.request(NetboxClient::PowerFeed,
        method: :GET,
        path: "/api/dcim/power-feeds/{id}/trace/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a power feed object.
    def update(id : Int32, writable_power_feed_request : NetboxClient::WritablePowerFeedRequest) : Response(NetboxClient::PowerFeed)
      @conn.request(NetboxClient::PowerFeed,
        method: :PUT,
        path: "/api/dcim/power-feeds/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_power_feed_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
