require "json"

module NetboxClient
  module Api
  class Extras::ImageAttachments
    def initialize(@conn : Connection); end

    #  Delete a list of image attachment objects.
    def bulk_destroy(image_attachment_request : Array(NetboxClient::ImageAttachmentRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/image-attachments/",
        body: image_attachment_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of image attachment objects.
    def bulk_partial_update(image_attachment_request : Array(NetboxClient::ImageAttachmentRequest)) : Response(Array(NetboxClient::ImageAttachment))
      @conn.request(Array(NetboxClient::ImageAttachment),
        method: :PATCH,
        path: "/api/extras/image-attachments/",
        body: image_attachment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of image attachment objects.
    def bulk_update(image_attachment_request : Array(NetboxClient::ImageAttachmentRequest)) : Response(Array(NetboxClient::ImageAttachment))
      @conn.request(Array(NetboxClient::ImageAttachment),
        method: :PUT,
        path: "/api/extras/image-attachments/",
        body: image_attachment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of image attachment objects.
    def create(extras_image_attachments_create_request : NetboxClient::ExtrasImageAttachmentsCreateRequest) : Response(NetboxClient::ImageAttachment)
      @conn.request(NetboxClient::ImageAttachment,
        method: :POST,
        path: "/api/extras/image-attachments/",
        body: extras_image_attachments_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a image attachment object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/image-attachments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of image attachment objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, image_height : Array(Int32)? = nil, image_height__empty : Bool? = nil, image_height__gt : Array(Int32)? = nil, image_height__gte : Array(Int32)? = nil, image_height__lt : Array(Int32)? = nil, image_height__lte : Array(Int32)? = nil, image_height__n : Array(Int32)? = nil, image_width : Array(Int32)? = nil, image_width__empty : Bool? = nil, image_width__gt : Array(Int32)? = nil, image_width__gte : Array(Int32)? = nil, image_width__lt : Array(Int32)? = nil, image_width__lte : Array(Int32)? = nil, image_width__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, _object_id : Array(Int32)? = nil, object_id__empty : Bool? = nil, object_id__gt : Array(Int32)? = nil, object_id__gte : Array(Int32)? = nil, object_id__lt : Array(Int32)? = nil, object_id__lte : Array(Int32)? = nil, object_id__n : Array(Int32)? = nil, object_type : String? = nil, object_type__n : String? = nil, object_type_id : Int32? = nil, object_type_id__n : Int32? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedImageAttachmentList)
      @conn.request(NetboxClient::PaginatedImageAttachmentList,
        method: :GET,
        path: "/api/extras/image-attachments/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "image_height" => image_height, "image_height__empty" => image_height__empty, "image_height__gt" => image_height__gt, "image_height__gte" => image_height__gte, "image_height__lt" => image_height__lt, "image_height__lte" => image_height__lte, "image_height__n" => image_height__n, "image_width" => image_width, "image_width__empty" => image_width__empty, "image_width__gt" => image_width__gt, "image_width__gte" => image_width__gte, "image_width__lt" => image_width__lt, "image_width__lte" => image_width__lte, "image_width__n" => image_width__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_id" => _object_id, "object_id__empty" => object_id__empty, "object_id__gt" => object_id__gt, "object_id__gte" => object_id__gte, "object_id__lt" => object_id__lt, "object_id__lte" => object_id__lte, "object_id__n" => object_id__n, "object_type" => object_type, "object_type__n" => object_type__n, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a image attachment object.
    def partial_update(id : Int32, patched_image_attachment_request : NetboxClient::PatchedImageAttachmentRequest? = nil) : Response(NetboxClient::ImageAttachment)
      @conn.request(NetboxClient::ImageAttachment,
        method: :PATCH,
        path: "/api/extras/image-attachments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_image_attachment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a image attachment object.
    def retrieve(id : Int32) : Response(NetboxClient::ImageAttachment)
      @conn.request(NetboxClient::ImageAttachment,
        method: :GET,
        path: "/api/extras/image-attachments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a image attachment object.
    def update(id : Int32, image_attachment_request : NetboxClient::ImageAttachmentRequest) : Response(NetboxClient::ImageAttachment)
      @conn.request(NetboxClient::ImageAttachment,
        method: :PUT,
        path: "/api/extras/image-attachments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: image_attachment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
