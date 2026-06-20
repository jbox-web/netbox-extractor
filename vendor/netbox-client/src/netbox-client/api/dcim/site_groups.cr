require "json"

module NetboxClient
  module Api
  class Dcim::SiteGroups
    def initialize(@conn : Connection); end

    #  Delete a list of site group objects.
    def bulk_destroy(site_group_request : Array(NetboxClient::SiteGroupRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/site-groups/",
        body: site_group_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of site group objects.
    def bulk_partial_update(site_group_request : Array(NetboxClient::SiteGroupRequest)) : Response(Array(NetboxClient::SiteGroup))
      @conn.request(Array(NetboxClient::SiteGroup),
        method: :PATCH,
        path: "/api/dcim/site-groups/",
        body: site_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of site group objects.
    def bulk_update(site_group_request : Array(NetboxClient::SiteGroupRequest)) : Response(Array(NetboxClient::SiteGroup))
      @conn.request(Array(NetboxClient::SiteGroup),
        method: :PUT,
        path: "/api/dcim/site-groups/",
        body: site_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of site group objects.
    def create(dcim_site_groups_create_request : NetboxClient::DcimSiteGroupsCreateRequest) : Response(NetboxClient::SiteGroup)
      @conn.request(NetboxClient::SiteGroup,
        method: :POST,
        path: "/api/dcim/site-groups/",
        body: dcim_site_groups_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a site group object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/site-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of site group objects.
    def list(*, ancestor : Array(String)? = nil, ancestor__n : Array(String)? = nil, ancestor_id : Array(String)? = nil, ancestor_id__n : Array(String)? = nil, contact : Array(Int32)? = nil, contact__n : Array(Int32)? = nil, contact_group : Array(String)? = nil, contact_group__n : Array(String)? = nil, contact_role : Array(Int32)? = nil, contact_role__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, parent : Array(String)? = nil, parent__n : Array(String)? = nil, parent_id : Array(Int32)? = nil, parent_id__n : Array(Int32)? = nil, q : String? = nil, slug : Array(String)? = nil, slug__empty : Bool? = nil, slug__ic : Array(String)? = nil, slug__ie : Array(String)? = nil, slug__iew : Array(String)? = nil, slug__iregex : Array(String)? = nil, slug__isw : Array(String)? = nil, slug__n : Array(String)? = nil, slug__nic : Array(String)? = nil, slug__nie : Array(String)? = nil, slug__niew : Array(String)? = nil, slug__nisw : Array(String)? = nil, slug__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedSiteGroupList)
      @conn.request(NetboxClient::PaginatedSiteGroupList,
        method: :GET,
        path: "/api/dcim/site-groups/",
        query: { "ancestor" => ancestor, "ancestor__n" => ancestor__n, "ancestor_id" => ancestor_id, "ancestor_id__n" => ancestor_id__n, "contact" => contact, "contact__n" => contact__n, "contact_group" => contact_group, "contact_group__n" => contact_group__n, "contact_role" => contact_role, "contact_role__n" => contact_role__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "parent" => parent, "parent__n" => parent__n, "parent_id" => parent_id, "parent_id__n" => parent_id__n, "q" => q, "slug" => slug, "slug__empty" => slug__empty, "slug__ic" => slug__ic, "slug__ie" => slug__ie, "slug__iew" => slug__iew, "slug__iregex" => slug__iregex, "slug__isw" => slug__isw, "slug__n" => slug__n, "slug__nic" => slug__nic, "slug__nie" => slug__nie, "slug__niew" => slug__niew, "slug__nisw" => slug__nisw, "slug__regex" => slug__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a site group object.
    def partial_update(id : Int32, patched_writable_site_group_request : NetboxClient::PatchedWritableSiteGroupRequest? = nil) : Response(NetboxClient::SiteGroup)
      @conn.request(NetboxClient::SiteGroup,
        method: :PATCH,
        path: "/api/dcim/site-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_site_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a site group object.
    def retrieve(id : Int32) : Response(NetboxClient::SiteGroup)
      @conn.request(NetboxClient::SiteGroup,
        method: :GET,
        path: "/api/dcim/site-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a site group object.
    def update(id : Int32, writable_site_group_request : NetboxClient::WritableSiteGroupRequest) : Response(NetboxClient::SiteGroup)
      @conn.request(NetboxClient::SiteGroup,
        method: :PUT,
        path: "/api/dcim/site-groups/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_site_group_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
