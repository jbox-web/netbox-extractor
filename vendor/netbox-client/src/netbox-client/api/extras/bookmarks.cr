require "json"

module NetboxClient
  module Api
  class Extras::Bookmarks
    def initialize(@conn : Connection); end

    #  Delete a list of bookmark objects.
    def bulk_destroy(bookmark_request : Array(NetboxClient::BookmarkRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/bookmarks/",
        body: bookmark_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of bookmark objects.
    def bulk_partial_update(bookmark_request : Array(NetboxClient::BookmarkRequest)) : Response(Array(NetboxClient::Bookmark))
      @conn.request(Array(NetboxClient::Bookmark),
        method: :PATCH,
        path: "/api/extras/bookmarks/",
        body: bookmark_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of bookmark objects.
    def bulk_update(bookmark_request : Array(NetboxClient::BookmarkRequest)) : Response(Array(NetboxClient::Bookmark))
      @conn.request(Array(NetboxClient::Bookmark),
        method: :PUT,
        path: "/api/extras/bookmarks/",
        body: bookmark_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of bookmark objects.
    def create(extras_bookmarks_create_request : NetboxClient::ExtrasBookmarksCreateRequest) : Response(NetboxClient::Bookmark)
      @conn.request(NetboxClient::Bookmark,
        method: :POST,
        path: "/api/extras/bookmarks/",
        body: extras_bookmarks_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a bookmark object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/bookmarks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of bookmark objects.
    def list(*, created : Time? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, limit : Int32? = nil, _object_id : Array(Int32)? = nil, object_id__empty : Bool? = nil, object_id__gt : Array(Int32)? = nil, object_id__gte : Array(Int32)? = nil, object_id__lt : Array(Int32)? = nil, object_id__lte : Array(Int32)? = nil, object_id__n : Array(Int32)? = nil, object_type : String? = nil, object_type__n : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__empty : Array(Int32)? = nil, object_type_id__gt : Array(Int32)? = nil, object_type_id__gte : Array(Int32)? = nil, object_type_id__lt : Array(Int32)? = nil, object_type_id__lte : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, user : Array(String)? = nil, user__n : Array(String)? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedBookmarkList)
      @conn.request(NetboxClient::PaginatedBookmarkList,
        method: :GET,
        path: "/api/extras/bookmarks/",
        query: { "created" => created, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "limit" => limit, "object_id" => _object_id, "object_id__empty" => object_id__empty, "object_id__gt" => object_id__gt, "object_id__gte" => object_id__gte, "object_id__lt" => object_id__lt, "object_id__lte" => object_id__lte, "object_id__n" => object_id__n, "object_type" => object_type, "object_type__n" => object_type__n, "object_type_id" => object_type_id, "object_type_id__empty" => object_type_id__empty, "object_type_id__gt" => object_type_id__gt, "object_type_id__gte" => object_type_id__gte, "object_type_id__lt" => object_type_id__lt, "object_type_id__lte" => object_type_id__lte, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "user" => user, "user__n" => user__n, "user_id" => user_id, "user_id__n" => user_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a bookmark object.
    def partial_update(id : Int32, patched_bookmark_request : NetboxClient::PatchedBookmarkRequest? = nil) : Response(NetboxClient::Bookmark)
      @conn.request(NetboxClient::Bookmark,
        method: :PATCH,
        path: "/api/extras/bookmarks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_bookmark_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a bookmark object.
    def retrieve(id : Int32) : Response(NetboxClient::Bookmark)
      @conn.request(NetboxClient::Bookmark,
        method: :GET,
        path: "/api/extras/bookmarks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a bookmark object.
    def update(id : Int32, bookmark_request : NetboxClient::BookmarkRequest) : Response(NetboxClient::Bookmark)
      @conn.request(NetboxClient::Bookmark,
        method: :PUT,
        path: "/api/extras/bookmarks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: bookmark_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
