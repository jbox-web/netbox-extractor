module NetboxExtractor
  module Config
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
