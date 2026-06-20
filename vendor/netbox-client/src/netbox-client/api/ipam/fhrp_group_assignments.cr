require "json"

module NetboxClient
  module Api
  class Ipam::FhrpGroupAssignments
    def initialize(@conn : Connection); end

    #  Delete a list of FHRP group assignment objects.
    def bulk_destroy(fhrp_group_assignment_request : Array(NetboxClient::FHRPGroupAssignmentRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/fhrp-group-assignments/",
        body: fhrp_group_assignment_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of FHRP group assignment objects.
    def bulk_partial_update(fhrp_group_assignment_request : Array(NetboxClient::FHRPGroupAssignmentRequest)) : Response(Array(NetboxClient::FHRPGroupAssignment))
      @conn.request(Array(NetboxClient::FHRPGroupAssignment),
        method: :PATCH,
        path: "/api/ipam/fhrp-group-assignments/",
        body: fhrp_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of FHRP group assignment objects.
    def bulk_update(fhrp_group_assignment_request : Array(NetboxClient::FHRPGroupAssignmentRequest)) : Response(Array(NetboxClient::FHRPGroupAssignment))
      @conn.request(Array(NetboxClient::FHRPGroupAssignment),
        method: :PUT,
        path: "/api/ipam/fhrp-group-assignments/",
        body: fhrp_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of FHRP group assignment objects.
    def create(ipam_fhrp_group_assignments_create_request : NetboxClient::IpamFhrpGroupAssignmentsCreateRequest) : Response(NetboxClient::FHRPGroupAssignment)
      @conn.request(NetboxClient::FHRPGroupAssignment,
        method: :POST,
        path: "/api/ipam/fhrp-group-assignments/",
        body: ipam_fhrp_group_assignments_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a FHRP group assignment object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/fhrp-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of FHRP group assignment objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, device : Array(String)? = nil, device_id : Array(Int32)? = nil, group_id : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, interface_id : Array(Int32)? = nil, interface_id__empty : Bool? = nil, interface_id__gt : Array(Int32)? = nil, interface_id__gte : Array(Int32)? = nil, interface_id__lt : Array(Int32)? = nil, interface_id__lte : Array(Int32)? = nil, interface_id__n : Array(Int32)? = nil, interface_type : String? = nil, interface_type__n : String? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, priority : Array(Int32)? = nil, priority__empty : Bool? = nil, priority__gt : Array(Int32)? = nil, priority__gte : Array(Int32)? = nil, priority__lt : Array(Int32)? = nil, priority__lte : Array(Int32)? = nil, priority__n : Array(Int32)? = nil, updated_by_request : String? = nil, virtual_machine : Array(String)? = nil, virtual_machine_id : Array(Int32)? = nil) : Response(NetboxClient::PaginatedFHRPGroupAssignmentList)
      @conn.request(NetboxClient::PaginatedFHRPGroupAssignmentList,
        method: :GET,
        path: "/api/ipam/fhrp-group-assignments/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "device" => device, "device_id" => device_id, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "interface_id" => interface_id, "interface_id__empty" => interface_id__empty, "interface_id__gt" => interface_id__gt, "interface_id__gte" => interface_id__gte, "interface_id__lt" => interface_id__lt, "interface_id__lte" => interface_id__lte, "interface_id__n" => interface_id__n, "interface_type" => interface_type, "interface_type__n" => interface_type__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "priority" => priority, "priority__empty" => priority__empty, "priority__gt" => priority__gt, "priority__gte" => priority__gte, "priority__lt" => priority__lt, "priority__lte" => priority__lte, "priority__n" => priority__n, "updated_by_request" => updated_by_request, "virtual_machine" => virtual_machine, "virtual_machine_id" => virtual_machine_id },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a FHRP group assignment object.
    def partial_update(id : Int32, patched_fhrp_group_assignment_request : NetboxClient::PatchedFHRPGroupAssignmentRequest? = nil) : Response(NetboxClient::FHRPGroupAssignment)
      @conn.request(NetboxClient::FHRPGroupAssignment,
        method: :PATCH,
        path: "/api/ipam/fhrp-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_fhrp_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a FHRP group assignment object.
    def retrieve(id : Int32) : Response(NetboxClient::FHRPGroupAssignment)
      @conn.request(NetboxClient::FHRPGroupAssignment,
        method: :GET,
        path: "/api/ipam/fhrp-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a FHRP group assignment object.
    def update(id : Int32, fhrp_group_assignment_request : NetboxClient::FHRPGroupAssignmentRequest) : Response(NetboxClient::FHRPGroupAssignment)
      @conn.request(NetboxClient::FHRPGroupAssignment,
        method: :PUT,
        path: "/api/ipam/fhrp-group-assignments/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: fhrp_group_assignment_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
