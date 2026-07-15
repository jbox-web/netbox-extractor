module NetboxExtractor
  module Config
    # Maps to the `netbox:` block: connection details and API token for the
    # Netbox instance. `fetch_limit` is the pagination page size used by the
    # inventory loaders.
    class Netbox
      include YAML::Serializable

      property http_scheme : String = "http"
      property hostname : String
      property port : Int32 = 80
      property api_token : String
      property fetch_limit : Int32 = 50
      property? debug : Bool = false
    end
  end
end
