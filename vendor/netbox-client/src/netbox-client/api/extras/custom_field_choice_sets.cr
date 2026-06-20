require "json"

module NetboxClient
  module Api
  class Extras::CustomFieldChoiceSets
    def initialize(@conn : Connection); end

    #  Delete a list of custom field choice set objects.
    def bulk_destroy(custom_field_choice_set_request : Array(NetboxClient::CustomFieldChoiceSetRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/custom-field-choice-sets/",
        body: custom_field_choice_set_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of custom field choice set objects.
    def bulk_partial_update(custom_field_choice_set_request : Array(NetboxClient::CustomFieldChoiceSetRequest)) : Response(Array(NetboxClient::CustomFieldChoiceSet))
      @conn.request(Array(NetboxClient::CustomFieldChoiceSet),
        method: :PATCH,
        path: "/api/extras/custom-field-choice-sets/",
        body: custom_field_choice_set_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of custom field choice set objects.
    def bulk_update(custom_field_choice_set_request : Array(NetboxClient::CustomFieldChoiceSetRequest)) : Response(Array(NetboxClient::CustomFieldChoiceSet))
      @conn.request(Array(NetboxClient::CustomFieldChoiceSet),
        method: :PUT,
        path: "/api/extras/custom-field-choice-sets/",
        body: custom_field_choice_set_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Provides an endpoint to iterate through each choice in a set.
    def choices_retrieve(id : Int32) : Response(NetboxClient::CustomFieldChoiceSet)
      @conn.request(NetboxClient::CustomFieldChoiceSet,
        method: :GET,
        path: "/api/extras/custom-field-choice-sets/{id}/choices/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of custom field choice set objects.
    def create(extras_custom_field_choice_sets_create_request : NetboxClient::ExtrasCustomFieldChoiceSetsCreateRequest) : Response(NetboxClient::CustomFieldChoiceSet)
      @conn.request(NetboxClient::CustomFieldChoiceSet,
        method: :POST,
        path: "/api/extras/custom-field-choice-sets/",
        body: extras_custom_field_choice_sets_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a custom field choice set object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/custom-field-choice-sets/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of custom field choice set objects.
    def list(*, base_choices : String? = nil, choice : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, order_alphabetically : Bool? = nil, ordering : String? = nil, q : String? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedCustomFieldChoiceSetList)
      @conn.request(NetboxClient::PaginatedCustomFieldChoiceSetList,
        method: :GET,
        path: "/api/extras/custom-field-choice-sets/",
        query: { "base_choices" => base_choices, "choice" => choice, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "order_alphabetically" => order_alphabetically, "ordering" => ordering, "q" => q, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a custom field choice set object.
    def partial_update(id : Int32, patched_writable_custom_field_choice_set_request : NetboxClient::PatchedWritableCustomFieldChoiceSetRequest? = nil) : Response(NetboxClient::CustomFieldChoiceSet)
      @conn.request(NetboxClient::CustomFieldChoiceSet,
        method: :PATCH,
        path: "/api/extras/custom-field-choice-sets/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_custom_field_choice_set_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a custom field choice set object.
    def retrieve(id : Int32) : Response(NetboxClient::CustomFieldChoiceSet)
      @conn.request(NetboxClient::CustomFieldChoiceSet,
        method: :GET,
        path: "/api/extras/custom-field-choice-sets/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a custom field choice set object.
    def update(id : Int32, writable_custom_field_choice_set_request : NetboxClient::WritableCustomFieldChoiceSetRequest) : Response(NetboxClient::CustomFieldChoiceSet)
      @conn.request(NetboxClient::CustomFieldChoiceSet,
        method: :PUT,
        path: "/api/extras/custom-field-choice-sets/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_custom_field_choice_set_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
