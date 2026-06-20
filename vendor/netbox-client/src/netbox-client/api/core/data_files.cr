require "json"

module NetboxClient
  module Api
  class Core::DataFiles
    def initialize(@conn : Connection); end

    #  Get a list of data file objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, hash : Array(String)? = nil, hash__empty : Bool? = nil, hash__ic : Array(String)? = nil, hash__ie : Array(String)? = nil, hash__iew : Array(String)? = nil, hash__iregex : Array(String)? = nil, hash__isw : Array(String)? = nil, hash__n : Array(String)? = nil, hash__nic : Array(String)? = nil, hash__nie : Array(String)? = nil, hash__niew : Array(String)? = nil, hash__nisw : Array(String)? = nil, hash__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, path : Array(String)? = nil, path__empty : Bool? = nil, path__ic : Array(String)? = nil, path__ie : Array(String)? = nil, path__iew : Array(String)? = nil, path__iregex : Array(String)? = nil, path__isw : Array(String)? = nil, path__n : Array(String)? = nil, path__nic : Array(String)? = nil, path__nie : Array(String)? = nil, path__niew : Array(String)? = nil, path__nisw : Array(String)? = nil, path__regex : Array(String)? = nil, q : String? = nil, size : Array(Int32)? = nil, size__empty : Bool? = nil, size__gt : Array(Int32)? = nil, size__gte : Array(Int32)? = nil, size__lt : Array(Int32)? = nil, size__lte : Array(Int32)? = nil, size__n : Array(Int32)? = nil, source : Array(String)? = nil, source__n : Array(String)? = nil, source_id : Array(Int32)? = nil, source_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedDataFileList)
      @conn.request(NetboxClient::PaginatedDataFileList,
        method: :GET,
        path: "/api/core/data-files/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "hash" => hash, "hash__empty" => hash__empty, "hash__ic" => hash__ic, "hash__ie" => hash__ie, "hash__iew" => hash__iew, "hash__iregex" => hash__iregex, "hash__isw" => hash__isw, "hash__n" => hash__n, "hash__nic" => hash__nic, "hash__nie" => hash__nie, "hash__niew" => hash__niew, "hash__nisw" => hash__nisw, "hash__regex" => hash__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "path" => path, "path__empty" => path__empty, "path__ic" => path__ic, "path__ie" => path__ie, "path__iew" => path__iew, "path__iregex" => path__iregex, "path__isw" => path__isw, "path__n" => path__n, "path__nic" => path__nic, "path__nie" => path__nie, "path__niew" => path__niew, "path__nisw" => path__nisw, "path__regex" => path__regex, "q" => q, "size" => size, "size__empty" => size__empty, "size__gt" => size__gt, "size__gte" => size__gte, "size__lt" => size__lt, "size__lte" => size__lte, "size__n" => size__n, "source" => source, "source__n" => source__n, "source_id" => source_id, "source_id__n" => source_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a data file object.
    def retrieve(id : Int32) : Response(NetboxClient::DataFile)
      @conn.request(NetboxClient::DataFile,
        method: :GET,
        path: "/api/core/data-files/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
