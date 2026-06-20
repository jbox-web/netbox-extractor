require "json"

module NetboxClient
  module Api
  class Dcim::CableTerminations
    def initialize(@conn : Connection); end

    #  Delete a list of cable termination objects.
    def bulk_destroy(cable_termination_request : Array(NetboxClient::CableTerminationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/cable-terminations/",
        body: cable_termination_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of cable termination objects.
    def bulk_partial_update(cable_termination_request : Array(NetboxClient::CableTerminationRequest)) : Response(Array(NetboxClient::CableTermination))
      @conn.request(Array(NetboxClient::CableTermination),
        method: :PATCH,
        path: "/api/dcim/cable-terminations/",
        body: cable_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of cable termination objects.
    def bulk_update(cable_termination_request : Array(NetboxClient::CableTerminationRequest)) : Response(Array(NetboxClient::CableTermination))
      @conn.request(Array(NetboxClient::CableTermination),
        method: :PUT,
        path: "/api/dcim/cable-terminations/",
        body: cable_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of cable termination objects.
    def create(dcim_cable_terminations_create_request : NetboxClient::DcimCableTerminationsCreateRequest) : Response(NetboxClient::CableTermination)
      @conn.request(NetboxClient::CableTermination,
        method: :POST,
        path: "/api/dcim/cable-terminations/",
        body: dcim_cable_terminations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a cable termination object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/cable-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of cable termination objects.
    def list(*, cable : Int32? = nil, cable__n : Int32? = nil, cable_end : String? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, termination_id : Array(Int32)? = nil, termination_id__empty : Bool? = nil, termination_id__gt : Array(Int32)? = nil, termination_id__gte : Array(Int32)? = nil, termination_id__lt : Array(Int32)? = nil, termination_id__lte : Array(Int32)? = nil, termination_id__n : Array(Int32)? = nil, termination_type : String? = nil, termination_type__n : String? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedCableTerminationList)
      @conn.request(NetboxClient::PaginatedCableTerminationList,
        method: :GET,
        path: "/api/dcim/cable-terminations/",
        query: { "cable" => cable, "cable__n" => cable__n, "cable_end" => cable_end, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "termination_id" => termination_id, "termination_id__empty" => termination_id__empty, "termination_id__gt" => termination_id__gt, "termination_id__gte" => termination_id__gte, "termination_id__lt" => termination_id__lt, "termination_id__lte" => termination_id__lte, "termination_id__n" => termination_id__n, "termination_type" => termination_type, "termination_type__n" => termination_type__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a cable termination object.
    def partial_update(id : Int32, patched_cable_termination_request : NetboxClient::PatchedCableTerminationRequest? = nil) : Response(NetboxClient::CableTermination)
      @conn.request(NetboxClient::CableTermination,
        method: :PATCH,
        path: "/api/dcim/cable-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_cable_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a cable termination object.
    def retrieve(id : Int32) : Response(NetboxClient::CableTermination)
      @conn.request(NetboxClient::CableTermination,
        method: :GET,
        path: "/api/dcim/cable-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a cable termination object.
    def update(id : Int32, cable_termination_request : NetboxClient::CableTerminationRequest) : Response(NetboxClient::CableTermination)
      @conn.request(NetboxClient::CableTermination,
        method: :PUT,
        path: "/api/dcim/cable-terminations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: cable_termination_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
