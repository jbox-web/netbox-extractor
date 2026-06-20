require "json"

module NetboxClient
  module Api
  class Extras::CustomFields
    def initialize(@conn : Connection); end

    #  Delete a list of custom field objects.
    def bulk_destroy(custom_field_request : Array(NetboxClient::CustomFieldRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/custom-fields/",
        body: custom_field_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of custom field objects.
    def bulk_partial_update(custom_field_request : Array(NetboxClient::CustomFieldRequest)) : Response(Array(NetboxClient::CustomField))
      @conn.request(Array(NetboxClient::CustomField),
        method: :PATCH,
        path: "/api/extras/custom-fields/",
        body: custom_field_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of custom field objects.
    def bulk_update(custom_field_request : Array(NetboxClient::CustomFieldRequest)) : Response(Array(NetboxClient::CustomField))
      @conn.request(Array(NetboxClient::CustomField),
        method: :PUT,
        path: "/api/extras/custom-fields/",
        body: custom_field_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of custom field objects.
    def create(extras_custom_fields_create_request : NetboxClient::ExtrasCustomFieldsCreateRequest) : Response(NetboxClient::CustomField)
      @conn.request(NetboxClient::CustomField,
        method: :POST,
        path: "/api/extras/custom-fields/",
        body: extras_custom_fields_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a custom field object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/custom-fields/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of custom field objects.
    def list(*, choice_set : Array(String)? = nil, choice_set__n : Array(String)? = nil, choice_set_id : Array(Int32)? = nil, choice_set_id__n : Array(Int32)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, filter_logic : String? = nil, group_name : Array(String)? = nil, group_name__empty : Bool? = nil, group_name__ic : Array(String)? = nil, group_name__ie : Array(String)? = nil, group_name__iew : Array(String)? = nil, group_name__iregex : Array(String)? = nil, group_name__isw : Array(String)? = nil, group_name__n : Array(String)? = nil, group_name__nic : Array(String)? = nil, group_name__nie : Array(String)? = nil, group_name__niew : Array(String)? = nil, group_name__nisw : Array(String)? = nil, group_name__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, is_cloneable : Bool? = nil, label : Array(String)? = nil, label__empty : Bool? = nil, label__ic : Array(String)? = nil, label__ie : Array(String)? = nil, label__iew : Array(String)? = nil, label__iregex : Array(String)? = nil, label__isw : Array(String)? = nil, label__n : Array(String)? = nil, label__nic : Array(String)? = nil, label__nie : Array(String)? = nil, label__niew : Array(String)? = nil, label__nisw : Array(String)? = nil, label__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, object_type : String? = nil, object_type__ic : String? = nil, object_type__ie : String? = nil, object_type__iew : String? = nil, object_type__iregex : String? = nil, object_type__isw : String? = nil, object_type__n : String? = nil, object_type__nic : String? = nil, object_type__nie : String? = nil, object_type__niew : String? = nil, object_type__nisw : String? = nil, object_type__regex : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, related_object_type : String? = nil, related_object_type__n : String? = nil, related_object_type_id : Array(Int32)? = nil, related_object_type_id__n : Array(Int32)? = nil, required : Bool? = nil, search_weight : Array(Int32)? = nil, search_weight__empty : Bool? = nil, search_weight__gt : Array(Int32)? = nil, search_weight__gte : Array(Int32)? = nil, search_weight__lt : Array(Int32)? = nil, search_weight__lte : Array(Int32)? = nil, search_weight__n : Array(Int32)? = nil, _type : Array(String)? = nil, type__empty : Bool? = nil, type__ic : Array(String)? = nil, type__ie : Array(String)? = nil, type__iew : Array(String)? = nil, type__iregex : Array(String)? = nil, type__isw : Array(String)? = nil, type__n : Array(String)? = nil, type__nic : Array(String)? = nil, type__nie : Array(String)? = nil, type__niew : Array(String)? = nil, type__nisw : Array(String)? = nil, type__regex : Array(String)? = nil, ui_editable : String? = nil, ui_visible : String? = nil, unique : Bool? = nil, updated_by_request : String? = nil, validation_maximum : Array(Float64)? = nil, validation_maximum__empty : Bool? = nil, validation_maximum__gt : Array(Float64)? = nil, validation_maximum__gte : Array(Float64)? = nil, validation_maximum__lt : Array(Float64)? = nil, validation_maximum__lte : Array(Float64)? = nil, validation_maximum__n : Array(Float64)? = nil, validation_minimum : Array(Float64)? = nil, validation_minimum__empty : Bool? = nil, validation_minimum__gt : Array(Float64)? = nil, validation_minimum__gte : Array(Float64)? = nil, validation_minimum__lt : Array(Float64)? = nil, validation_minimum__lte : Array(Float64)? = nil, validation_minimum__n : Array(Float64)? = nil, validation_regex : Array(String)? = nil, validation_regex__empty : Bool? = nil, validation_regex__ic : Array(String)? = nil, validation_regex__ie : Array(String)? = nil, validation_regex__iew : Array(String)? = nil, validation_regex__iregex : Array(String)? = nil, validation_regex__isw : Array(String)? = nil, validation_regex__n : Array(String)? = nil, validation_regex__nic : Array(String)? = nil, validation_regex__nie : Array(String)? = nil, validation_regex__niew : Array(String)? = nil, validation_regex__nisw : Array(String)? = nil, validation_regex__regex : Array(String)? = nil, weight : Array(Int32)? = nil, weight__empty : Bool? = nil, weight__gt : Array(Int32)? = nil, weight__gte : Array(Int32)? = nil, weight__lt : Array(Int32)? = nil, weight__lte : Array(Int32)? = nil, weight__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedCustomFieldList)
      @conn.request(NetboxClient::PaginatedCustomFieldList,
        method: :GET,
        path: "/api/extras/custom-fields/",
        query: { "choice_set" => choice_set, "choice_set__n" => choice_set__n, "choice_set_id" => choice_set_id, "choice_set_id__n" => choice_set_id__n, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "filter_logic" => filter_logic, "group_name" => group_name, "group_name__empty" => group_name__empty, "group_name__ic" => group_name__ic, "group_name__ie" => group_name__ie, "group_name__iew" => group_name__iew, "group_name__iregex" => group_name__iregex, "group_name__isw" => group_name__isw, "group_name__n" => group_name__n, "group_name__nic" => group_name__nic, "group_name__nie" => group_name__nie, "group_name__niew" => group_name__niew, "group_name__nisw" => group_name__nisw, "group_name__regex" => group_name__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "is_cloneable" => is_cloneable, "label" => label, "label__empty" => label__empty, "label__ic" => label__ic, "label__ie" => label__ie, "label__iew" => label__iew, "label__iregex" => label__iregex, "label__isw" => label__isw, "label__n" => label__n, "label__nic" => label__nic, "label__nie" => label__nie, "label__niew" => label__niew, "label__nisw" => label__nisw, "label__regex" => label__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_type" => object_type, "object_type__ic" => object_type__ic, "object_type__ie" => object_type__ie, "object_type__iew" => object_type__iew, "object_type__iregex" => object_type__iregex, "object_type__isw" => object_type__isw, "object_type__n" => object_type__n, "object_type__nic" => object_type__nic, "object_type__nie" => object_type__nie, "object_type__niew" => object_type__niew, "object_type__nisw" => object_type__nisw, "object_type__regex" => object_type__regex, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "related_object_type" => related_object_type, "related_object_type__n" => related_object_type__n, "related_object_type_id" => related_object_type_id, "related_object_type_id__n" => related_object_type_id__n, "required" => required, "search_weight" => search_weight, "search_weight__empty" => search_weight__empty, "search_weight__gt" => search_weight__gt, "search_weight__gte" => search_weight__gte, "search_weight__lt" => search_weight__lt, "search_weight__lte" => search_weight__lte, "search_weight__n" => search_weight__n, "type" => _type, "type__empty" => type__empty, "type__ic" => type__ic, "type__ie" => type__ie, "type__iew" => type__iew, "type__iregex" => type__iregex, "type__isw" => type__isw, "type__n" => type__n, "type__nic" => type__nic, "type__nie" => type__nie, "type__niew" => type__niew, "type__nisw" => type__nisw, "type__regex" => type__regex, "ui_editable" => ui_editable, "ui_visible" => ui_visible, "unique" => unique, "updated_by_request" => updated_by_request, "validation_maximum" => validation_maximum, "validation_maximum__empty" => validation_maximum__empty, "validation_maximum__gt" => validation_maximum__gt, "validation_maximum__gte" => validation_maximum__gte, "validation_maximum__lt" => validation_maximum__lt, "validation_maximum__lte" => validation_maximum__lte, "validation_maximum__n" => validation_maximum__n, "validation_minimum" => validation_minimum, "validation_minimum__empty" => validation_minimum__empty, "validation_minimum__gt" => validation_minimum__gt, "validation_minimum__gte" => validation_minimum__gte, "validation_minimum__lt" => validation_minimum__lt, "validation_minimum__lte" => validation_minimum__lte, "validation_minimum__n" => validation_minimum__n, "validation_regex" => validation_regex, "validation_regex__empty" => validation_regex__empty, "validation_regex__ic" => validation_regex__ic, "validation_regex__ie" => validation_regex__ie, "validation_regex__iew" => validation_regex__iew, "validation_regex__iregex" => validation_regex__iregex, "validation_regex__isw" => validation_regex__isw, "validation_regex__n" => validation_regex__n, "validation_regex__nic" => validation_regex__nic, "validation_regex__nie" => validation_regex__nie, "validation_regex__niew" => validation_regex__niew, "validation_regex__nisw" => validation_regex__nisw, "validation_regex__regex" => validation_regex__regex, "weight" => weight, "weight__empty" => weight__empty, "weight__gt" => weight__gt, "weight__gte" => weight__gte, "weight__lt" => weight__lt, "weight__lte" => weight__lte, "weight__n" => weight__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a custom field object.
    def partial_update(id : Int32, patched_writable_custom_field_request : NetboxClient::PatchedWritableCustomFieldRequest? = nil) : Response(NetboxClient::CustomField)
      @conn.request(NetboxClient::CustomField,
        method: :PATCH,
        path: "/api/extras/custom-fields/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_custom_field_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a custom field object.
    def retrieve(id : Int32) : Response(NetboxClient::CustomField)
      @conn.request(NetboxClient::CustomField,
        method: :GET,
        path: "/api/extras/custom-fields/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a custom field object.
    def update(id : Int32, writable_custom_field_request : NetboxClient::WritableCustomFieldRequest) : Response(NetboxClient::CustomField)
      @conn.request(NetboxClient::CustomField,
        method: :PUT,
        path: "/api/extras/custom-fields/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_custom_field_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
