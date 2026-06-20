require "json"

module NetboxClient
  module Api
  class Ipam::VlanTranslationRules
    def initialize(@conn : Connection); end

    #  Delete a list of VLAN translation rule objects.
    def bulk_destroy(vlan_translation_rule_request : Array(NetboxClient::VLANTranslationRuleRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vlan-translation-rules/",
        body: vlan_translation_rule_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of VLAN translation rule objects.
    def bulk_partial_update(vlan_translation_rule_request : Array(NetboxClient::VLANTranslationRuleRequest)) : Response(Array(NetboxClient::VLANTranslationRule))
      @conn.request(Array(NetboxClient::VLANTranslationRule),
        method: :PATCH,
        path: "/api/ipam/vlan-translation-rules/",
        body: vlan_translation_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of VLAN translation rule objects.
    def bulk_update(vlan_translation_rule_request : Array(NetboxClient::VLANTranslationRuleRequest)) : Response(Array(NetboxClient::VLANTranslationRule))
      @conn.request(Array(NetboxClient::VLANTranslationRule),
        method: :PUT,
        path: "/api/ipam/vlan-translation-rules/",
        body: vlan_translation_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of VLAN translation rule objects.
    def create(ipam_vlan_translation_rules_create_request : NetboxClient::IpamVlanTranslationRulesCreateRequest) : Response(NetboxClient::VLANTranslationRule)
      @conn.request(NetboxClient::VLANTranslationRule,
        method: :POST,
        path: "/api/ipam/vlan-translation-rules/",
        body: ipam_vlan_translation_rules_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a VLAN translation rule object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/ipam/vlan-translation-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of VLAN translation rule objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, local_vid : Array(Int32)? = nil, local_vid__empty : Bool? = nil, local_vid__gt : Array(Int32)? = nil, local_vid__gte : Array(Int32)? = nil, local_vid__lt : Array(Int32)? = nil, local_vid__lte : Array(Int32)? = nil, local_vid__n : Array(Int32)? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, policy : Array(String)? = nil, policy__n : Array(String)? = nil, policy_id : Array(Int32)? = nil, policy_id__n : Array(Int32)? = nil, q : String? = nil, remote_vid : Array(Int32)? = nil, remote_vid__empty : Bool? = nil, remote_vid__gt : Array(Int32)? = nil, remote_vid__gte : Array(Int32)? = nil, remote_vid__lt : Array(Int32)? = nil, remote_vid__lte : Array(Int32)? = nil, remote_vid__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedVLANTranslationRuleList)
      @conn.request(NetboxClient::PaginatedVLANTranslationRuleList,
        method: :GET,
        path: "/api/ipam/vlan-translation-rules/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "local_vid" => local_vid, "local_vid__empty" => local_vid__empty, "local_vid__gt" => local_vid__gt, "local_vid__gte" => local_vid__gte, "local_vid__lt" => local_vid__lt, "local_vid__lte" => local_vid__lte, "local_vid__n" => local_vid__n, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "policy" => policy, "policy__n" => policy__n, "policy_id" => policy_id, "policy_id__n" => policy_id__n, "q" => q, "remote_vid" => remote_vid, "remote_vid__empty" => remote_vid__empty, "remote_vid__gt" => remote_vid__gt, "remote_vid__gte" => remote_vid__gte, "remote_vid__lt" => remote_vid__lt, "remote_vid__lte" => remote_vid__lte, "remote_vid__n" => remote_vid__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a VLAN translation rule object.
    def partial_update(id : Int32, patched_vlan_translation_rule_request : NetboxClient::PatchedVLANTranslationRuleRequest? = nil) : Response(NetboxClient::VLANTranslationRule)
      @conn.request(NetboxClient::VLANTranslationRule,
        method: :PATCH,
        path: "/api/ipam/vlan-translation-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_vlan_translation_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a VLAN translation rule object.
    def retrieve(id : Int32) : Response(NetboxClient::VLANTranslationRule)
      @conn.request(NetboxClient::VLANTranslationRule,
        method: :GET,
        path: "/api/ipam/vlan-translation-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a VLAN translation rule object.
    def update(id : Int32, vlan_translation_rule_request : NetboxClient::VLANTranslationRuleRequest) : Response(NetboxClient::VLANTranslationRule)
      @conn.request(NetboxClient::VLANTranslationRule,
        method: :PUT,
        path: "/api/ipam/vlan-translation-rules/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: vlan_translation_rule_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
