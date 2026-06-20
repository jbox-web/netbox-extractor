require "json"

module NetboxClient
  module Api
  class Extras::Scripts
    def initialize(@conn : Connection); end

    #  Post a list of script objects.
    def create() : Response(NetboxClient::Script)
      @conn.request(NetboxClient::Script,
        method: :POST,
        path: "/api/extras/scripts/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Delete a script object.
    def destroy(id : String) : Response(Nil)
      @conn.request(Nil,
        method: :DELETE,
        path: "/api/extras/scripts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a list of script objects.
    def list(*, id : Array(Int32)? = nil, id__empty : Bool? = nil, id__gt : Array(Int32)? = nil, id__gte : Array(Int32)? = nil, id__lt : Array(Int32)? = nil, id__lte : Array(Int32)? = nil, id__n : Array(Int32)? = nil, is_executable : Bool? = nil, limit : Int32? = nil, module_id : Array(Int32)? = nil, module_id__n : Array(Int32)? = nil, name : Array(String)? = nil, name__empty : Bool? = nil, name__ic : Array(String)? = nil, name__ie : Array(String)? = nil, name__iew : Array(String)? = nil, name__iregex : Array(String)? = nil, name__isw : Array(String)? = nil, name__n : Array(String)? = nil, name__nic : Array(String)? = nil, name__nie : Array(String)? = nil, name__niew : Array(String)? = nil, name__nisw : Array(String)? = nil, name__regex : Array(String)? = nil, offset : Int32? = nil, ordering : String? = nil, q : String? = nil) : Response(NetboxClient::PaginatedScriptList)
      @conn.request(NetboxClient::PaginatedScriptList,
        method: :GET,
        path: "/api/extras/scripts/",
        query: { "id" => id, "id__empty" => id__empty, "id__gt" => id__gt, "id__gte" => id__gte, "id__lt" => id__lt, "id__lte" => id__lte, "id__n" => id__n, "is_executable" => is_executable, "limit" => limit, "module_id" => module_id, "module_id__n" => module_id__n, "name" => name, "name__empty" => name__empty, "name__ic" => name__ic, "name__ie" => name__ie, "name__iew" => name__iew, "name__iregex" => name__iregex, "name__isw" => name__isw, "name__n" => name__n, "name__nic" => name__nic, "name__nie" => name__nie, "name__niew" => name__niew, "name__nisw" => name__nisw, "name__regex" => name__regex, "offset" => offset, "ordering" => ordering, "q" => q },
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Patch a script object.
    def partial_update(id : String, patched_script_input_request : NetboxClient::PatchedScriptInputRequest? = nil) : Response(NetboxClient::Script)
      @conn.request(NetboxClient::Script,
        method: :PATCH,
        path: "/api/extras/scripts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: patched_script_input_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Get a script object.
    def retrieve(id : String) : Response(NetboxClient::Script)
      @conn.request(NetboxClient::Script,
        method: :GET,
        path: "/api/extras/scripts/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Put a script object.
    def update(id : String, script_input_request : NetboxClient::ScriptInputRequest) : Response(NetboxClient::Script)
      @conn.request(NetboxClient::Script,
        method: :PUT,
        path: "/api/extras/scripts/{id}/".sub("{id}", NetboxClient.enc(id)),
        body: script_input_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
