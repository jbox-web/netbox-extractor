require "json"

module NetboxClient
  module Api
  class Core::DataSources
    def initialize(@conn : Connection); end

    #  Delete a list of data source objects.
    def bulk_destroy(data_source_request : Array(NetboxClient::DataSourceRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/core/data-sources/",
        body: data_source_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of data source objects.
    def bulk_partial_update(data_source_request : Array(NetboxClient::DataSourceRequest)) : Response(Array(NetboxClient::DataSource))
      @conn.request(Array(NetboxClient::DataSource),
        method: :PATCH,
        path: "/api/core/data-sources/",
        body: data_source_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of data source objects.
    def bulk_update(data_source_request : Array(NetboxClient::DataSourceRequest)) : Response(Array(NetboxClient::DataSource))
      @conn.request(Array(NetboxClient::DataSource),
        method: :PUT,
        path: "/api/core/data-sources/",
        body: data_source_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of data source objects.
    def create(core_data_sources_create_request : NetboxClient::CoreDataSourcesCreateRequest) : Response(NetboxClient::DataSource)
      @conn.request(NetboxClient::DataSource,
        method: :POST,
        path: "/api/core/data-sources/",
        body: core_data_sources_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a data source object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/core/data-sources/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of data source objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, enabled : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_synced : Array(Time)? = nil, last_synced__empty : Bool? = nil, last_synced__gt : Array(Time)? = nil, last_synced__gte : Array(Time)? = nil, last_synced__lt : Array(Time)? = nil, last_synced__lte : Array(Time)? = nil, last_synced__n : Array(Time)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, source_url : Array(String)? = nil, source_url__empty : Bool? = nil, source_url__ic : Array(String)? = nil, source_url__ie : Array(String)? = nil, source_url__iew : Array(String)? = nil, source_url__iregex : Array(String)? = nil, source_url__isw : Array(String)? = nil, source_url__n : Array(String)? = nil, source_url__nic : Array(String)? = nil, source_url__nie : Array(String)? = nil, source_url__niew : Array(String)? = nil, source_url__nisw : Array(String)? = nil, source_url__regex : Array(String)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, sync_interval : Array(Int32)? = nil, sync_interval__ic : Array(Int32)? = nil, sync_interval__ie : Array(Int32)? = nil, sync_interval__iew : Array(Int32)? = nil, sync_interval__iregex : Array(Int32)? = nil, sync_interval__isw : Array(Int32)? = nil, sync_interval__n : Array(Int32)? = nil, sync_interval__nic : Array(Int32)? = nil, sync_interval__nie : Array(Int32)? = nil, sync_interval__niew : Array(Int32)? = nil, sync_interval__nisw : Array(Int32)? = nil, sync_interval__regex : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, _type : Array(String)? = nil, type__empty : Bool? = nil, type__ic : Array(String)? = nil, type__ie : Array(String)? = nil, type__iew : Array(String)? = nil, type__iregex : Array(String)? = nil, type__isw : Array(String)? = nil, type__n : Array(String)? = nil, type__nic : Array(String)? = nil, type__nie : Array(String)? = nil, type__niew : Array(String)? = nil, type__nisw : Array(String)? = nil, type__regex : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedDataSourceList)
      @conn.request(NetboxClient::PaginatedDataSourceList,
        method: :GET,
        path: "/api/core/data-sources/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "enabled" => enabled, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_synced" => last_synced, "last_synced__empty" => last_synced__empty, "last_synced__gt" => last_synced__gt, "last_synced__gte" => last_synced__gte, "last_synced__lt" => last_synced__lt, "last_synced__lte" => last_synced__lte, "last_synced__n" => last_synced__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "source_url" => source_url, "source_url__empty" => source_url__empty, "source_url__ic" => source_url__ic, "source_url__ie" => source_url__ie, "source_url__iew" => source_url__iew, "source_url__iregex" => source_url__iregex, "source_url__isw" => source_url__isw, "source_url__n" => source_url__n, "source_url__nic" => source_url__nic, "source_url__nie" => source_url__nie, "source_url__niew" => source_url__niew, "source_url__nisw" => source_url__nisw, "source_url__regex" => source_url__regex, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "sync_interval" => sync_interval, "sync_interval__ic" => sync_interval__ic, "sync_interval__ie" => sync_interval__ie, "sync_interval__iew" => sync_interval__iew, "sync_interval__iregex" => sync_interval__iregex, "sync_interval__isw" => sync_interval__isw, "sync_interval__n" => sync_interval__n, "sync_interval__nic" => sync_interval__nic, "sync_interval__nie" => sync_interval__nie, "sync_interval__niew" => sync_interval__niew, "sync_interval__nisw" => sync_interval__nisw, "sync_interval__regex" => sync_interval__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "type" => _type, "type__empty" => type__empty, "type__ic" => type__ic, "type__ie" => type__ie, "type__iew" => type__iew, "type__iregex" => type__iregex, "type__isw" => type__isw, "type__n" => type__n, "type__nic" => type__nic, "type__nie" => type__nie, "type__niew" => type__niew, "type__nisw" => type__nisw, "type__regex" => type__regex, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a data source object.
    def partial_update(id : Int32, patched_writable_data_source_request : NetboxClient::PatchedWritableDataSourceRequest? = nil) : Response(NetboxClient::DataSource)
      @conn.request(NetboxClient::DataSource,
        method: :PATCH,
        path: "/api/core/data-sources/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_data_source_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a data source object.
    def retrieve(id : Int32) : Response(NetboxClient::DataSource)
      @conn.request(NetboxClient::DataSource,
        method: :GET,
        path: "/api/core/data-sources/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Enqueue a job to synchronize the DataSource.
    def sync_create(id : Int32, writable_data_source_request : NetboxClient::WritableDataSourceRequest) : Response(NetboxClient::DataSource)
      @conn.request(NetboxClient::DataSource,
        method: :POST,
        path: "/api/core/data-sources/{id}/sync/".sub("{id}", NetboxClient.enc(id)),
        body: writable_data_source_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a data source object.
    def update(id : Int32, writable_data_source_request : NetboxClient::WritableDataSourceRequest) : Response(NetboxClient::DataSource)
      @conn.request(NetboxClient::DataSource,
        method: :PUT,
        path: "/api/core/data-sources/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_data_source_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
