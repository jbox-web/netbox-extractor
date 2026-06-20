require "json"

module NetboxClient
  module Api
  class Extras::Webhooks
    def initialize(@conn : Connection); end

    #  Delete a list of webhook objects.
    def bulk_destroy(webhook_request : Array(NetboxClient::WebhookRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/webhooks/",
        body: webhook_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of webhook objects.
    def bulk_partial_update(webhook_request : Array(NetboxClient::WebhookRequest)) : Response(Array(NetboxClient::Webhook))
      @conn.request(Array(NetboxClient::Webhook),
        method: :PATCH,
        path: "/api/extras/webhooks/",
        body: webhook_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of webhook objects.
    def bulk_update(webhook_request : Array(NetboxClient::WebhookRequest)) : Response(Array(NetboxClient::Webhook))
      @conn.request(Array(NetboxClient::Webhook),
        method: :PUT,
        path: "/api/extras/webhooks/",
        body: webhook_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of webhook objects.
    def create(extras_webhooks_create_request : NetboxClient::ExtrasWebhooksCreateRequest) : Response(NetboxClient::Webhook)
      @conn.request(NetboxClient::Webhook,
        method: :POST,
        path: "/api/extras/webhooks/",
        body: extras_webhooks_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a webhook object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/webhooks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of webhook objects.
    def list(*, ca_file_path : Array(String)? = nil, ca_file_path__empty : Bool? = nil, ca_file_path__ic : Array(String)? = nil, ca_file_path__ie : Array(String)? = nil, ca_file_path__iew : Array(String)? = nil, ca_file_path__iregex : Array(String)? = nil, ca_file_path__isw : Array(String)? = nil, ca_file_path__n : Array(String)? = nil, ca_file_path__nic : Array(String)? = nil, ca_file_path__nie : Array(String)? = nil, ca_file_path__niew : Array(String)? = nil, ca_file_path__nisw : Array(String)? = nil, ca_file_path__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, http_content_type : Array(String)? = nil, http_content_type__empty : Bool? = nil, http_content_type__ic : Array(String)? = nil, http_content_type__ie : Array(String)? = nil, http_content_type__iew : Array(String)? = nil, http_content_type__iregex : Array(String)? = nil, http_content_type__isw : Array(String)? = nil, http_content_type__n : Array(String)? = nil, http_content_type__nic : Array(String)? = nil, http_content_type__nie : Array(String)? = nil, http_content_type__niew : Array(String)? = nil, http_content_type__nisw : Array(String)? = nil, http_content_type__regex : Array(String)? = nil, http_method : Array(String)? = nil, http_method__empty : Bool? = nil, http_method__ic : Array(String)? = nil, http_method__ie : Array(String)? = nil, http_method__iew : Array(String)? = nil, http_method__iregex : Array(String)? = nil, http_method__isw : Array(String)? = nil, http_method__n : Array(String)? = nil, http_method__nic : Array(String)? = nil, http_method__nie : Array(String)? = nil, http_method__niew : Array(String)? = nil, http_method__nisw : Array(String)? = nil, http_method__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, payload_url : Array(String)? = nil, q : String? = nil, secret : Array(String)? = nil, secret__empty : Bool? = nil, secret__ic : Array(String)? = nil, secret__ie : Array(String)? = nil, secret__iew : Array(String)? = nil, secret__iregex : Array(String)? = nil, secret__isw : Array(String)? = nil, secret__n : Array(String)? = nil, secret__nic : Array(String)? = nil, secret__nie : Array(String)? = nil, secret__niew : Array(String)? = nil, secret__nisw : Array(String)? = nil, secret__regex : Array(String)? = nil, ssl_verification : Bool? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedWebhookList)
      @conn.request(NetboxClient::PaginatedWebhookList,
        method: :GET,
        path: "/api/extras/webhooks/",
        query: { "ca_file_path" => ca_file_path, "ca_file_path__empty" => ca_file_path__empty, "ca_file_path__ic" => ca_file_path__ic, "ca_file_path__ie" => ca_file_path__ie, "ca_file_path__iew" => ca_file_path__iew, "ca_file_path__iregex" => ca_file_path__iregex, "ca_file_path__isw" => ca_file_path__isw, "ca_file_path__n" => ca_file_path__n, "ca_file_path__nic" => ca_file_path__nic, "ca_file_path__nie" => ca_file_path__nie, "ca_file_path__niew" => ca_file_path__niew, "ca_file_path__nisw" => ca_file_path__nisw, "ca_file_path__regex" => ca_file_path__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "http_content_type" => http_content_type, "http_content_type__empty" => http_content_type__empty, "http_content_type__ic" => http_content_type__ic, "http_content_type__ie" => http_content_type__ie, "http_content_type__iew" => http_content_type__iew, "http_content_type__iregex" => http_content_type__iregex, "http_content_type__isw" => http_content_type__isw, "http_content_type__n" => http_content_type__n, "http_content_type__nic" => http_content_type__nic, "http_content_type__nie" => http_content_type__nie, "http_content_type__niew" => http_content_type__niew, "http_content_type__nisw" => http_content_type__nisw, "http_content_type__regex" => http_content_type__regex, "http_method" => http_method, "http_method__empty" => http_method__empty, "http_method__ic" => http_method__ic, "http_method__ie" => http_method__ie, "http_method__iew" => http_method__iew, "http_method__iregex" => http_method__iregex, "http_method__isw" => http_method__isw, "http_method__n" => http_method__n, "http_method__nic" => http_method__nic, "http_method__nie" => http_method__nie, "http_method__niew" => http_method__niew, "http_method__nisw" => http_method__nisw, "http_method__regex" => http_method__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "payload_url" => payload_url, "q" => q, "secret" => secret, "secret__empty" => secret__empty, "secret__ic" => secret__ic, "secret__ie" => secret__ie, "secret__iew" => secret__iew, "secret__iregex" => secret__iregex, "secret__isw" => secret__isw, "secret__n" => secret__n, "secret__nic" => secret__nic, "secret__nie" => secret__nie, "secret__niew" => secret__niew, "secret__nisw" => secret__nisw, "secret__regex" => secret__regex, "ssl_verification" => ssl_verification, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a webhook object.
    def partial_update(id : Int32, patched_webhook_request : NetboxClient::PatchedWebhookRequest? = nil) : Response(NetboxClient::Webhook)
      @conn.request(NetboxClient::Webhook,
        method: :PATCH,
        path: "/api/extras/webhooks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_webhook_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a webhook object.
    def retrieve(id : Int32) : Response(NetboxClient::Webhook)
      @conn.request(NetboxClient::Webhook,
        method: :GET,
        path: "/api/extras/webhooks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a webhook object.
    def update(id : Int32, webhook_request : NetboxClient::WebhookRequest) : Response(NetboxClient::Webhook)
      @conn.request(NetboxClient::Webhook,
        method: :PUT,
        path: "/api/extras/webhooks/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: webhook_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
