require "json"

module NetboxClient
  module Api
  class Extras::JournalEntries
    def initialize(@conn : Connection); end

    #  Delete a list of journal entry objects.
    def bulk_destroy(journal_entry_request : Array(NetboxClient::JournalEntryRequest)) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/journal-entries/",
        body: journal_entry_request,
        accept: %w[],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a list of journal entry objects.
    def bulk_partial_update(journal_entry_request : Array(NetboxClient::JournalEntryRequest)) : Response(Array(NetboxClient::JournalEntry))
      @conn.request(Array(NetboxClient::JournalEntry),
        method: :PATCH,
        path: "/api/extras/journal-entries/",
        body: journal_entry_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a list of journal entry objects.
    def bulk_update(journal_entry_request : Array(NetboxClient::JournalEntryRequest)) : Response(Array(NetboxClient::JournalEntry))
      @conn.request(Array(NetboxClient::JournalEntry),
        method: :PUT,
        path: "/api/extras/journal-entries/",
        body: journal_entry_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Post a list of journal entry objects.
    def create(extras_journal_entries_create_request : NetboxClient::ExtrasJournalEntriesCreateRequest) : Response(NetboxClient::JournalEntry)
      @conn.request(NetboxClient::JournalEntry,
        method: :POST,
        path: "/api/extras/journal-entries/",
        body: extras_journal_entries_create_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a journal entry object.
    def destroy(id : Int32) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/journal-entries/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of journal entry objects.
    def list(*, assigned_object_id : Array(Int32)? = nil, assigned_object_id__empty : Bool? = nil, assigned_object_id__gt : Array(Int32)? = nil, assigned_object_id__gte : Array(Int32)? = nil, assigned_object_id__lt : Array(Int32)? = nil, assigned_object_id__lte : Array(Int32)? = nil, assigned_object_id__n : Array(Int32)? = nil, assigned_object_type : String? = nil, assigned_object_type__n : String? = nil, assigned_object_type_id : Array(Int32)? = nil, assigned_object_type_id__n : Array(Int32)? = nil, created_after : Time? = nil, created_before : Time? = nil, created_by : Array(String)? = nil, created_by__n : Array(String)? = nil, created_by_id : Array(Int32)? = nil, created_by_id__n : Array(Int32)? = nil, created_by_request : String? = nil, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, kind : Array(String)? = nil, kind__empty : Bool? = nil, kind__ic : Array(String)? = nil, kind__ie : Array(String)? = nil, kind__iew : Array(String)? = nil, kind__iregex : Array(String)? = nil, kind__isw : Array(String)? = nil, kind__n : Array(String)? = nil, kind__nic : Array(String)? = nil, kind__nie : Array(String)? = nil, kind__niew : Array(String)? = nil, kind__nisw : Array(String)? = nil, kind__regex : Array(String)? = nil, last_updated : Array(Time)? = nil, last_updated__empty : Array(Time)? = nil, last_updated__gt : Array(Time)? = nil, last_updated__gte : Array(Time)? = nil, last_updated__lt : Array(Time)? = nil, last_updated__lte : Array(Time)? = nil, last_updated__n : Array(Time)? = nil, limit : Int32? = nil, modified_by_request : String? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil, tag : Array(String)? = nil, tag__n : Array(String)? = nil, tag_id : Array(String)? = nil, tag_id__n : Array(String)? = nil, updated_by_request : String? = nil) : Response(NetboxClient::PaginatedJournalEntryList)
      @conn.request(NetboxClient::PaginatedJournalEntryList,
        method: :GET,
        path: "/api/extras/journal-entries/",
        query: { "assigned_object_id" => assigned_object_id, "assigned_object_id__empty" => assigned_object_id__empty, "assigned_object_id__gt" => assigned_object_id__gt, "assigned_object_id__gte" => assigned_object_id__gte, "assigned_object_id__lt" => assigned_object_id__lt, "assigned_object_id__lte" => assigned_object_id__lte, "assigned_object_id__n" => assigned_object_id__n, "assigned_object_type" => assigned_object_type, "assigned_object_type__n" => assigned_object_type__n, "assigned_object_type_id" => assigned_object_type_id, "assigned_object_type_id__n" => assigned_object_type_id__n, "created_after" => created_after, "created_before" => created_before, "created_by" => created_by, "created_by__n" => created_by__n, "created_by_id" => created_by_id, "created_by_id__n" => created_by_id__n, "created_by_request" => created_by_request, "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "kind" => kind, "kind__empty" => kind__empty, "kind__ic" => kind__ic, "kind__ie" => kind__ie, "kind__iew" => kind__iew, "kind__iregex" => kind__iregex, "kind__isw" => kind__isw, "kind__n" => kind__n, "kind__nic" => kind__nic, "kind__nie" => kind__nie, "kind__niew" => kind__niew, "kind__nisw" => kind__nisw, "kind__regex" => kind__regex, "last_updated" => last_updated, "last_updated__empty" => last_updated__empty, "last_updated__gt" => last_updated__gt, "last_updated__gte" => last_updated__gte, "last_updated__lt" => last_updated__lt, "last_updated__lte" => last_updated__lte, "last_updated__n" => last_updated__n, "limit" => limit, "modified_by_request" => modified_by_request, "offset" => offset, "ordering" => ordering, "q" => q, "tag" => tag, "tag__n" => tag__n, "tag_id" => tag_id, "tag_id__n" => tag_id__n, "updated_by_request" => updated_by_request },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a journal entry object.
    def partial_update(id : Int32, patched_writable_journal_entry_request : NetboxClient::PatchedWritableJournalEntryRequest? = nil) : Response(NetboxClient::JournalEntry)
      @conn.request(NetboxClient::JournalEntry,
        method: :PATCH,
        path: "/api/extras/journal-entries/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_writable_journal_entry_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a journal entry object.
    def retrieve(id : Int32) : Response(NetboxClient::JournalEntry)
      @conn.request(NetboxClient::JournalEntry,
        method: :GET,
        path: "/api/extras/journal-entries/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a journal entry object.
    def update(id : Int32, writable_journal_entry_request : NetboxClient::WritableJournalEntryRequest) : Response(NetboxClient::JournalEntry)
      @conn.request(NetboxClient::JournalEntry,
        method: :PUT,
        path: "/api/extras/journal-entries/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: writable_journal_entry_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
