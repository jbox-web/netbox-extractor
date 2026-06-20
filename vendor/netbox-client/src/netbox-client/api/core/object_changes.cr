require "json"

module NetboxClient
  module Api
  class Core::ObjectChanges
    def initialize(@conn : Connection); end

    #  Retrieve a list of recent changes.
    def list(*, action : String? = nil, changed_object_id : Array(Int32)? = nil, changed_object_id__empty : Bool? = nil, changed_object_id__gt : Array(Int32)? = nil, changed_object_id__gte : Array(Int32)? = nil, changed_object_id__lt : Array(Int32)? = nil, changed_object_id__lte : Array(Int32)? = nil, changed_object_id__n : Array(Int32)? = nil, changed_object_type : String? = nil, changed_object_type__n : String? = nil, changed_object_type_id : Array(Int32)? = nil, changed_object_type_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, limit : Int32? = nil, object_repr : Array(String)? = nil, object_repr__empty : Bool? = nil, object_repr__ic : Array(String)? = nil, object_repr__ie : Array(String)? = nil, object_repr__iew : Array(String)? = nil, object_repr__iregex : Array(String)? = nil, object_repr__isw : Array(String)? = nil, object_repr__n : Array(String)? = nil, object_repr__nic : Array(String)? = nil, object_repr__nie : Array(String)? = nil, object_repr__niew : Array(String)? = nil, object_repr__nisw : Array(String)? = nil, object_repr__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, related_object_id : Array(Int32)? = nil, related_object_id__empty : Bool? = nil, related_object_id__gt : Array(Int32)? = nil, related_object_id__gte : Array(Int32)? = nil, related_object_id__lt : Array(Int32)? = nil, related_object_id__lte : Array(Int32)? = nil, related_object_id__n : Array(Int32)? = nil, related_object_type : String? = nil, related_object_type__n : String? = nil, request_id : String? = nil, time_after : Time? = nil, time_before : Time? = nil, user : Array(String)? = nil, user__n : Array(String)? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil, user_name : Array(String)? = nil, user_name__empty : Bool? = nil, user_name__ic : Array(String)? = nil, user_name__ie : Array(String)? = nil, user_name__iew : Array(String)? = nil, user_name__iregex : Array(String)? = nil, user_name__isw : Array(String)? = nil, user_name__n : Array(String)? = nil, user_name__nic : Array(String)? = nil, user_name__nie : Array(String)? = nil, user_name__niew : Array(String)? = nil, user_name__nisw : Array(String)? = nil, user_name__regex : Array(String)? = nil) : Response(NetboxClient::PaginatedObjectChangeList)
      @conn.request(NetboxClient::PaginatedObjectChangeList,
        method: :GET,
        path: "/api/core/object-changes/",
        query: { "action" => action, "changed_object_id" => changed_object_id, "changed_object_id__empty" => changed_object_id__empty, "changed_object_id__gt" => changed_object_id__gt, "changed_object_id__gte" => changed_object_id__gte, "changed_object_id__lt" => changed_object_id__lt, "changed_object_id__lte" => changed_object_id__lte, "changed_object_id__n" => changed_object_id__n, "changed_object_type" => changed_object_type, "changed_object_type__n" => changed_object_type__n, "changed_object_type_id" => changed_object_type_id, "changed_object_type_id__n" => changed_object_type_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "limit" => limit, "object_repr" => object_repr, "object_repr__empty" => object_repr__empty, "object_repr__ic" => object_repr__ic, "object_repr__ie" => object_repr__ie, "object_repr__iew" => object_repr__iew, "object_repr__iregex" => object_repr__iregex, "object_repr__isw" => object_repr__isw, "object_repr__n" => object_repr__n, "object_repr__nic" => object_repr__nic, "object_repr__nie" => object_repr__nie, "object_repr__niew" => object_repr__niew, "object_repr__nisw" => object_repr__nisw, "object_repr__regex" => object_repr__regex, "offset" => offset, "ordering" => ordering, "q" => q, "related_object_id" => related_object_id, "related_object_id__empty" => related_object_id__empty, "related_object_id__gt" => related_object_id__gt, "related_object_id__gte" => related_object_id__gte, "related_object_id__lt" => related_object_id__lt, "related_object_id__lte" => related_object_id__lte, "related_object_id__n" => related_object_id__n, "related_object_type" => related_object_type, "related_object_type__n" => related_object_type__n, "request_id" => request_id, "time_after" => time_after, "time_before" => time_before, "user" => user, "user__n" => user__n, "user_id" => user_id, "user_id__n" => user_id__n, "user_name" => user_name, "user_name__empty" => user_name__empty, "user_name__ic" => user_name__ic, "user_name__ie" => user_name__ie, "user_name__iew" => user_name__iew, "user_name__iregex" => user_name__iregex, "user_name__isw" => user_name__isw, "user_name__n" => user_name__n, "user_name__nic" => user_name__nic, "user_name__nie" => user_name__nie, "user_name__niew" => user_name__niew, "user_name__nisw" => user_name__nisw, "user_name__regex" => user_name__regex },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of recent changes.
    def retrieve(id : Int32) : Response(NetboxClient::ObjectChange)
      @conn.request(NetboxClient::ObjectChange,
        method: :GET,
        path: "/api/core/object-changes/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
