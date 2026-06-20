require "json"

module NetboxClient
  module Api
  class Vpn::IkeProposals
    def initialize(@conn : Connection); end

    #  Delete a list of IKE proposal objects.
    def bulk_destroy(ike_proposal_request : Array(NetboxClient::IKEProposalRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/ike-proposals/",
        body: ike_proposal_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of IKE proposal objects.
    def bulk_partial_update(ike_proposal_request : Array(NetboxClient::IKEProposalRequest)) : Response(Array(NetboxClient::IKEProposal))
      @conn.request(Array(NetboxClient::IKEProposal),
        method: :PATCH,
        path: "/api/vpn/ike-proposals/",
        body: ike_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of IKE proposal objects.
    def bulk_update(ike_proposal_request : Array(NetboxClient::IKEProposalRequest)) : Response(Array(NetboxClient::IKEProposal))
      @conn.request(Array(NetboxClient::IKEProposal),
        method: :PUT,
        path: "/api/vpn/ike-proposals/",
        body: ike_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of IKE proposal objects.
    def create(vpn_ike_proposals_create_request : NetboxClient::VpnIkeProposalsCreateRequest) : Response(NetboxClient::IKEProposal)
      @conn.request(NetboxClient::IKEProposal,
        method: :POST,
        path: "/api/vpn/ike-proposals/",
        body: vpn_ike_proposals_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a IKE proposal object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/ike-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of IKE proposal objects.
    def list(*, authentication_algorithm : Array(String)? = nil, authentication_algorithm__empty : Bool? = nil, authentication_algorithm__ic : Array(String)? = nil, authentication_algorithm__ie : Array(String)? = nil, authentication_algorithm__iew : Array(String)? = nil, authentication_algorithm__iregex : Array(String)? = nil, authentication_algorithm__isw : Array(String)? = nil, authentication_algorithm__n : Array(String)? = nil, authentication_algorithm__nic : Array(String)? = nil, authentication_algorithm__nie : Array(String)? = nil, authentication_algorithm__niew : Array(String)? = nil, authentication_algorithm__nisw : Array(String)? = nil, authentication_algorithm__regex : Array(String)? = nil, authentication_method : Array(String)? = nil, authentication_method__empty : Bool? = nil, authentication_method__ic : Array(String)? = nil, authentication_method__ie : Array(String)? = nil, authentication_method__iew : Array(String)? = nil, authentication_method__iregex : Array(String)? = nil, authentication_method__isw : Array(String)? = nil, authentication_method__n : Array(String)? = nil, authentication_method__nic : Array(String)? = nil, authentication_method__nie : Array(String)? = nil, authentication_method__niew : Array(String)? = nil, authentication_method__nisw : Array(String)? = nil, authentication_method__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, encryption_algorithm : Array(String)? = nil, encryption_algorithm__empty : Bool? = nil, encryption_algorithm__ic : Array(String)? = nil, encryption_algorithm__ie : Array(String)? = nil, encryption_algorithm__iew : Array(String)? = nil, encryption_algorithm__iregex : Array(String)? = nil, encryption_algorithm__isw : Array(String)? = nil, encryption_algorithm__n : Array(String)? = nil, encryption_algorithm__nic : Array(String)? = nil, encryption_algorithm__nie : Array(String)? = nil, encryption_algorithm__niew : Array(String)? = nil, encryption_algorithm__nisw : Array(String)? = nil, encryption_algorithm__regex : Array(String)? = nil, group : Array(Int32)? = nil, group__ic : Array(Int32)? = nil, group__ie : Array(Int32)? = nil, group__iew : Array(Int32)? = nil, group__iregex : Array(Int32)? = nil, group__isw : Array(Int32)? = nil, group__n : Array(Int32)? = nil, group__nic : Array(Int32)? = nil, group__nie : Array(Int32)? = nil, group__niew : Array(Int32)? = nil, group__nisw : Array(Int32)? = nil, group__regex : Array(Int32)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, ike_policy : Array(String)? = nil, ike_policy__n : Array(String)? = nil, ike_policy_id : Array(Int32)? = nil, ike_policy_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, sa_lifetime : Array(Int32)? = nil, sa_lifetime__empty : Bool? = nil, sa_lifetime__gt : Array(Int32)? = nil, sa_lifetime__gte : Array(Int32)? = nil, sa_lifetime__lt : Array(Int32)? = nil, sa_lifetime__lte : Array(Int32)? = nil, sa_lifetime__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedIKEProposalList)
      @conn.request(NetboxClient::PaginatedIKEProposalList,
        method: :GET,
        path: "/api/vpn/ike-proposals/",
        query: { "authentication_algorithm" => authentication_algorithm, "authentication_algorithm__empty" => authentication_algorithm__empty, "authentication_algorithm__ic" => authentication_algorithm__ic, "authentication_algorithm__ie" => authentication_algorithm__ie, "authentication_algorithm__iew" => authentication_algorithm__iew, "authentication_algorithm__iregex" => authentication_algorithm__iregex, "authentication_algorithm__isw" => authentication_algorithm__isw, "authentication_algorithm__n" => authentication_algorithm__n, "authentication_algorithm__nic" => authentication_algorithm__nic, "authentication_algorithm__nie" => authentication_algorithm__nie, "authentication_algorithm__niew" => authentication_algorithm__niew, "authentication_algorithm__nisw" => authentication_algorithm__nisw, "authentication_algorithm__regex" => authentication_algorithm__regex, "authentication_method" => authentication_method, "authentication_method__empty" => authentication_method__empty, "authentication_method__ic" => authentication_method__ic, "authentication_method__ie" => authentication_method__ie, "authentication_method__iew" => authentication_method__iew, "authentication_method__iregex" => authentication_method__iregex, "authentication_method__isw" => authentication_method__isw, "authentication_method__n" => authentication_method__n, "authentication_method__nic" => authentication_method__nic, "authentication_method__nie" => authentication_method__nie, "authentication_method__niew" => authentication_method__niew, "authentication_method__nisw" => authentication_method__nisw, "authentication_method__regex" => authentication_method__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "encryption_algorithm" => encryption_algorithm, "encryption_algorithm__empty" => encryption_algorithm__empty, "encryption_algorithm__ic" => encryption_algorithm__ic, "encryption_algorithm__ie" => encryption_algorithm__ie, "encryption_algorithm__iew" => encryption_algorithm__iew, "encryption_algorithm__iregex" => encryption_algorithm__iregex, "encryption_algorithm__isw" => encryption_algorithm__isw, "encryption_algorithm__n" => encryption_algorithm__n, "encryption_algorithm__nic" => encryption_algorithm__nic, "encryption_algorithm__nie" => encryption_algorithm__nie, "encryption_algorithm__niew" => encryption_algorithm__niew, "encryption_algorithm__nisw" => encryption_algorithm__nisw, "encryption_algorithm__regex" => encryption_algorithm__regex, "group" => group, "group__ic" => group__ic, "group__ie" => group__ie, "group__iew" => group__iew, "group__iregex" => group__iregex, "group__isw" => group__isw, "group__n" => group__n, "group__nic" => group__nic, "group__nie" => group__nie, "group__niew" => group__niew, "group__nisw" => group__nisw, "group__regex" => group__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "ike_policy" => ike_policy, "ike_policy__n" => ike_policy__n, "ike_policy_id" => ike_policy_id, "ike_policy_id__n" => ike_policy_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "sa_lifetime" => sa_lifetime, "sa_lifetime__empty" => sa_lifetime__empty, "sa_lifetime__gt" => sa_lifetime__gt, "sa_lifetime__gte" => sa_lifetime__gte, "sa_lifetime__lt" => sa_lifetime__lt, "sa_lifetime__lte" => sa_lifetime__lte, "sa_lifetime__n" => sa_lifetime__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a IKE proposal object.
    def partial_update(id : Int32, patched_writable_ike_proposal_request : NetboxClient::PatchedWritableIKEProposalRequest? = nil) : Response(NetboxClient::IKEProposal)
      @conn.request(NetboxClient::IKEProposal,
        method: :PATCH,
        path: "/api/vpn/ike-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_ike_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IKE proposal object.
    def retrieve(id : Int32) : Response(NetboxClient::IKEProposal)
      @conn.request(NetboxClient::IKEProposal,
        method: :GET,
        path: "/api/vpn/ike-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a IKE proposal object.
    def update(id : Int32, writable_ike_proposal_request : NetboxClient::WritableIKEProposalRequest) : Response(NetboxClient::IKEProposal)
      @conn.request(NetboxClient::IKEProposal,
        method: :PUT,
        path: "/api/vpn/ike-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_ike_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
