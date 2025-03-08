module NetboxExtractor
  module Config
    class Logger
      include YAML::Serializable

      property level : String = "debug"
      property log_file : String = "stdout"
    end
  end
end
