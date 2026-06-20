require "json"

module NetboxClient
  module Api
  class Extras::Tags
    def initialize(@conn : Connection); end

    #  Delete a list of tag objects.
    def bulk_destroy(tag_request : Array(NetboxClient::TagRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/tags/",
        body: tag_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of tag objects.
    def bulk_partial_update(tag_request : Array(NetboxClient::TagRequest)) : Response(Array(NetboxClient::Tag))
      @conn.request(Array(NetboxClient::Tag),
        method: :PATCH,
        path: "/api/extras/tags/",
        body: tag_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of tag objects.
    def bulk_update(tag_request : Array(NetboxClient::TagRequest)) : Response(Array(NetboxClient::Tag))
      @conn.request(Array(NetboxClient::Tag),
        method: :PUT,
        path: "/api/extras/tags/",
        body: tag_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of tag objects.
    def create(extras_tags_create_request : NetboxClient::ExtrasTagsCreateRequest) : Response(NetboxClient::Tag)
      @conn.request(NetboxClient::Tag,
        method: :POST,
        path: "/api/extras/tags/",
        body: extras_tags_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a tag object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/tags/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of tag objects.
    def list(*, color : Array(String)? = nil, color__empty : Bool? = nil, color__ic : Array(String)? = nil, color__ie : Array(String)? = nil, color__iew : Array(String)? = nil, color__iregex : Array(String)? = nil, color__isw : Array(String)? = nil, color__n : Array(String)? = nil, color__nic : Array(String)? = nil, color__nie : Array(String)? = nil, color__niew : Array(String)? = nil, color__nisw : Array(String)? = nil, color__regex : Array(String)? = nil, content_type : Array(String)? = nil, content_type_id : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, for_object_type_id : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, object_types : Array(Int32)? = nil, object_types__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, updated_by_request : String? = nil, weight : Array(Int32)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Int32)? = nil, weight__gte : Array(Int32)? = nil, weight__lt : Array(Int32)? = nil, weight__lte : Array(Int32)? = nil, weight__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedTagList)
      @conn.request(NetboxClient::PaginatedTagList,
        method: :GET,
        path: "/api/extras/tags/",
        query: { "color" => color, "color__empty" => color__empty, "color__ic" => color__ic, "color__ie" => color__ie, "color__iew" => color__iew, "color__iregex" => color__iregex, "color__isw" => color__isw, "color__n" => color__n, "color__nic" => color__nic, "color__nie" => color__nie, "color__niew" => color__niew, "color__nisw" => color__nisw, "color__regex" => color__regex, "content_type" => content_type, "content_type_id" => content_type_id, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "for_object_type_id" => for_object_type_id, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_types" => object_types, "object_types__n" => object_types__n, "offset" => offset, "ordering" => ordering, "q" => q, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "updated_by_request" => updated_by_request, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a tag object.
    def partial_update(id : Int32, patched_tag_request : NetboxClient::PatchedTagRequest? = nil) : Response(NetboxClient::Tag)
      @conn.request(NetboxClient::Tag,
        method: :PATCH,
        path: "/api/extras/tags/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_tag_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a tag object.
    def retrieve(id : Int32) : Response(NetboxClient::Tag)
      @conn.request(NetboxClient::Tag,
        method: :GET,
        path: "/api/extras/tags/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a tag object.
    def update(id : Int32, tag_request : NetboxClient::TagRequest) : Response(NetboxClient::Tag)
      @conn.request(NetboxClient::Tag,
        method: :PUT,
        path: "/api/extras/tags/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: tag_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
