require "json"

module NetboxClient
  module Api
  class Tenancy::ContactAssignments
    def initialize(@conn : Connection); end

    #  Delete a list of contact assignment objects.
    def bulk_destroy(contact_assignment_request : Array(NetboxClient::ContactAssignmentRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/tenancy/contact-assignments/",
        body: contact_assignment_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of contact assignment objects.
    def bulk_partial_update(contact_assignment_request : Array(NetboxClient::ContactAssignmentRequest)) : Response(Array(NetboxClient::ContactAssignment))
      @conn.request(Array(NetboxClient::ContactAssignment),
        method: :PATCH,
        path: "/api/tenancy/contact-assignments/",
        body: contact_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of contact assignment objects.
    def bulk_update(contact_assignment_request : Array(NetboxClient::ContactAssignmentRequest)) : Response(Array(NetboxClient::ContactAssignment))
      @conn.request(Array(NetboxClient::ContactAssignment),
        method: :PUT,
        path: "/api/tenancy/contact-assignments/",
        body: contact_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of contact assignment objects.
    def create(tenancy_contact_assignments_create_request : NetboxClient::TenancyContactAssignmentsCreateRequest) : Response(NetboxClient::ContactAssignment)
      @conn.request(NetboxClient::ContactAssignment,
        method: :POST,
        path: "/api/tenancy/contact-assignments/",
        body: tenancy_contact_assignments_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a contact assignment object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/tenancy/contact-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of contact assignment objects.
    def list(*, contact_id : Array(Int32)? = nil, contact_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(String)? = nil, group_id__n : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, _object_id : Array(Int32)? = nil, object_id__empty : Bool? = nil, object_id__gt : Array(Int32)? = nil, object_id__gte : Array(Int32)? = nil, object_id__lt : Array(Int32)? = nil, object_id__lte : Array(Int32)? = nil, object_id__n : Array(Int32)? = nil, object_type : String? = nil, object_type__n : String? = nil, object_type_id : Int32? = nil, object_type_id__n : Int32? = nil, offset : Int32? = nil, ordering : String? = nil, priority : String? = nil, q : String? = nil, role : Array(String)? = nil, role__n : Array(String)? = nil, role_id : Array(Int32)? = nil, role_id__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedContactAssignmentList)
      @conn.request(NetboxClient::PaginatedContactAssignmentList,
        method: :GET,
        path: "/api/tenancy/contact-assignments/",
        query: { "contact_id" => contact_id, "contact_id__n" => contact_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "object_id" => _object_id, "object_id__empty" => object_id__empty, "object_id__gt" => object_id__gt, "object_id__gte" => object_id__gte, "object_id__lt" => object_id__lt, "object_id__lte" => object_id__lte, "object_id__n" => object_id__n, "object_type" => object_type, "object_type__n" => object_type__n, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "priority" => priority, "q" => q, "role" => role, "role__n" => role__n, "role_id" => role_id, "role_id__n" => role_id__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a contact assignment object.
    def partial_update(id : Int32, patched_writable_contact_assignment_request : NetboxClient::PatchedWritableContactAssignmentRequest? = nil) : Response(NetboxClient::ContactAssignment)
      @conn.request(NetboxClient::ContactAssignment,
        method: :PATCH,
        path: "/api/tenancy/contact-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_contact_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a contact assignment object.
    def retrieve(id : Int32) : Response(NetboxClient::ContactAssignment)
      @conn.request(NetboxClient::ContactAssignment,
        method: :GET,
        path: "/api/tenancy/contact-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a contact assignment object.
    def update(id : Int32, writable_contact_assignment_request : NetboxClient::WritableContactAssignmentRequest) : Response(NetboxClient::ContactAssignment)
      @conn.request(NetboxClient::ContactAssignment,
        method: :PUT,
        path: "/api/tenancy/contact-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_contact_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
