module NetboxExtractor
  module Logger
    extend self

    SEVERITY_MAP = {
      "trace" => Log::Severity::Trace,
      "debug" => Log::Severity::Debug,
      "info"  => Log::Severity::Info,
      "warn"  => Log::Severity::Warn,
      "error" => Log::Severity::Error,
      "fatal" => Log::Severity::Fatal,
    }

    ColorLogging.define_formatter MyColorFormat, "#{timestamp} #{severity} - #{source} #{context(before: "[", after: "]")} " \
                                                 "#{message}#{data(before: " -- ")}#{exception}"

    def setup_log!
      MyColorFormat.with_colored_severity(Log::Severity::Info, :cyan)
      MyColorFormat.with_colored_severity(Log::Severity::Debug, :yellow)
      MyColorFormat.with_colored_severity(Log::Severity::Warn, :magenta)
      MyColorFormat.with_colored_severity(Log::Severity::Error, :red)

      Log.setup do |log|
        log.bind "*", log_level, logger
        log.bind "http.client", log_level, logger
      end
    end

    private def log_level
      SEVERITY_MAP[config.logger.level]? || SEVERITY_MAP["info"]
    end

    private def logger
      log_to_stdout? ? Log::IOBackend.new(log_file, formatter: MyColorFormat) : Log::IOBackend.new(log_file)
    end

    private def log_file
      log_to_stdout? ? STDOUT : File.open(config.logger.log_file, "a")
    end

    private def log_to_stdout?
      config.logger.log_file.empty? || config.logger.log_file.downcase == "stdout"
    end
  end
end
