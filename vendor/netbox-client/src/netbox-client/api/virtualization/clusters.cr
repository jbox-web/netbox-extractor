require "json"

module NetboxClient
  module Api
  class Virtualization::Clusters
    def initialize(@conn : Connection); end

    #  Delete a list of cluster objects.
    def bulk_destroy(cluster_request : Array(NetboxClient::ClusterRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/virtualization/clusters/",
        body: cluster_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of cluster objects.
    def bulk_partial_update(cluster_request : Array(NetboxClient::ClusterRequest)) : Response(Array(NetboxClient::Cluster))
      @conn.request(Array(NetboxClient::Cluster),
        method: :PATCH,
        path: "/api/virtualization/clusters/",
        body: cluster_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of cluster objects.
    def bulk_update(cluster_request : Array(NetboxClient::ClusterRequest)) : Response(Array(NetboxClient::Cluster))
      @conn.request(Array(NetboxClient::Cluster),
        method: :PUT,
        path: "/api/virtualization/clusters/",
        body: cluster_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of cluster objects.
    def create(virtualization_clusters_create_request : NetboxClient::VirtualizationClustersCreateRequest) : Response(NetboxClient::Cluster)
      @conn.request(NetboxClient::Cluster,
        method: :POST,
        path: "/api/virtualization/clusters/",
        body: virtualization_clusters_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a cluster object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/virtualization/clusters/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of cluster objects.
    def list(*, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(Int32)? = nil, group_id__n : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(String)? = nil, location_id__n : Array(String)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, scope_id : Array(Int32)? = nil, scope_id__empty : Bool? = nil, scope_id__gt : Array(Int32)? = nil, scope_id__gte : Array(Int32)? = nil, scope_id__lt : Array(Int32)? = nil, scope_id__lte : Array(Int32)? = nil, scope_id__n : Array(Int32)? = nil, scope_type : String? = nil, scope_type__n : String? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, _type : Array(String)? = nil, type__n : Array(String)? = nil, type_id : Array(Int32)? = nil, type_id__n : Array(Int32)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedClusterList)
      @conn.request(NetboxClient::PaginatedClusterList,
        method: :GET,
        path: "/api/virtualization/clusters/",
        query: { "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "scope_id" => scope_id, "scope_id__empty" => scope_id__empty, "scope_id__gt" => scope_id__gt, "scope_id__gte" => scope_id__gte, "scope_id__lt" => scope_id__lt, "scope_id__lte" => scope_id__lte, "scope_id__n" => scope_id__n, "scope_type" => scope_type, "scope_type__n" => scope_type__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "type" => _type, "type__n" => type__n, "type_id" => type_id, "type_id__n" => type_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a cluster object.
    def partial_update(id : Int32, patched_writable_cluster_request : NetboxClient::PatchedWritableClusterRequest? = nil) : Response(NetboxClient::Cluster)
      @conn.request(NetboxClient::Cluster,
        method: :PATCH,
        path: "/api/virtualization/clusters/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_cluster_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a cluster object.
    def retrieve(id : Int32) : Response(NetboxClient::Cluster)
      @conn.request(NetboxClient::Cluster,
        method: :GET,
        path: "/api/virtualization/clusters/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a cluster object.
    def update(id : Int32, writable_cluster_request : NetboxClient::WritableClusterRequest) : Response(NetboxClient::Cluster)
      @conn.request(NetboxClient::Cluster,
        method: :PUT,
        path: "/api/virtualization/clusters/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_cluster_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
