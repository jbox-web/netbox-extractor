require "json"

module NetboxClient
  module Api
  class Extras::TaggedObjects
    def initialize(@conn : Connection); end

    #  Get a list of tagged item objects.
    def list(*, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, limit : Int32? = nil, _object_id : Array(Int32)? = nil, object_id__empty : Bool? = nil, object_id__gt : Array(Int32)? = nil, object_id__gte : Array(Int32)? = nil, object_id__lt : Array(Int32)? = nil, object_id__lte : Array(Int32)? = nil, object_id__n : Array(Int32)? = nil, object_type : String? = nil, object_type__n : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(Int32)? = nil, tag_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedTaggedItemList)
      @conn.request(NetboxClient::PaginatedTaggedItemList,
        method: :GET,
        path: "/api/extras/tagged-objects/",
        query: { "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "limit" => limit, "object_id" => _object_id, "object_id__empty" => object_id__empty, "object_id__gt" => object_id__gt, "object_id__gte" => object_id__gte, "object_id__lt" => object_id__lt, "object_id__lte" => object_id__lte, "object_id__n" => object_id__n, "object_type" => object_type, "object_type__n" => object_type__n, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a tagged item object.
    def retrieve(id : Int32) : Response(NetboxClient::TaggedItem)
      @conn.request(NetboxClient::TaggedItem,
        method: :GET,
        path: "/api/extras/tagged-objects/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
