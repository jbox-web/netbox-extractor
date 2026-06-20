require "json"

module NetboxClient
  module Api
  class Extras::ConfigContextProfiles
    def initialize(@conn : Connection); end

    #  Delete a list of config context profile objects.
    def bulk_destroy(config_context_profile_request : Array(NetboxClient::ConfigContextProfileRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/config-context-profiles/",
        body: config_context_profile_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of config context profile objects.
    def bulk_partial_update(config_context_profile_request : Array(NetboxClient::ConfigContextProfileRequest)) : Response(Array(NetboxClient::ConfigContextProfile))
      @conn.request(Array(NetboxClient::ConfigContextProfile),
        method: :PATCH,
        path: "/api/extras/config-context-profiles/",
        body: config_context_profile_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of config context profile objects.
    def bulk_update(config_context_profile_request : Array(NetboxClient::ConfigContextProfileRequest)) : Response(Array(NetboxClient::ConfigContextProfile))
      @conn.request(Array(NetboxClient::ConfigContextProfile),
        method: :PUT,
        path: "/api/extras/config-context-profiles/",
        body: config_context_profile_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of config context profile objects.
    def create(extras_config_context_profiles_create_request : NetboxClient::ExtrasConfigContextProfilesCreateRequest) : Response(NetboxClient::ConfigContextProfile)
      @conn.request(NetboxClient::ConfigContextProfile,
        method: :POST,
        path: "/api/extras/config-context-profiles/",
        body: extras_config_context_profiles_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a config context profile object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/config-context-profiles/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of config context profile objects.
    def list(*, auto_sync_enabled : Bool? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, data_file_id : Array(Int32)? = nil, data_file_id__n : Array(Int32)? = nil, data_source_id : Array(Int32)? = nil, data_source_id__n : Array(Int32)? = nil, data_synced : Array(Time)? = nil, data_synced__empty : Bool? = nil, data_synced__gt : Array(Time)? = nil, data_synced__gte : Array(Time)? = nil, data_synced__lt : Array(Time)? = nil, data_synced__lte : Array(Time)? = nil, data_synced__n : Array(Time)? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedConfigContextProfileList)
      @conn.request(NetboxClient::PaginatedConfigContextProfileList,
        method: :GET,
        path: "/api/extras/config-context-profiles/",
        query: { "auto_sync_enabled" => auto_sync_enabled, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "data_file_id" => data_file_id, "data_file_id__n" => data_file_id__n, "data_source_id" => data_source_id, "data_source_id__n" => data_source_id__n, "data_synced" => data_synced, "data_synced__empty" => data_synced__empty, "data_synced__gt" => data_synced__gt, "data_synced__gte" => data_synced__gte, "data_synced__lt" => data_synced__lt, "data_synced__lte" => data_synced__lte, "data_synced__n" => data_synced__n, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a config context profile object.
    def partial_update(id : Int32, patched_config_context_profile_request : NetboxClient::PatchedConfigContextProfileRequest? = nil) : Response(NetboxClient::ConfigContextProfile)
      @conn.request(NetboxClient::ConfigContextProfile,
        method: :PATCH,
        path: "/api/extras/config-context-profiles/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_config_context_profile_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a config context profile object.
    def retrieve(id : Int32) : Response(NetboxClient::ConfigContextProfile)
      @conn.request(NetboxClient::ConfigContextProfile,
        method: :GET,
        path: "/api/extras/config-context-profiles/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Provide a /sync API endpoint to synchronize an object&#39;s data from its associated DataFile (if any).
    def sync_create(id : Int32, config_context_profile_request : NetboxClient::ConfigContextProfileRequest) : Response(NetboxClient::ConfigContextProfile)
      @conn.request(NetboxClient::ConfigContextProfile,
        method: :POST,
        path: "/api/extras/config-context-profiles/{id}/sync/".sub("{id}", NetboxClient.enc(id)),
        body: config_context_profile_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a config context profile object.
    def update(id : Int32, config_context_profile_request : NetboxClient::ConfigContextProfileRequest) : Response(NetboxClient::ConfigContextProfile)
      @conn.request(NetboxClient::ConfigContextProfile,
        method: :PUT,
        path: "/api/extras/config-context-profiles/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: config_context_profile_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
