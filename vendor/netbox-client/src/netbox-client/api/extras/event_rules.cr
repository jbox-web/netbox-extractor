require "json"

module NetboxClient
  module Api
  class Extras::EventRules
    def initialize(@conn : Connection); end

    #  Delete a list of event rule objects.
    def bulk_destroy(event_rule_request : Array(NetboxClient::EventRuleRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/event-rules/",
        body: event_rule_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of event rule objects.
    def bulk_partial_update(event_rule_request : Array(NetboxClient::EventRuleRequest)) : Response(Array(NetboxClient::EventRule))
      @conn.request(Array(NetboxClient::EventRule),
        method: :PATCH,
        path: "/api/extras/event-rules/",
        body: event_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of event rule objects.
    def bulk_update(event_rule_request : Array(NetboxClient::EventRuleRequest)) : Response(Array(NetboxClient::EventRule))
      @conn.request(Array(NetboxClient::EventRule),
        method: :PUT,
        path: "/api/extras/event-rules/",
        body: event_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of event rule objects.
    def create(extras_event_rules_create_request : NetboxClient::ExtrasEventRulesCreateRequest) : Response(NetboxClient::EventRule)
      @conn.request(NetboxClient::EventRule,
        method: :POST,
        path: "/api/extras/event-rules/",
        body: extras_event_rules_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a event rule object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/event-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of event rule objects.
    def list(*, action_object_id : Array(Int32)? = nil, action_object_id__empty : Array(Int32)? = nil, action_object_id__gt : Array(Int32)? = nil, action_object_id__gte : Array(Int32)? = nil, action_object_id__lt : Array(Int32)? = nil, action_object_id__lte : Array(Int32)? = nil, action_object_id__n : Array(Int32)? = nil, action_object_type : String? = nil, action_object_type__n : String? = nil, action_type : Array(String)? = nil, action_type__empty : Bool? = nil, action_type__ic : Array(String)? = nil, action_type__ie : Array(String)? = nil, action_type__iew : Array(String)? = nil, action_type__iregex : Array(String)? = nil, action_type__isw : Array(String)? = nil, action_type__n : Array(String)? = nil, action_type__nic : Array(String)? = nil, action_type__nie : Array(String)? = nil, action_type__niew : Array(String)? = nil, action_type__nisw : Array(String)? = nil, action_type__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, enabled : Bool? = nil, event_type : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, object_type : String? = nil, object_type__ic : String? = nil, object_type__ie : String? = nil, object_type__iew : String? = nil, object_type__iregex : String? = nil, object_type__isw : String? = nil, object_type__n : String? = nil, object_type__nic : String? = nil, object_type__nie : String? = nil, object_type__niew : String? = nil, object_type__nisw : String? = nil, object_type__regex : String? = nil, object_type_id : Array(Int32)? = nil, object_type_id__n : Array(Int32)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedEventRuleList)
      @conn.request(NetboxClient::PaginatedEventRuleList,
        method: :GET,
        path: "/api/extras/event-rules/",
        query: { "action_object_id" => action_object_id, "action_object_id__empty" => action_object_id__empty, "action_object_id__gt" => action_object_id__gt, "action_object_id__gte" => action_object_id__gte, "action_object_id__lt" => action_object_id__lt, "action_object_id__lte" => action_object_id__lte, "action_object_id__n" => action_object_id__n, "action_object_type" => action_object_type, "action_object_type__n" => action_object_type__n, "action_type" => action_type, "action_type__empty" => action_type__empty, "action_type__ic" => action_type__ic, "action_type__ie" => action_type__ie, "action_type__iew" => action_type__iew, "action_type__iregex" => action_type__iregex, "action_type__isw" => action_type__isw, "action_type__n" => action_type__n, "action_type__nic" => action_type__nic, "action_type__nie" => action_type__nie, "action_type__niew" => action_type__niew, "action_type__nisw" => action_type__nisw, "action_type__regex" => action_type__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "enabled" => enabled, "event_type" => event_type, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "object_type" => object_type, "object_type__ic" => object_type__ic, "object_type__ie" => object_type__ie, "object_type__iew" => object_type__iew, "object_type__iregex" => object_type__iregex, "object_type__isw" => object_type__isw, "object_type__n" => object_type__n, "object_type__nic" => object_type__nic, "object_type__nie" => object_type__nie, "object_type__niew" => object_type__niew, "object_type__nisw" => object_type__nisw, "object_type__regex" => object_type__regex, "object_type_id" => object_type_id, "object_type_id__n" => object_type_id__n, "offset" => offset, "ordering" => ordering, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a event rule object.
    def partial_update(id : Int32, patched_writable_event_rule_request : NetboxClient::PatchedWritableEventRuleRequest? = nil) : Response(NetboxClient::EventRule)
      @conn.request(NetboxClient::EventRule,
        method: :PATCH,
        path: "/api/extras/event-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_event_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a event rule object.
    def retrieve(id : Int32) : Response(NetboxClient::EventRule)
      @conn.request(NetboxClient::EventRule,
        method: :GET,
        path: "/api/extras/event-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a event rule object.
    def update(id : Int32, writable_event_rule_request : NetboxClient::WritableEventRuleRequest) : Response(NetboxClient::EventRule)
      @conn.request(NetboxClient::EventRule,
        method: :PUT,
        path: "/api/extras/event-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_event_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
