module NetboxExtractor
  module Config
    class Logger
      include YAML::Serializable

      property level : String = "info"
      property log_file : String = "stdout"
    end
  end
end
