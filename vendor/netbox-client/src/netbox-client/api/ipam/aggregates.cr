require "json"

module NetboxClient
  module Api
  class Ipam::Aggregates
    def initialize(@conn : Connection); end

    #  Delete a list of aggregate objects.
    def bulk_destroy(aggregate_request : Array(NetboxClient::AggregateRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/aggregates/",
        body: aggregate_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of aggregate objects.
    def bulk_partial_update(aggregate_request : Array(NetboxClient::AggregateRequest)) : Response(Array(NetboxClient::Aggregate))
      @conn.request(Array(NetboxClient::Aggregate),
        method: :PATCH,
        path: "/api/ipam/aggregates/",
        body: aggregate_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of aggregate objects.
    def bulk_update(aggregate_request : Array(NetboxClient::AggregateRequest)) : Response(Array(NetboxClient::Aggregate))
      @conn.request(Array(NetboxClient::Aggregate),
        method: :PUT,
        path: "/api/ipam/aggregates/",
        body: aggregate_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of aggregate objects.
    def create(ipam_aggregates_create_request : NetboxClient::IpamAggregatesCreateRequest) : Response(NetboxClient::Aggregate)
      @conn.request(NetboxClient::Aggregate,
        method: :POST,
        path: "/api/ipam/aggregates/",
        body: ipam_aggregates_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a aggregate object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/aggregates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of aggregate objects.
    def list(*, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, date_added : Array(Time)? = nil, date_added__empty : Bool? = nil, date_added__gt : Array(Time)? = nil, date_added__gte : Array(Time)? = nil, date_added__lt : Array(Time)? = nil, date_added__lte : Array(Time)? = nil, date_added__n : Array(Time)? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, family : Float64? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, prefix : String? = nil, q : String? = nil, rir : Array(String)? = nil, rir__n : Array(String)? = nil, rir_id : Array(Int32)? = nil, rir_id__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedAggregateList)
      @conn.request(NetboxClient::PaginatedAggregateList,
        method: :GET,
        path: "/api/ipam/aggregates/",
        query: { "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "date_added" => date_added, "date_added__empty" => date_added__empty, "date_added__gt" => date_added__gt, "date_added__gte" => date_added__gte, "date_added__lt" => date_added__lt, "date_added__lte" => date_added__lte, "date_added__n" => date_added__n, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "family" => family, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "prefix" => prefix, "q" => q, "rir" => rir, "rir__n" => rir__n, "rir_id" => rir_id, "rir_id__n" => rir_id__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a aggregate object.
    def partial_update(id : Int32, patched_writable_aggregate_request : NetboxClient::PatchedWritableAggregateRequest? = nil) : Response(NetboxClient::Aggregate)
      @conn.request(NetboxClient::Aggregate,
        method: :PATCH,
        path: "/api/ipam/aggregates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_aggregate_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a aggregate object.
    def retrieve(id : Int32) : Response(NetboxClient::Aggregate)
      @conn.request(NetboxClient::Aggregate,
        method: :GET,
        path: "/api/ipam/aggregates/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a aggregate object.
    def update(id : Int32, writable_aggregate_request : NetboxClient::WritableAggregateRequest) : Response(NetboxClient::Aggregate)
      @conn.request(NetboxClient::Aggregate,
        method: :PUT,
        path: "/api/ipam/aggregates/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_aggregate_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
