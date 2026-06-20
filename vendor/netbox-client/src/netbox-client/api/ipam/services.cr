require "json"

module NetboxClient
  module Api
  class Ipam::Services
    def initialize(@conn : Connection); end

    #  Delete a list of application service objects.
    def bulk_destroy(service_request : Array(NetboxClient::ServiceRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/services/",
        body: service_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of application service objects.
    def bulk_partial_update(service_request : Array(NetboxClient::ServiceRequest)) : Response(Array(NetboxClient::Service))
      @conn.request(Array(NetboxClient::Service),
        method: :PATCH,
        path: "/api/ipam/services/",
        body: service_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of application service objects.
    def bulk_update(service_request : Array(NetboxClient::ServiceRequest)) : Response(Array(NetboxClient::Service))
      @conn.request(Array(NetboxClient::Service),
        method: :PUT,
        path: "/api/ipam/services/",
        body: service_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of application service objects.
    def create(ipam_services_create_request : NetboxClient::IpamServicesCreateRequest) : Response(NetboxClient::Service)
      @conn.request(NetboxClient::Service,
        method: :POST,
        path: "/api/ipam/services/",
        body: ipam_services_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a application service object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/services/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of application service objects.
    def list(*, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, device : Array(String)? = nil, device_id : Array(Int32)? = nil, fhrpgroup : Array(String)? = nil, fhrpgroup_id : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, ip_address : Array(String)? = nil, ip_address__n : Array(String)? = nil, ip_address_id : Array(Int32)? = nil, ip_address_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, parent_object_id : Array(Int32)? = nil, parent_object_id__empty : Bool? = nil, parent_object_id__gt : Array(Int32)? = nil, parent_object_id__gte : Array(Int32)? = nil, parent_object_id__lt : Array(Int32)? = nil, parent_object_id__lte : Array(Int32)? = nil, parent_object_id__n : Array(Int32)? = nil, parent_object_type : String? = nil, parent_object_type__n : String? = nil, port : Float64? = nil, port__empty : Float64? = nil, port__gt : Float64? = nil, port__gte : Float64? = nil, port__lt : Float64? = nil, port__lte : Float64? = nil, port__n : Float64? = nil, protocol : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, virtual_machine : Array(String)? = nil, virtual_machine_id : Array(Int32)? = nil) : Response(NetboxClient::PaginatedServiceList)
      @conn.request(NetboxClient::PaginatedServiceList,
        method: :GET,
        path: "/api/ipam/services/",
        query: { "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "device" => device, "device_id" => device_id, "fhrpgroup" => fhrpgroup, "fhrpgroup_id" => fhrpgroup_id, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "ip_address" => ip_address, "ip_address__n" => ip_address__n, "ip_address_id" => ip_address_id, "ip_address_id__n" => ip_address_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "parent_object_id" => parent_object_id, "parent_object_id__empty" => parent_object_id__empty, "parent_object_id__gt" => parent_object_id__gt, "parent_object_id__gte" => parent_object_id__gte, "parent_object_id__lt" => parent_object_id__lt, "parent_object_id__lte" => parent_object_id__lte, "parent_object_id__n" => parent_object_id__n, "parent_object_type" => parent_object_type, "parent_object_type__n" => parent_object_type__n, "port" => port, "port__empty" => port__empty, "port__gt" => port__gt, "port__gte" => port__gte, "port__lt" => port__lt, "port__lte" => port__lte, "port__n" => port__n, "protocol" => protocol, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "virtual_machine" => virtual_machine, "virtual_machine_id" => virtual_machine_id },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a application service object.
    def partial_update(id : Int32, patched_writable_service_request : NetboxClient::PatchedWritableServiceRequest? = nil) : Response(NetboxClient::Service)
      @conn.request(NetboxClient::Service,
        method: :PATCH,
        path: "/api/ipam/services/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_service_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a application service object.
    def retrieve(id : Int32) : Response(NetboxClient::Service)
      @conn.request(NetboxClient::Service,
        method: :GET,
        path: "/api/ipam/services/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a application service object.
    def update(id : Int32, writable_service_request : NetboxClient::WritableServiceRequest) : Response(NetboxClient::Service)
      @conn.request(NetboxClient::Service,
        method: :PUT,
        path: "/api/ipam/services/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_service_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
