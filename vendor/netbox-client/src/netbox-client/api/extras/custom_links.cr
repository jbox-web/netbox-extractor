require "json"

module NetboxClient
  module Api
  class Extras::CustomLinks
    def initialize(@conn : Connection); end

    #  Delete a list of custom link objects.
    def bulk_destroy(custom_link_request : Array(NetboxClient::CustomLinkRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/custom-links/",
        body: custom_link_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of custom link objects.
    def bulk_partial_update(custom_link_request : Array(NetboxClient::CustomLinkRequest)) : Response(Array(NetboxClient::CustomLink))
      @conn.request(Array(NetboxClient::CustomLink),
        method: :PATCH,
        path: "/api/extras/custom-links/",
        body: custom_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of custom link objects.
    def bulk_update(custom_link_request : Array(NetboxClient::CustomLinkRequest)) : Response(Array(NetboxClient::CustomLink))
      @conn.request(Array(NetboxClient::CustomLink),
        method: :PUT,
        path: "/api/extras/custom-links/",
        body: custom_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of custom link objects.
    def create(extras_custom_links_create_request : NetboxClient::ExtrasCustomLinksCreateRequest) : Response(NetboxClient::CustomLink)
      @conn.request(NetboxClient::CustomLink,
        method: :POST,
        path: "/api/extras/custom-links/",
        body: extras_custom_links_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a custom link object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/custom-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of custom link objects.
    def list(*, button_class : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, enabled : Bool? = nil, group_name : Array(String)? = nil, group_name__empty : Bool? = nil, group_name__ic : Array(String)? = nil, group_name__ie : Array(String)? = nil, group_name__iew : Array(String)? = nil, group_name__iregex : Array(String)? = nil, group_name__isw : Array(String)? = nil, group_name__n : Array(String)? = nil, group_name__nic : Array(String)? = nil, group_name__nie : Array(String)? = nil, group_name__niew : Array(String)? = nil, group_name__nisw : Array(String)? = nil, group_name__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, link_text : String? = nil, link_text__ic : String? = nil, link_text__ie : String? = nil, link_text__iew : String? = nil, link_text__iregex : String? = nil, link_text__isw : String? = nil, link_text__n : String? = nil, link_text__nic : String? = nil, link_text__nie : String? = nil, link_text__niew : String? = nil, link_text__nisw : String? = nil, link_text__regex : String? = nil, link_url : String? = nil, link_url__ic : String? = nil, link_url__ie : String? = nil, link_url__iew : String? = nil, link_url__iregex : String? = nil, link_url__isw : String? = nil, link_url__n : String? = nil, link_url__nic : String? = nil, link_url__nie : String? = nil, link_url__niew : String? = nil, link_url__nisw : String? = nil, link_url__regex : String? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, new_window : Bool? = nil, object_type : String? = nil, object_type__ic : String? = nil, object_type__ie : String? = nil, object_type__iew : String? = nil, object_type__iregex : String? = nil, object_type__isw : String? = nil, object_type__n : String? = nil, object_type__nic : String? = nil, object_type__nie : String? = nil, object_type__niew : String? = nil, object_type__nisw : String? = nil, object_type__regex : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, updated_by_request : String? = nil, weight : Array(Int32)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Int32)? = nil, weight__gte : Array(Int32)? = nil, weight__lt : Array(Int32)? = nil, weight__lte : Array(Int32)? = nil, weight__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedCustomLinkList)
      @conn.request(NetboxClient::PaginatedCustomLinkList,
        method: :GET,
        path: "/api/extras/custom-links/",
        query: { "button_class" => button_class, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "enabled" => enabled, "group_name" => group_name, "group_name__empty" => group_name__empty, "group_name__ic" => group_name__ic, "group_name__ie" => group_name__ie, "group_name__iew" => group_name__iew, "group_name__iregex" => group_name__iregex, "group_name__isw" => group_name__isw, "group_name__n" => group_name__n, "group_name__nic" => group_name__nic, "group_name__nie" => group_name__nie, "group_name__niew" => group_name__niew, "group_name__nisw" => group_name__nisw, "group_name__regex" => group_name__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "link_text" => link_text, "link_text__ic" => link_text__ic, "link_text__ie" => link_text__ie, "link_text__iew" => link_text__iew, "link_text__iregex" => link_text__iregex, "link_text__isw" => link_text__isw, "link_text__n" => link_text__n, "link_text__nic" => link_text__nic, "link_text__nie" => link_text__nie, "link_text__niew" => link_text__niew, "link_text__nisw" => link_text__nisw, "link_text__regex" => link_text__regex, "link_url" => link_url, "link_url__ic" => link_url__ic, "link_url__ie" => link_url__ie, "link_url__iew" => link_url__iew, "link_url__iregex" => link_url__iregex, "link_url__isw" => link_url__isw, "link_url__n" => link_url__n, "link_url__nic" => link_url__nic, "link_url__nie" => link_url__nie, "link_url__niew" => link_url__niew, "link_url__nisw" => link_url__nisw, "link_url__regex" => link_url__regex, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "new_window" => new_window, "object_type" => object_type, "object_type__ic" => object_type__ic, "object_type__ie" => object_type__ie, "object_type__iew" => object_type__iew, "object_type__iregex" => object_type__iregex, "object_type__isw" => object_type__isw, "object_type__n" => object_type__n, "object_type__nic" => object_type__nic, "object_type__nie" => object_type__nie, "object_type__niew" => object_type__niew, "object_type__nisw" => object_type__nisw, "object_type__regex" => object_type__regex, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "updated_by_request" => updated_by_request, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a custom link object.
    def partial_update(id : Int32, patched_custom_link_request : NetboxClient::PatchedCustomLinkRequest? = nil) : Response(NetboxClient::CustomLink)
      @conn.request(NetboxClient::CustomLink,
        method: :PATCH,
        path: "/api/extras/custom-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_custom_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a custom link object.
    def retrieve(id : Int32) : Response(NetboxClient::CustomLink)
      @conn.request(NetboxClient::CustomLink,
        method: :GET,
        path: "/api/extras/custom-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a custom link object.
    def update(id : Int32, custom_link_request : NetboxClient::CustomLinkRequest) : Response(NetboxClient::CustomLink)
      @conn.request(NetboxClient::CustomLink,
        method: :PUT,
        path: "/api/extras/custom-links/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: custom_link_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
