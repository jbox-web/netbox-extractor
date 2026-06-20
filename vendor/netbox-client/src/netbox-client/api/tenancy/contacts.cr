require "json"

module NetboxClient
  module Api
  class Tenancy::Contacts
    def initialize(@conn : Connection); end

    #  Delete a list of contact objects.
    def bulk_destroy(contact_request : Array(NetboxClient::ContactRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/tenancy/contacts/",
        body: contact_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of contact objects.
    def bulk_partial_update(contact_request : Array(NetboxClient::ContactRequest)) : Response(Array(NetboxClient::Contact))
      @conn.request(Array(NetboxClient::Contact),
        method: :PATCH,
        path: "/api/tenancy/contacts/",
        body: contact_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of contact objects.
    def bulk_update(contact_request : Array(NetboxClient::ContactRequest)) : Response(Array(NetboxClient::Contact))
      @conn.request(Array(NetboxClient::Contact),
        method: :PUT,
        path: "/api/tenancy/contacts/",
        body: contact_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of contact objects.
    def create(tenancy_contacts_create_request : NetboxClient::TenancyContactsCreateRequest) : Response(NetboxClient::Contact)
      @conn.request(NetboxClient::Contact,
        method: :POST,
        path: "/api/tenancy/contacts/",
        body: tenancy_contacts_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a contact object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/tenancy/contacts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of contact objects.
    def list(*, address : Array(String)? = nil, address__empty : Bool? = nil, address__ic : Array(String)? = nil, address__ie : Array(String)? = nil, address__iew : Array(String)? = nil, address__iregex : Array(String)? = nil, address__isw : Array(String)? = nil, address__n : Array(String)? = nil, address__nic : Array(String)? = nil, address__nie : Array(String)? = nil, address__niew : Array(String)? = nil, address__nisw : Array(String)? = nil, address__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, email : Array(String)? = nil, email__empty : Bool? = nil, email__ic : Array(String)? = nil, email__ie : Array(String)? = nil, email__iew : Array(String)? = nil, email__iregex : Array(String)? = nil, email__isw : Array(String)? = nil, email__n : Array(String)? = nil, email__nic : Array(String)? = nil, email__nie : Array(String)? = nil, email__niew : Array(String)? = nil, email__nisw : Array(String)? = nil, email__regex : Array(String)? = nil, group : Array(String)? = nil, group__n : Array(String)? = nil, group_id : Array(String)? = nil, group_id__n : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, link : Array(String)? = nil, link__empty : Bool? = nil, link__ic : Array(String)? = nil, link__ie : Array(String)? = nil, link__iew : Array(String)? = nil, link__iregex : Array(String)? = nil, link__isw : Array(String)? = nil, link__n : Array(String)? = nil, link__nic : Array(String)? = nil, link__nie : Array(String)? = nil, link__niew : Array(String)? = nil, link__nisw : Array(String)? = nil, link__regex : Array(String)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, phone : Array(String)? = nil, phone__empty : Bool? = nil, phone__ic : Array(String)? = nil, phone__ie : Array(String)? = nil, phone__iew : Array(String)? = nil, phone__iregex : Array(String)? = nil, phone__isw : Array(String)? = nil, phone__n : Array(String)? = nil, phone__nic : Array(String)? = nil, phone__nie : Array(String)? = nil, phone__niew : Array(String)? = nil, phone__nisw : Array(String)? = nil, phone__regex : Array(String)? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, title : Array(String)? = nil, title__empty : Bool? = nil, title__ic : Array(String)? = nil, title__ie : Array(String)? = nil, title__iew : Array(String)? = nil, title__iregex : Array(String)? = nil, title__isw : Array(String)? = nil, title__n : Array(String)? = nil, title__nic : Array(String)? = nil, title__nie : Array(String)? = nil, title__niew : Array(String)? = nil, title__nisw : Array(String)? = nil, title__regex : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedContactList)
      @conn.request(NetboxClient::PaginatedContactList,
        method: :GET,
        path: "/api/tenancy/contacts/",
        query: { "address" => address, "address__empty" => address__empty, "address__ic" => address__ic, "address__ie" => address__ie, "address__iew" => address__iew, "address__iregex" => address__iregex, "address__isw" => address__isw, "address__n" => address__n, "address__nic" => address__nic, "address__nie" => address__nie, "address__niew" => address__niew, "address__nisw" => address__nisw, "address__regex" => address__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "email" => email, "email__empty" => email__empty, "email__ic" => email__ic, "email__ie" => email__ie, "email__iew" => email__iew, "email__iregex" => email__iregex, "email__isw" => email__isw, "email__n" => email__n, "email__nic" => email__nic, "email__nie" => email__nie, "email__niew" => email__niew, "email__nisw" => email__nisw, "email__regex" => email__regex, "group" => group, "group__n" => group__n, "group_id" => group_id, "group_id__n" => group_id__n, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "link" => link, "link__empty" => link__empty, "link__ic" => link__ic, "link__ie" => link__ie, "link__iew" => link__iew, "link__iregex" => link__iregex, "link__isw" => link__isw, "link__n" => link__n, "link__nic" => link__nic, "link__nie" => link__nie, "link__niew" => link__niew, "link__nisw" => link__nisw, "link__regex" => link__regex, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "phone" => phone, "phone__empty" => phone__empty, "phone__ic" => phone__ic, "phone__ie" => phone__ie, "phone__iew" => phone__iew, "phone__iregex" => phone__iregex, "phone__isw" => phone__isw, "phone__n" => phone__n, "phone__nic" => phone__nic, "phone__nie" => phone__nie, "phone__niew" => phone__niew, "phone__nisw" => phone__nisw, "phone__regex" => phone__regex, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "title" => title, "title__empty" => title__empty, "title__ic" => title__ic, "title__ie" => title__ie, "title__iew" => title__iew, "title__iregex" => title__iregex, "title__isw" => title__isw, "title__n" => title__n, "title__nic" => title__nic, "title__nie" => title__nie, "title__niew" => title__niew, "title__nisw" => title__nisw, "title__regex" => title__regex, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a contact object.
    def partial_update(id : Int32, patched_contact_request : NetboxClient::PatchedContactRequest? = nil) : Response(NetboxClient::Contact)
      @conn.request(NetboxClient::Contact,
        method: :PATCH,
        path: "/api/tenancy/contacts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_contact_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a contact object.
    def retrieve(id : Int32) : Response(NetboxClient::Contact)
      @conn.request(NetboxClient::Contact,
        method: :GET,
        path: "/api/tenancy/contacts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a contact object.
    def update(id : Int32, contact_request : NetboxClient::ContactRequest) : Response(NetboxClient::Contact)
      @conn.request(NetboxClient::Contact,
        method: :PUT,
        path: "/api/tenancy/contacts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: contact_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
