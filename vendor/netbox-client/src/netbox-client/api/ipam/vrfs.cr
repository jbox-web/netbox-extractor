require "json"

module NetboxClient
  module Api
  class Ipam::Vrfs
    def initialize(@conn : Connection); end

    #  Delete a list of VRF objects.
    def bulk_destroy(vrf_request : Array(NetboxClient::VRFRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vrfs/",
        body: vrf_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of VRF objects.
    def bulk_partial_update(vrf_request : Array(NetboxClient::VRFRequest)) : Response(Array(NetboxClient::VRF))
      @conn.request(Array(NetboxClient::VRF),
        method: :PATCH,
        path: "/api/ipam/vrfs/",
        body: vrf_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of VRF objects.
    def bulk_update(vrf_request : Array(NetboxClient::VRFRequest)) : Response(Array(NetboxClient::VRF))
      @conn.request(Array(NetboxClient::VRF),
        method: :PUT,
        path: "/api/ipam/vrfs/",
        body: vrf_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of VRF objects.
    def create(ipam_vrfs_create_request : NetboxClient::IpamVrfsCreateRequest) : Response(NetboxClient::VRF)
      @conn.request(NetboxClient::VRF,
        method: :POST,
        path: "/api/ipam/vrfs/",
        body: ipam_vrfs_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a VRF object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vrfs/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of VRF objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, enforce_unique : Bool? = nil, export_target : Array(String)? = nil, export_target__n : Array(String)? = nil, export_target_id : Array(Int32)? = nil, export_target_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, import_target : Array(String)? = nil, import_target__n : Array(String)? = nil, import_target_id : Array(Int32)? = nil, import_target_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, rd : Array(String)? = nil, rd__empty : Bool? = nil, rd__ic : Array(String)? = nil, rd__ie : Array(String)? = nil, rd__iew : Array(String)? = nil, rd__iregex : Array(String)? = nil, rd__isw : Array(String)? = nil, rd__n : Array(String)? = nil, rd__nic : Array(String)? = nil, rd__nie : Array(String)? = nil, rd__niew : Array(String)? = nil, rd__nisw : Array(String)? = nil, rd__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedVRFList)
      @conn.request(NetboxClient::PaginatedVRFList,
        method: :GET,
        path: "/api/ipam/vrfs/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "enforce_unique" => enforce_unique, "export_target" => export_target, "export_target__n" => export_target__n, "export_target_id" => export_target_id, "export_target_id__n" => export_target_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "import_target" => import_target, "import_target__n" => import_target__n, "import_target_id" => import_target_id, "import_target_id__n" => import_target_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "rd" => rd, "rd__empty" => rd__empty, "rd__ic" => rd__ic, "rd__ie" => rd__ie, "rd__iew" => rd__iew, "rd__iregex" => rd__iregex, "rd__isw" => rd__isw, "rd__n" => rd__n, "rd__nic" => rd__nic, "rd__nie" => rd__nie, "rd__niew" => rd__niew, "rd__nisw" => rd__nisw, "rd__regex" => rd__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a VRF object.
    def partial_update(id : Int32, patched_vrf_request : NetboxClient::PatchedVRFRequest? = nil) : Response(NetboxClient::VRF)
      @conn.request(NetboxClient::VRF,
        method: :PATCH,
        path: "/api/ipam/vrfs/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_vrf_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a VRF object.
    def retrieve(id : Int32) : Response(NetboxClient::VRF)
      @conn.request(NetboxClient::VRF,
        method: :GET,
        path: "/api/ipam/vrfs/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a VRF object.
    def update(id : Int32, vrf_request : NetboxClient::VRFRequest) : Response(NetboxClient::VRF)
      @conn.request(NetboxClient::VRF,
        method: :PUT,
        path: "/api/ipam/vrfs/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: vrf_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
