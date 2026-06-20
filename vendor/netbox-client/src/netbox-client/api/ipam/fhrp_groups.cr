require "json"

module NetboxClient
  module Api
  class Ipam::FhrpGroups
    def initialize(@conn : Connection); end

    #  Delete a list of FHRP group objects.
    def bulk_destroy(fhrp_group_request : Array(NetboxClient::FHRPGroupRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/fhrp-groups/",
        body: fhrp_group_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of FHRP group objects.
    def bulk_partial_update(fhrp_group_request : Array(NetboxClient::FHRPGroupRequest)) : Response(Array(NetboxClient::FHRPGroup))
      @conn.request(Array(NetboxClient::FHRPGroup),
        method: :PATCH,
        path: "/api/ipam/fhrp-groups/",
        body: fhrp_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of FHRP group objects.
    def bulk_update(fhrp_group_request : Array(NetboxClient::FHRPGroupRequest)) : Response(Array(NetboxClient::FHRPGroup))
      @conn.request(Array(NetboxClient::FHRPGroup),
        method: :PUT,
        path: "/api/ipam/fhrp-groups/",
        body: fhrp_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of FHRP group objects.
    def create(ipam_fhrp_groups_create_request : NetboxClient::IpamFhrpGroupsCreateRequest) : Response(NetboxClient::FHRPGroup)
      @conn.request(NetboxClient::FHRPGroup,
        method: :POST,
        path: "/api/ipam/fhrp-groups/",
        body: ipam_fhrp_groups_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a FHRP group object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/fhrp-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of FHRP group objects.
    def list(*, auth_key : Array(String)? = nil, auth_key__empty : Bool? = nil, auth_key__ic : Array(String)? = nil, auth_key__ie : Array(String)? = nil, auth_key__iew : Array(String)? = nil, auth_key__iregex : Array(String)? = nil, auth_key__isw : Array(String)? = nil, auth_key__n : Array(String)? = nil, auth_key__nic : Array(String)? = nil, auth_key__nie : Array(String)? = nil, auth_key__niew : Array(String)? = nil, auth_key__nisw : Array(String)? = nil, auth_key__regex : Array(String)? = nil, auth_type : Array(String)? = nil, auth_type__empty : Bool? = nil, auth_type__ic : Array(String)? = nil, auth_type__ie : Array(String)? = nil, auth_type__iew : Array(String)? = nil, auth_type__iregex : Array(String)? = nil, auth_type__isw : Array(String)? = nil, auth_type__n : Array(String)? = nil, auth_type__nic : Array(String)? = nil, auth_type__nie : Array(String)? = nil, auth_type__niew : Array(String)? = nil, auth_type__nisw : Array(String)? = nil, auth_type__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, group_id : Array(Int32)? = nil, group_id__empty : Bool? = nil, group_id__gt : Array(Int32)? = nil, group_id__gte : Array(Int32)? = nil, group_id__lt : Array(Int32)? = nil, group_id__lte : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, protocol : Array(String)? = nil, protocol__empty : Bool? = nil, protocol__ic : Array(String)? = nil, protocol__ie : Array(String)? = nil, protocol__iew : Array(String)? = nil, protocol__iregex : Array(String)? = nil, protocol__isw : Array(String)? = nil, protocol__n : Array(String)? = nil, protocol__nic : Array(String)? = nil, protocol__nie : Array(String)? = nil, protocol__niew : Array(String)? = nil, protocol__nisw : Array(String)? = nil, protocol__regex : Array(String)? = nil, q : String? = nil, related_ip : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedFHRPGroupList)
      @conn.request(NetboxClient::PaginatedFHRPGroupList,
        method: :GET,
        path: "/api/ipam/fhrp-groups/",
        query: { "auth_key" => auth_key, "auth_key__empty" => auth_key__empty, "auth_key__ic" => auth_key__ic, "auth_key__ie" => auth_key__ie, "auth_key__iew" => auth_key__iew, "auth_key__iregex" => auth_key__iregex, "auth_key__isw" => auth_key__isw, "auth_key__n" => auth_key__n, "auth_key__nic" => auth_key__nic, "auth_key__nie" => auth_key__nie, "auth_key__niew" => auth_key__niew, "auth_key__nisw" => auth_key__nisw, "auth_key__regex" => auth_key__regex, "auth_type" => auth_type, "auth_type__empty" => auth_type__empty, "auth_type__ic" => auth_type__ic, "auth_type__ie" => auth_type__ie, "auth_type__iew" => auth_type__iew, "auth_type__iregex" => auth_type__iregex, "auth_type__isw" => auth_type__isw, "auth_type__n" => auth_type__n, "auth_type__nic" => auth_type__nic, "auth_type__nie" => auth_type__nie, "auth_type__niew" => auth_type__niew, "auth_type__nisw" => auth_type__nisw, "auth_type__regex" => auth_type__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "group_id" => group_id, "group_id__empty" => group_id__empty, "group_id__gt" => group_id__gt, "group_id__gte" => group_id__gte, "group_id__lt" => group_id__lt, "group_id__lte" => group_id__lte, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "protocol" => protocol, "protocol__empty" => protocol__empty, "protocol__ic" => protocol__ic, "protocol__ie" => protocol__ie, "protocol__iew" => protocol__iew, "protocol__iregex" => protocol__iregex, "protocol__isw" => protocol__isw, "protocol__n" => protocol__n, "protocol__nic" => protocol__nic, "protocol__nie" => protocol__nie, "protocol__niew" => protocol__niew, "protocol__nisw" => protocol__nisw, "protocol__regex" => protocol__regex, "q" => q, "related_ip" => related_ip, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a FHRP group object.
    def partial_update(id : Int32, patched_fhrp_group_request : NetboxClient::PatchedFHRPGroupRequest? = nil) : Response(NetboxClient::FHRPGroup)
      @conn.request(NetboxClient::FHRPGroup,
        method: :PATCH,
        path: "/api/ipam/fhrp-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_fhrp_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a FHRP group object.
    def retrieve(id : Int32) : Response(NetboxClient::FHRPGroup)
      @conn.request(NetboxClient::FHRPGroup,
        method: :GET,
        path: "/api/ipam/fhrp-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a FHRP group object.
    def update(id : Int32, fhrp_group_request : NetboxClient::FHRPGroupRequest) : Response(NetboxClient::FHRPGroup)
      @conn.request(NetboxClient::FHRPGroup,
        method: :PUT,
        path: "/api/ipam/fhrp-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: fhrp_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
