require "json"

module NetboxClient
  module Api
  class Extras::ObjectTypes
    def initialize(@conn : Connection); end

    #  Read-only list of ObjectTypes.
    def list(*, app_label : Array(String)? = nil, app_label__empty : Bool? = nil, app_label__ic : Array(String)? = nil, app_label__ie : Array(String)? = nil, app_label__iew : Array(String)? = nil, app_label__iregex : Array(String)? = nil, app_label__isw : Array(String)? = nil, app_label__n : Array(String)? = nil, app_label__nic : Array(String)? = nil, app_label__nie : Array(String)? = nil, app_label__niew : Array(String)? = nil, app_label__nisw : Array(String)? = nil, app_label__regex : Array(String)? = nil, features : String? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, limit : Int32? = nil, model : Array(String)? = nil, model__empty : Bool? = nil, model__ic : Array(String)? = nil, model__ie : Array(String)? = nil, model__iew : Array(String)? = nil, model__iregex : Array(String)? = nil, model__isw : Array(String)? = nil, model__n : Array(String)? = nil, model__nic : Array(String)? = nil, model__nie : Array(String)? = nil, model__niew : Array(String)? = nil, model__nisw : Array(String)? = nil, model__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, public : Bool? = nil, q : String? = nil) : Response(NetboxClient::PaginatedObjectTypeList)
      @conn.request(NetboxClient::PaginatedObjectTypeList,
        method: :GET,
        path: "/api/extras/object-types/",
        query: { "app_label" => app_label, "app_label__empty" => app_label__empty, "app_label__ic" => app_label__ic, "app_label__ie" => app_label__ie, "app_label__iew" => app_label__iew, "app_label__iregex" => app_label__iregex, "app_label__isw" => app_label__isw, "app_label__n" => app_label__n, "app_label__nic" => app_label__nic, "app_label__nie" => app_label__nie, "app_label__niew" => app_label__niew, "app_label__nisw" => app_label__nisw, "app_label__regex" => app_label__regex, "features" => features, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "limit" => limit, "model" => model, "model__empty" => model__empty, "model__ic" => model__ic, "model__ie" => model__ie, "model__iew" => model__iew, "model__iregex" => model__iregex, "model__isw" => model__isw, "model__n" => model__n, "model__nic" => model__nic, "model__nie" => model__nie, "model__niew" => model__niew, "model__nisw" => model__nisw, "model__regex" => model__regex, "offset" => offset, "ordering" => ordering, "public" => public, "q" => q },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Read-only list of ObjectTypes.
    def retrieve(id : Int32) : Response(NetboxClient::ObjectType)
      @conn.request(NetboxClient::ObjectType,
        method: :GET,
        path: "/api/extras/object-types/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
