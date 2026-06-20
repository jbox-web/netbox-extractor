require "json"

module NetboxClient
  module Api
  class Core::BackgroundTasks
    def initialize(@conn : Connection); end

    #  Retrieve a list of RQ Tasks.
    def delete_create(id : String, background_task_request : NetboxClient::BackgroundTaskRequest) : Response(NetboxClient::BackgroundTask)
      @conn.request(NetboxClient::BackgroundTask,
        method: :POST,
        path: "/api/core/background-tasks/{id}/delete/".sub("{id}", NetboxClient.enc(id)),
        body: background_task_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Tasks.
    def enqueue_create(id : String, background_task_request : NetboxClient::BackgroundTaskRequest) : Response(NetboxClient::BackgroundTask)
      @conn.request(NetboxClient::BackgroundTask,
        method: :POST,
        path: "/api/core/background-tasks/{id}/enqueue/".sub("{id}", NetboxClient.enc(id)),
        body: background_task_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Tasks.
    def requeue_create(id : String, background_task_request : NetboxClient::BackgroundTaskRequest) : Response(NetboxClient::BackgroundTask)
      @conn.request(NetboxClient::BackgroundTask,
        method: :POST,
        path: "/api/core/background-tasks/{id}/requeue/".sub("{id}", NetboxClient.enc(id)),
        body: background_task_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Tasks.
    def retrieve() : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/core/background-tasks/",
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Tasks.
    def retrieve_by_id(id : String) : Response(Hash(String, JSON::Any))
      @conn.request(Hash(String, JSON::Any),
        method: :GET,
        path: "/api/core/background-tasks/{id}/".sub("{id}", NetboxClient.enc(id)),
        accept: %w[application/json],
        auth: %w[cookieAuth tokenAuth])
    end

    #  Retrieve a list of RQ Tasks.
    def stop_create(id : String, background_task_request : NetboxClient::BackgroundTaskRequest) : Response(NetboxClient::BackgroundTask)
      @conn.request(NetboxClient::BackgroundTask,
        method: :POST,
        path: "/api/core/background-tasks/{id}/stop/".sub("{id}", NetboxClient.enc(id)),
        body: background_task_request,
        accept: %w[application/json],
        content_type: %w[application/json multipart/form-data],
        auth: %w[cookieAuth tokenAuth])
    end
  end
  end

end
