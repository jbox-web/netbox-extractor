require "json"

module NetboxClient
  module Api
  class Extras::TableConfigs
    def initialize(@conn : Connection); end

    #  Delete a list of table config objects.
    def bulk_destroy(table_config_request : Array(NetboxClient::TableConfigRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/table-configs/",
        body: table_config_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of table config objects.
    def bulk_partial_update(table_config_request : Array(NetboxClient::TableConfigRequest)) : Response(Array(NetboxClient::TableConfig))
      @conn.request(Array(NetboxClient::TableConfig),
        method: :PATCH,
        path: "/api/extras/table-configs/",
        body: table_config_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of table config objects.
    def bulk_update(table_config_request : Array(NetboxClient::TableConfigRequest)) : Response(Array(NetboxClient::TableConfig))
      @conn.request(Array(NetboxClient::TableConfig),
        method: :PUT,
        path: "/api/extras/table-configs/",
        body: table_config_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of table config objects.
    def create(extras_table_configs_create_request : NetboxClient::ExtrasTableConfigsCreateRequest) : Response(NetboxClient::TableConfig)
      @conn.request(NetboxClient::TableConfig,
        method: :POST,
        path: "/api/extras/table-configs/",
        body: extras_table_configs_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a table config object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/table-configs/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of table config objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, enabled : Bool? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, object_type : String? = nil, object_type__n : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, shared : Bool? = nil, table : Array(String)? = nil, table__empty : Bool? = nil, table__ic : Array(String)? = nil, table__ie : Array(String)? = nil, table__iew : Array(String)? = nil, table__iregex : Array(String)? = nil, table__isw : Array(String)? = nil, table__n : Array(String)? = nil, table__nic : Array(String)? = nil, table__nie : Array(String)? = nil, table__niew : Array(String)? = nil, table__nisw : Array(String)? = nil, table__regex : Array(String)? = nil, updated_by_request : String? = nil, usable : Bool? = nil, user : Array(String)? = nil, user__n : Array(String)? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil, weight : Array(Int32)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Int32)? = nil, weight__gte : Array(Int32)? = nil, weight__lt : Array(Int32)? = nil, weight__lte : Array(Int32)? = nil, weight__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedTableConfigList)
      @conn.request(NetboxClient::PaginatedTableConfigList,
        method: :GET,
        path: "/api/extras/table-configs/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "enabled" => enabled, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_type" => object_type, "object_type__n" => object_type__n, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "shared" => shared, "table" => table, "table__empty" => table__empty, "table__ic" => table__ic, "table__ie" => table__ie, "table__iew" => table__iew, "table__iregex" => table__iregex, "table__isw" => table__isw, "table__n" => table__n, "table__nic" => table__nic, "table__nie" => table__nie, "table__niew" => table__niew, "table__nisw" => table__nisw, "table__regex" => table__regex, "updated_by_request" => updated_by_request, "usable" => usable, "user" => user, "user__n" => user__n, "user_id" => user_id, "user_id__n" => user_id__n, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a table config object.
    def partial_update(id : Int32, patched_table_config_request : NetboxClient::PatchedTableConfigRequest? = nil) : Response(NetboxClient::TableConfig)
      @conn.request(NetboxClient::TableConfig,
        method: :PATCH,
        path: "/api/extras/table-configs/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_table_config_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a table config object.
    def retrieve(id : Int32) : Response(NetboxClient::TableConfig)
      @conn.request(NetboxClient::TableConfig,
        method: :GET,
        path: "/api/extras/table-configs/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a table config object.
    def update(id : Int32, table_config_request : NetboxClient::TableConfigRequest) : Response(NetboxClient::TableConfig)
      @conn.request(NetboxClient::TableConfig,
        method: :PUT,
        path: "/api/extras/table-configs/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: table_config_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
