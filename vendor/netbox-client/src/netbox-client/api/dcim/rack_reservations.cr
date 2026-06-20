require "json"

module NetboxClient
  module Api
  class Dcim::RackReservations
    def initialize(@conn : Connection); end

    #  Delete a list of rack reservation objects.
    def bulk_destroy(rack_reservation_request : Array(NetboxClient::RackReservationRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/rack-reservations/",
        body: rack_reservation_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of rack reservation objects.
    def bulk_partial_update(rack_reservation_request : Array(NetboxClient::RackReservationRequest)) : Response(Array(NetboxClient::RackReservation))
      @conn.request(Array(NetboxClient::RackReservation),
        method: :PATCH,
        path: "/api/dcim/rack-reservations/",
        body: rack_reservation_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of rack reservation objects.
    def bulk_update(rack_reservation_request : Array(NetboxClient::RackReservationRequest)) : Response(Array(NetboxClient::RackReservation))
      @conn.request(Array(NetboxClient::RackReservation),
        method: :PUT,
        path: "/api/dcim/rack-reservations/",
        body: rack_reservation_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of rack reservation objects.
    def create(dcim_rack_reservations_create_request : NetboxClient::DcimRackReservationsCreateRequest) : Response(NetboxClient::RackReservation)
      @conn.request(NetboxClient::RackReservation,
        method: :POST,
        path: "/api/dcim/rack-reservations/",
        body: dcim_rack_reservations_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a rack reservation object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/dcim/rack-reservations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of rack reservation objects.
    def list(*, created : Array(Time)? = nil, created__empty : Array(Time)? = nil, created__gt : Array(Time)? = nil, created__gte : Array(Time)? = nil, created__lt : Array(Time)? = nil, created__lte : Array(Time)? = nil, created__n : Array(Time)? = nil, created_by_request : String? = nil, description : Array(String)? = nil, description__empty : Bool? = nil, description__ic : Array(String)? = nil, description__ie : Array(String)? = nil, description__iew : Array(String)? = nil, description__iregex : Array(String)? = nil, description__isw : Array(String)? = nil, description__n : Array(String)? = nil, description__nic : Array(String)? = nil, description__nie : Array(String)? = nil, description__niew : Array(String)? = nil, description__nisw : Array(String)? = nil, description__regex : Array(String)? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, location : Array(String)? = nil, location__n : Array(String)? = nil, location_id : Array(String)? = nil, location_id__n : Array(String)? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, rack_id : Array(Int32)? = nil, rack_id__n : Array(Int32)? = nil, region : Array(String)? = nil, region__n : Array(String)? = nil, region_id : Array(String)? = nil, region_id__n : Array(String)? = nil, site : Array(String)? = nil, site__n : Array(String)? = nil, site_group : Array(String)? = nil, site_group__n : Array(String)? = nil, site_group_id : Array(String)? = nil, site_group_id__n : Array(String)? = nil, site_id : Array(Int32)? = nil, site_id__n : Array(Int32)? = nil, status : Array(String)? = nil, status__empty : Bool? = nil, status__ic : Array(String)? = nil, status__ie : Array(String)? = nil, status__iew : Array(String)? = nil, status__iregex : Array(String)? = nil, status__isw : Array(String)? = nil, status__n : Array(String)? = nil, status__nic : Array(String)? = nil, status__nie : Array(String)? = nil, status__niew : Array(String)? = nil, status__nisw : Array(String)? = nil, status__regex : Array(String)? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, tenant : Array(String)? = nil, tenant__n : Array(String)? = nil, tenant_group : Array(String)? = nil, tenant_group__n : Array(String)? = nil, tenant_group_id : Array(String)? = nil, tenant_group_id__n : Array(String)? = nil, tenant_id : Array(Int32)? = nil, tenant_id__n : Array(Int32)? = nil, unit : Float64? = nil, unit__empty : Float64? = nil, unit__gt : Float64? = nil, unit__gte : Float64? = nil, unit__lt : Float64? = nil, unit__lte : Float64? = nil, unit__n : Float64? = nil, updated_by_request : String? = nil, user : Array(String)? = nil, user__n : Array(String)? = nil, user_id : Array(Int32)? = nil, user_id__n : Array(Int32)? = nil) : Response(NetboxClient::PaginatedRackReservationList)
      @conn.request(NetboxClient::PaginatedRackReservationList,
        method: :GET,
        path: "/api/dcim/rack-reservations/",
        query: { "created" => created, "created__empty" => created__empty, "created__gt" => created__gt, "created__gte" => created__gte, "created__lt" => created__lt, "created__lte" => created__lte, "created__n" => created__n, "created_by_request" => created_by_request, "description" => description, "description__empty" => description__empty, "description__ic" => description__ic, "description__ie" => description__ie, "description__iew" => description__iew, "description__iregex" => description__iregex, "description__isw" => description__isw, "description__n" => description__n, "description__nic" => description__nic, "description__nie" => description__nie, "description__niew" => description__niew, "description__nisw" => description__nisw, "description__regex" => description__regex, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "location" => location, "location__n" => location__n, "location_id" => location_id, "location_id__n" => location_id__n, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "q" => q, "rack_id" => rack_id, "rack_id__n" => rack_id__n, "region" => region, "region__n" => region__n, "region_id" => region_id, "region_id__n" => region_id__n, "site" => site, "site__n" => site__n, "site_group" => site_group, "site_group__n" => site_group__n, "site_group_id" => site_group_id, "site_group_id__n" => site_group_id__n, "site_id" => site_id, "site_id__n" => site_id__n, "status" => status, "status__empty" => status__empty, "status__ic" => status__ic, "status__ie" => status__ie, "status__iew" => status__iew, "status__iregex" => status__iregex, "status__isw" => status__isw, "status__n" => status__n, "status__nic" => status__nic, "status__nie" => status__nie, "status__niew" => status__niew, "status__nisw" => status__nisw, "status__regex" => status__regex, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "tenant" => tenant, "tenant__n" => tenant__n, "tenant_group" => tenant_group, "tenant_group__n" => tenant_group__n, "tenant_group_id" => tenant_group_id, "tenant_group_id__n" => tenant_group_id__n, "tenant_id" => tenant_id, "tenant_id__n" => tenant_id__n, "unit" => unit, "unit__empty" => unit__empty, "unit__gt" => unit__gt, "unit__gte" => unit__gte, "unit__lt" => unit__lt, "unit__lte" => unit__lte, "unit__n" => unit__n, "updated_by_request" => updated_by_request, "user" => user, "user__n" => user__n, "user_id" => user_id, "user_id__n" => user_id__n },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a rack reservation object.
    def partial_update(id : Int32, patched_writable_rack_reservation_request : NetboxClient::PatchedWritableRackReservationRequest? = nil) : Response(NetboxClient::RackReservation)
      @conn.request(NetboxClient::RackReservation,
        method: :PATCH,
        path: "/api/dcim/rack-reservations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_rack_reservation_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a rack reservation object.
    def retrieve(id : Int32) : Response(NetboxClient::RackReservation)
      @conn.request(NetboxClient::RackReservation,
        method: :GET,
        path: "/api/dcim/rack-reservations/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a rack reservation object.
    def update(id : Int32, writable_rack_reservation_request : NetboxClient::WritableRackReservationRequest) : Response(NetboxClient::RackReservation)
      @conn.request(NetboxClient::RackReservation,
        method: :PUT,
        path: "/api/dcim/rack-reservations/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_rack_reservation_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
