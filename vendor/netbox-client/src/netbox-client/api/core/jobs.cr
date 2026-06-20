require "json"

module NetboxClient
  module Api
  class Core::Jobs
    def initialize(@conn : Connection); end

    #  Retrieve a list of job results
    def list(*, completed : Time? = nil, completed__after : Time? = nil, completed__before : Time? = nil, created : Time? = nil, created__after : Time? = nil, created__before : Time? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interval : Array(Int32)? = nil, interval__empty : Bool? = nil, interval__gt : Array(Int32)? = nil, interval__gte : Array(Int32)? = nil, interval__lt : Array(Int32)? = nil, interval__lte : Array(Int32)? = nil, interval__n : Array(Int32)? = nil, job_id : String? = nil, limit : Int32? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, _object_id : Array(Int32)? = nil, object_id__empty : Bool? = nil, object_id__gt : Array(Int32)? = nil, object_id__gte : Array(Int32)? = nil, object_id__lt : Array(Int32)? = nil, object_id__lte : Array(Int32)? = nil, object_id__n : Array(Int32)? = nil, object_type : String? = nil, object_type__n : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, scheduled : Time? = nil, scheduled__after : Time? = nil, scheduled__before : Time? = nil, started : Time? = nil, started__after : Time? = nil, started__before : Time? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, user : Int32? = nil, user__n : Int32? = nil) : Response(NetboxClient::PaginatedJobList)
      @conn.request(NetboxClient::PaginatedJobList,
        method: :GET,
        path: "/api/core/jobs/",
        query: { "completed" => completed, "completed__after" => completed__after, "completed__before" => completed__before, "created" => created, "created__after" => created__after, "created__before" => created__before, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interval" => interval, "interval__empty" => interval__empty, "interval__gt" => interval__gt, "interval__gte" => interval__gte, "interval__lt" => interval__lt, "interval__lte" => interval__lte, "interval__n" => interval__n, "job_id" => job_id, "limit" => limit, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_id" => _object_id, "object_id__empty" => object_id__empty, "object_id__gt" => object_id__gt, "object_id__gte" => object_id__gte, "object_id__lt" => object_id__lt, "object_id__lte" => object_id__lte, "object_id__n" => object_id__n, "object_type" => object_type, "object_type__n" => object_type__n, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "scheduled" => scheduled, "scheduled__after" => scheduled__after, "scheduled__before" => scheduled__before, "started" => started, "started__after" => started__after, "started__before" => started__before, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "user" => user, "user__n" => user__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of job results
    def retrieve(id : Int32) : Response(NetboxClient::Job)
      @conn.request(NetboxClient::Job,
        method: :GET,
        path: "/api/core/jobs/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
