require "json"

module NetboxClient
  module Api
  class Vpn::IkePolicies
    def initialize(@conn : Connection); end

    #  Delete a list of IKE policy objects.
    def bulk_destroy(ike_policy_request : Array(NetboxClient::IKEPolicyRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/ike-policies/",
        body: ike_policy_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of IKE policy objects.
    def bulk_partial_update(ike_policy_request : Array(NetboxClient::IKEPolicyRequest)) : Response(Array(NetboxClient::IKEPolicy))
      @conn.request(Array(NetboxClient::IKEPolicy),
        method: :PATCH,
        path: "/api/vpn/ike-policies/",
        body: ike_policy_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of IKE policy objects.
    def bulk_update(ike_policy_request : Array(NetboxClient::IKEPolicyRequest)) : Response(Array(NetboxClient::IKEPolicy))
      @conn.request(Array(NetboxClient::IKEPolicy),
        method: :PUT,
        path: "/api/vpn/ike-policies/",
        body: ike_policy_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of IKE policy objects.
    def create(vpn_ike_policies_create_request : NetboxClient::VpnIkePoliciesCreateRequest) : Response(NetboxClient::IKEPolicy)
      @conn.request(NetboxClient::IKEPolicy,
        method: :POST,
        path: "/api/vpn/ike-policies/",
        body: vpn_ike_policies_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a IKE policy object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/ike-policies/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of IKE policy objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, ike_proposal : Array(String)? = nil, ike_proposal__n : Array(String)? = nil, ike_proposal_id : Array(Int32)? = nil, ike_proposal_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, mode : Array(String)? = nil, mode__empty : Bool? = nil, mode__ic : Array(String)? = nil, mode__ie : Array(String)? = nil, mode__iew : Array(String)? = nil, mode__iregex : Array(String)? = nil, mode__isw : Array(String)? = nil, mode__n : Array(String)? = nil, mode__nic : Array(String)? = nil, mode__nie : Array(String)? = nil, mode__niew : Array(String)? = nil, mode__nisw : Array(String)? = nil, mode__regex : Array(String)? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, preshared_key : String? = nil, preshared_key__ic : String? = nil, preshared_key__ie : String? = nil, preshared_key__iew : String? = nil, preshared_key__iregex : String? = nil, preshared_key__isw : String? = nil, preshared_key__n : String? = nil, preshared_key__nic : String? = nil, preshared_key__nie : String? = nil, preshared_key__niew : String? = nil, preshared_key__nisw : String? = nil, preshared_key__regex : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil, version : Array(Int32)? = nil, version__ic : Array(Int32)? = nil, version__ie : Array(Int32)? = nil, version__iew : Array(Int32)? = nil, version__iregex : Array(Int32)? = nil, version__isw : Array(Int32)? = nil, version__n : Array(Int32)? = nil, version__nic : Array(Int32)? = nil, version__nie : Array(Int32)? = nil, version__niew : Array(Int32)? = nil, version__nisw : Array(Int32)? = nil, version__regex : Array(Int32)? = nil) : Response(NetboxClient::PaginatedIKEPolicyList)
      @conn.request(NetboxClient::PaginatedIKEPolicyList,
        method: :GET,
        path: "/api/vpn/ike-policies/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "ike_proposal" => ike_proposal, "ike_proposal__n" => ike_proposal__n, "ike_proposal_id" => ike_proposal_id, "ike_proposal_id__n" => ike_proposal_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "mode" => mode, "mode__empty" => mode__empty, "mode__ic" => mode__ic, "mode__ie" => mode__ie, "mode__iew" => mode__iew, "mode__iregex" => mode__iregex, "mode__isw" => mode__isw, "mode__n" => mode__n, "mode__nic" => mode__nic, "mode__nie" => mode__nie, "mode__niew" => mode__niew, "mode__nisw" => mode__nisw, "mode__regex" => mode__regex, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "preshared_key" => preshared_key, "preshared_key__ic" => preshared_key__ic, "preshared_key__ie" => preshared_key__ie, "preshared_key__iew" => preshared_key__iew, "preshared_key__iregex" => preshared_key__iregex, "preshared_key__isw" => preshared_key__isw, "preshared_key__n" => preshared_key__n, "preshared_key__nic" => preshared_key__nic, "preshared_key__nie" => preshared_key__nie, "preshared_key__niew" => preshared_key__niew, "preshared_key__nisw" => preshared_key__nisw, "preshared_key__regex" => preshared_key__regex, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request, "version" => version, "version__ic" => version__ic, "version__ie" => version__ie, "version__iew" => version__iew, "version__iregex" => version__iregex, "version__isw" => version__isw, "version__n" => version__n, "version__nic" => version__nic, "version__nie" => version__nie, "version__niew" => version__niew, "version__nisw" => version__nisw, "version__regex" => version__regex },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a IKE policy object.
    def partial_update(id : Int32, patched_writable_ike_policy_request : NetboxClient::PatchedWritableIKEPolicyRequest? = nil) : Response(NetboxClient::IKEPolicy)
      @conn.request(NetboxClient::IKEPolicy,
        method: :PATCH,
        path: "/api/vpn/ike-policies/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_ike_policy_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IKE policy object.
    def retrieve(id : Int32) : Response(NetboxClient::IKEPolicy)
      @conn.request(NetboxClient::IKEPolicy,
        method: :GET,
        path: "/api/vpn/ike-policies/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a IKE policy object.
    def update(id : Int32, writable_ike_policy_request : NetboxClient::WritableIKEPolicyRequest) : Response(NetboxClient::IKEPolicy)
      @conn.request(NetboxClient::IKEPolicy,
        method: :PUT,
        path: "/api/vpn/ike-policies/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_ike_policy_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
