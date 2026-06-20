require "json"

module NetboxClient
  module Api
  class Extras::ConfigContexts
    def initialize(@conn : Connection); end

    #  Delete a list of config context objects.
    def bulk_destroy(config_context_request : Array(NetboxClient::ConfigContextRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/config-contexts/",
        body: config_context_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of config context objects.
    def bulk_partial_update(config_context_request : Array(NetboxClient::ConfigContextRequest)) : Response(Array(NetboxClient::ConfigContext))
      @conn.request(Array(NetboxClient::ConfigContext),
        method: :PATCH,
        path: "/api/extras/config-contexts/",
        body: config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of config context objects.
    def bulk_update(config_context_request : Array(NetboxClient::ConfigContextRequest)) : Response(Array(NetboxClient::ConfigContext))
      @conn.request(Array(NetboxClient::ConfigContext),
        method: :PUT,
        path: "/api/extras/config-contexts/",
        body: config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of config context objects.
    def create(extras_config_contexts_create_request : NetboxClient::ExtrasConfigContextsCreateRequest) : Response(NetboxClient::ConfigContext)
      @conn.request(NetboxClient::ConfigContext,
        method: :POST,
        path: "/api/extras/config-contexts/",
        body: extras_config_contexts_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a config context object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/config-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of config context objects.
    def list(*, auto_sync_enabled : Bool? = nil, cluster_group : Array(String)? = nil, cluster_group__n : Array(String)? = nil, cluster_group_id : Array(Int32)? = nil, cluster_group_id__n : Array(Int32)? = nil, cluster_id : Array(Int32)? = nil, cluster_id__n : Array(Int32)? = nil, cluster_type : Array(String)? = nil, cluster_type__n : Array(String)? = nil, cluster_type_id : Array(Int32)? = nil, cluster_type_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, data_file_id : Array(Int32)? = nil, data_file_id__n : Array(Int32)? = nil, data_source_id : Array(Int32)? = nil, data_source_id__n : Array(Int32)? = nil, data_synced : Array(Time)? = nil, data_synced__empty : Bool? = nil, data_synced__gt : Array(Time)? = nil, data_synced__gte : Array(Time)? = nil, data_synced__lt : Array(Time)? = nil, data_synced__lte : Array(Time)? = nil, data_synced__n : Array(Time)? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device_role : Array(String)? = nil, device_role__n : Array(String)? = nil, device_role_id : Array(Int32)? = nil, device_role_id__n : Array(Int32)? = nil, device_type_id : Array(Int32)? = nil, device_type_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, is_active : Bool? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(Int32)? = nil, location_id__n : Array(Int32)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, platform : Array(String)? = nil, platform__n : Array(String)? = nil, platform_id : Array(Int32)? = nil, platform_id__n : Array(Int32)? = nil, profile : Array(String)? = nil, profile__n : Array(String)? = nil, profile_id : Array(Int32)? = nil, profile_id__n : Array(Int32)? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(Int32)? = nil, region_id__n : Array(Int32)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(Int32)? = nil, site_group_id__n : Array(Int32)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(Int32)? = nil, tag_id__n : Array(Int32)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(Int32)? = nil, tenant_group_id__n : Array(Int32)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil, weight : Array(Int32)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Int32)? = nil, weight__gte : Array(Int32)? = nil, weight__lt : Array(Int32)? = nil, weight__lte : Array(Int32)? = nil, weight__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedConfigContextList)
      @conn.request(NetboxClient::PaginatedConfigContextList,
        method: :GET,
        path: "/api/extras/config-contexts/",
        query: { "auto_sync_enabled" => auto_sync_enabled, "cluster_group" => cluster_group, "cluster_group__n" => cluster_group__n, "cluster_group_id" => cluster_group_id, "cluster_group_id__n" => cluster_group_id__n, "cluster_id" => cluster_id, "cluster_id__n" => cluster_id__n, "cluster_type" => cluster_type, "cluster_type__n" => cluster_type__n, "cluster_type_id" => cluster_type_id, "cluster_type_id__n" => cluster_type_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "data_file_id" => data_file_id, "data_file_id__n" => data_file_id__n, "data_source_id" => data_source_id, "data_source_id__n" => data_source_id__n, "data_synced" => data_synced, "data_synced__empty" => data_synced__empty, "data_synced__gt" => data_synced__gt, "data_synced__gte" => data_synced__gte, "data_synced__lt" => data_synced__lt, "data_synced__lte" => data_synced__lte, "data_synced__n" => data_synced__n, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device_role" => device_role, "device_role__n" => device_role__n, "device_role_id" => device_role_id, "device_role_id__n" => device_role_id__n, "device_type_id" => device_type_id, "device_type_id__n" => device_type_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "is_active" => is_active, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "platform" => platform, "platform__n" => platform__n, "platform_id" => platform_id, "platform_id__n" => platform_id__n, "profile" => profile, "profile__n" => profile__n, "profile_id" => profile_id, "profile_id__n" => profile_id__n, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a config context object.
    def partial_update(id : Int32, patched_config_context_request : NetboxClient::PatchedConfigContextRequest? = nil) : Response(NetboxClient::ConfigContext)
      @conn.request(NetboxClient::ConfigContext,
        method: :PATCH,
        path: "/api/extras/config-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a config context object.
    def retrieve(id : Int32) : Response(NetboxClient::ConfigContext)
      @conn.request(NetboxClient::ConfigContext,
        method: :GET,
        path: "/api/extras/config-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Provide a /sync API endpoint to synchronize an object&#39;s data from its associated DataFile (if any).
    def sync_create(id : Int32, config_context_request : NetboxClient::ConfigContextRequest) : Response(NetboxClient::ConfigContext)
      @conn.request(NetboxClient::ConfigContext,
        method: :POST,
        path: "/api/extras/config-contexts/{id}/sync/".sub("{id}", NetboxClient.enc(id)),
        body: config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a config context object.
    def update(id : Int32, config_context_request : NetboxClient::ConfigContextRequest) : Response(NetboxClient::ConfigContext)
      @conn.request(NetboxClient::ConfigContext,
        method: :PUT,
        path: "/api/extras/config-contexts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: config_context_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
