module NetboxExtractor
  module Config
    # Maps to the `logger:` block: sets the log severity and the output sink
    # (`log_file: "stdout"` logs to standard output, otherwise a file path).
    class Logger
      include YAML::Serializable

      property level : String = "info"
      property log_file : String = "stdout"
    end
  end
end
