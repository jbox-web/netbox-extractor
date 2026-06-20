require "json"

module NetboxClient
  module Api
  class Circuits::CircuitGroupAssignments
    def initialize(@conn : Connection); end

    #  Delete a list of Circuit group assignment objects.
    def bulk_destroy(circuit_group_assignment_request : Array(NetboxClient::CircuitGroupAssignmentRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/circuit-group-assignments/",
        body: circuit_group_assignment_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of Circuit group assignment objects.
    def bulk_partial_update(circuit_group_assignment_request : Array(NetboxClient::CircuitGroupAssignmentRequest)) : Response(Array(NetboxClient::CircuitGroupAssignment))
      @conn.request(Array(NetboxClient::CircuitGroupAssignment),
        method: :PATCH,
        path: "/api/circuits/circuit-group-assignments/",
        body: circuit_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of Circuit group assignment objects.
    def bulk_update(circuit_group_assignment_request : Array(NetboxClient::CircuitGroupAssignmentRequest)) : Response(Array(NetboxClient::CircuitGroupAssignment))
      @conn.request(Array(NetboxClient::CircuitGroupAssignment),
        method: :PUT,
        path: "/api/circuits/circuit-group-assignments/",
        body: circuit_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of Circuit group assignment objects.
    def create(circuits_circuit_group_assignments_create_request : NetboxClient::CircuitsCircuitGroupAssignmentsCreateRequest) : Response(NetboxClient::CircuitGroupAssignment)
      @conn.request(NetboxClient::CircuitGroupAssignment,
        method: :POST,
        path: "/api/circuits/circuit-group-assignments/",
        body: circuits_circuit_group_assignments_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a Circuit group assignment object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/circuits/circuit-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of Circuit group assignment objects.
    def list(*, circuit : Array(String)? = nil, circuit_id : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, member_id : Array(Int32)? = nil, member_id__empty : Bool? = nil, member_id__gt : Array(Int32)? = nil, member_id__gte : Array(Int32)? = nil, member_id__lt : Array(Int32)? = nil, member_id__lte : Array(Int32)? = nil, member_id__n : Array(Int32)? = nil, member_type : String? = nil, member_type__n : String? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, priority : String? = nil, provider : Array(String)? = nil, provider_id : Array(Int32)? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, virtual_circuit : Array(String)? = nil, virtual_circuit_id : Array(Int32)? = nil) : Response(NetboxClient::PaginatedCircuitGroupAssignmentList)
      @conn.request(NetboxClient::PaginatedCircuitGroupAssignmentList,
        method: :GET,
        path: "/api/circuits/circuit-group-assignments/",
        query: { "circuit" => circuit, "circuit_id" => circuit_id, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "member_id" => member_id, "member_id__empty" => member_id__empty, "member_id__gt" => member_id__gt, "member_id__gte" => member_id__gte, "member_id__lt" => member_id__lt, "member_id__lte" => member_id__lte, "member_id__n" => member_id__n, "member_type" => member_type, "member_type__n" => member_type__n, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "priority" => priority, "provider" => provider, "provider_id" => provider_id, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "virtual_circuit" => virtual_circuit, "virtual_circuit_id" => virtual_circuit_id },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a Circuit group assignment object.
    def partial_update(id : Int32, patched_writable_circuit_group_assignment_request : NetboxClient::PatchedWritableCircuitGroupAssignmentRequest? = nil) : Response(NetboxClient::CircuitGroupAssignment)
      @conn.request(NetboxClient::CircuitGroupAssignment,
        method: :PATCH,
        path: "/api/circuits/circuit-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_circuit_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a Circuit group assignment object.
    def retrieve(id : Int32) : Response(NetboxClient::CircuitGroupAssignment)
      @conn.request(NetboxClient::CircuitGroupAssignment,
        method: :GET,
        path: "/api/circuits/circuit-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a Circuit group assignment object.
    def update(id : Int32, writable_circuit_group_assignment_request : NetboxClient::WritableCircuitGroupAssignmentRequest) : Response(NetboxClient::CircuitGroupAssignment)
      @conn.request(NetboxClient::CircuitGroupAssignment,
        method: :PUT,
        path: "/api/circuits/circuit-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_circuit_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
