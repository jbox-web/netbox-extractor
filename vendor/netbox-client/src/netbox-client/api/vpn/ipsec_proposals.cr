require "json"

module NetboxClient
  module Api
  class Vpn::IpsecProposals
    def initialize(@conn : Connection); end

    #  Delete a list of IPSec proposal objects.
    def bulk_destroy(ip_sec_proposal_request : Array(NetboxClient::IPSecProposalRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/ipsec-proposals/",
        body: ip_sec_proposal_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of IPSec proposal objects.
    def bulk_partial_update(ip_sec_proposal_request : Array(NetboxClient::IPSecProposalRequest)) : Response(Array(NetboxClient::IPSecProposal))
      @conn.request(Array(NetboxClient::IPSecProposal),
        method: :PATCH,
        path: "/api/vpn/ipsec-proposals/",
        body: ip_sec_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of IPSec proposal objects.
    def bulk_update(ip_sec_proposal_request : Array(NetboxClient::IPSecProposalRequest)) : Response(Array(NetboxClient::IPSecProposal))
      @conn.request(Array(NetboxClient::IPSecProposal),
        method: :PUT,
        path: "/api/vpn/ipsec-proposals/",
        body: ip_sec_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of IPSec proposal objects.
    def create(vpn_ipsec_proposals_create_request : NetboxClient::VpnIpsecProposalsCreateRequest) : Response(NetboxClient::IPSecProposal)
      @conn.request(NetboxClient::IPSecProposal,
        method: :POST,
        path: "/api/vpn/ipsec-proposals/",
        body: vpn_ipsec_proposals_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a IPSec proposal object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/vpn/ipsec-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of IPSec proposal objects.
    def list(*, authentication_algorithm : Array(String)? = nil, authentication_algorithm__empty : Bool? = nil, authentication_algorithm__ic : Array(String)? = nil, authentication_algorithm__ie : Array(String)? = nil, authentication_algorithm__iew : Array(String)? = nil, authentication_algorithm__iregex : Array(String)? = nil, authentication_algorithm__isw : Array(String)? = nil, authentication_algorithm__n : Array(String)? = nil, authentication_algorithm__nic : Array(String)? = nil, authentication_algorithm__nie : Array(String)? = nil, authentication_algorithm__niew : Array(String)? = nil, authentication_algorithm__nisw : Array(String)? = nil, authentication_algorithm__regex : Array(String)? = nil, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, encryption_algorithm : Array(String)? = nil, encryption_algorithm__empty : Bool? = nil, encryption_algorithm__ic : Array(String)? = nil, encryption_algorithm__ie : Array(String)? = nil, encryption_algorithm__iew : Array(String)? = nil, encryption_algorithm__iregex : Array(String)? = nil, encryption_algorithm__isw : Array(String)? = nil, encryption_algorithm__n : Array(String)? = nil, encryption_algorithm__nic : Array(String)? = nil, encryption_algorithm__nie : Array(String)? = nil, encryption_algorithm__niew : Array(String)? = nil, encryption_algorithm__nisw : Array(String)? = nil, encryption_algorithm__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, ipsec_policy : Array(String)? = nil, ipsec_policy__n : Array(String)? = nil, ipsec_policy_id : Array(Int32)? = nil, ipsec_policy_id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, sa_lifetime_data : Array(Int32)? = nil, sa_lifetime_data__empty : Bool? = nil, sa_lifetime_data__gt : Array(Int32)? = nil, sa_lifetime_data__gte : Array(Int32)? = nil, sa_lifetime_data__lt : Array(Int32)? = nil, sa_lifetime_data__lte : Array(Int32)? = nil, sa_lifetime_data__n : Array(Int32)? = nil, sa_lifetime_seconds : Array(Int32)? = nil, sa_lifetime_seconds__empty : Bool? = nil, sa_lifetime_seconds__gt : Array(Int32)? = nil, sa_lifetime_seconds__gte : Array(Int32)? = nil, sa_lifetime_seconds__lt : Array(Int32)? = nil, sa_lifetime_seconds__lte : Array(Int32)? = nil, sa_lifetime_seconds__n : Array(Int32)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedIPSecProposalList)
      @conn.request(NetboxClient::PaginatedIPSecProposalList,
        method: :GET,
        path: "/api/vpn/ipsec-proposals/",
        query: { "authentication_algorithm" => authentication_algorithm, "authentication_algorithm__empty" => authentication_algorithm__empty, "authentication_algorithm__ic" => authentication_algorithm__ic, "authentication_algorithm__ie" => authentication_algorithm__ie, "authentication_algorithm__iew" => authentication_algorithm__iew, "authentication_algorithm__iregex" => authentication_algorithm__iregex, "authentication_algorithm__isw" => authentication_algorithm__isw, "authentication_algorithm__n" => authentication_algorithm__n, "authentication_algorithm__nic" => authentication_algorithm__nic, "authentication_algorithm__nie" => authentication_algorithm__nie, "authentication_algorithm__niew" => authentication_algorithm__niew, "authentication_algorithm__nisw" => authentication_algorithm__nisw, "authentication_algorithm__regex" => authentication_algorithm__regex, "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "encryption_algorithm" => encryption_algorithm, "encryption_algorithm__empty" => encryption_algorithm__empty, "encryption_algorithm__ic" => encryption_algorithm__ic, "encryption_algorithm__ie" => encryption_algorithm__ie, "encryption_algorithm__iew" => encryption_algorithm__iew, "encryption_algorithm__iregex" => encryption_algorithm__iregex, "encryption_algorithm__isw" => encryption_algorithm__isw, "encryption_algorithm__n" => encryption_algorithm__n, "encryption_algorithm__nic" => encryption_algorithm__nic, "encryption_algorithm__nie" => encryption_algorithm__nie, "encryption_algorithm__niew" => encryption_algorithm__niew, "encryption_algorithm__nisw" => encryption_algorithm__nisw, "encryption_algorithm__regex" => encryption_algorithm__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "ipsec_policy" => ipsec_policy, "ipsec_policy__n" => ipsec_policy__n, "ipsec_policy_id" => ipsec_policy_id, "ipsec_policy_id__n" => ipsec_policy_id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q, "sa_lifetime_data" => sa_lifetime_data, "sa_lifetime_data__empty" => sa_lifetime_data__empty, "sa_lifetime_data__gt" => sa_lifetime_data__gt, "sa_lifetime_data__gte" => sa_lifetime_data__gte, "sa_lifetime_data__lt" => sa_lifetime_data__lt, "sa_lifetime_data__lte" => sa_lifetime_data__lte, "sa_lifetime_data__n" => sa_lifetime_data__n, "sa_lifetime_seconds" => sa_lifetime_seconds, "sa_lifetime_seconds__empty" => sa_lifetime_seconds__empty, "sa_lifetime_seconds__gt" => sa_lifetime_seconds__gt, "sa_lifetime_seconds__gte" => sa_lifetime_seconds__gte, "sa_lifetime_seconds__lt" => sa_lifetime_seconds__lt, "sa_lifetime_seconds__lte" => sa_lifetime_seconds__lte, "sa_lifetime_seconds__n" => sa_lifetime_seconds__n, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a IPSec proposal object.
    def partial_update(id : Int32, patched_writable_ip_sec_proposal_request : NetboxClient::PatchedWritableIPSecProposalRequest? = nil) : Response(NetboxClient::IPSecProposal)
      @conn.request(NetboxClient::IPSecProposal,
        method: :PATCH,
        path: "/api/vpn/ipsec-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_ip_sec_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a IPSec proposal object.
    def retrieve(id : Int32) : Response(NetboxClient::IPSecProposal)
      @conn.request(NetboxClient::IPSecProposal,
        method: :GET,
        path: "/api/vpn/ipsec-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a IPSec proposal object.
    def update(id : Int32, writable_ip_sec_proposal_request : NetboxClient::WritableIPSecProposalRequest) : Response(NetboxClient::IPSecProposal)
      @conn.request(NetboxClient::IPSecProposal,
        method: :PUT,
        path: "/api/vpn/ipsec-proposals/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_ip_sec_proposal_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
