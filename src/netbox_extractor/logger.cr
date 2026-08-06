module NetboxExtractor
  # Colored logging setup. Defines the severity-to-color mapping and the log
  # formatter, and binds the configured level and backend (STDOUT or a file).
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

    # Configures the global `Log` from `config.logger`: assigns severity colors,
    # then binds every source at the configured level to the chosen backend.
    def setup_log!
      MyColorFormat.with_colored_severity(Log::Severity::Trace, :cyan)
      MyColorFormat.with_colored_severity(Log::Severity::Debug, :light_cyan)
      MyColorFormat.with_colored_severity(Log::Severity::Info, :green)
      MyColorFormat.with_colored_severity(Log::Severity::Warn, :yellow)
      MyColorFormat.with_colored_severity(Log::Severity::Error, :red)
      MyColorFormat.with_colored_severity(Log::Severity::Fatal, :red)

      Log.setup do |log|
        log.bind "*", log_level, logger
      end
    end

    private def log_level
      severity_for(config.logger.level)
    end

    # Case-insensitive so "Info"/"DEBUG" resolve instead of silently falling
    # back to info (C10).
    def severity_for(level : String) : Log::Severity
      SEVERITY_MAP[level.downcase]? || Log::Severity::Info
    end

    private def logger
      log_to_stdout? ? Log::IOBackend.new(log_file, formatter: MyColorFormat) : Log::IOBackend.new(log_file)
    end

    private def log_file
      return STDOUT if log_to_stdout?

      File.open(config.logger.log_file, "a")
    rescue ex : IO::Error
      # `cause:` rather than a bare String: raising a String discards the
      # original exception and its backtrace, leaving only the summary message
      # to diagnose a permission or path problem.
      raise RuntimeError.new("Cannot open log_file '#{config.logger.log_file}': #{ex.message}", cause: ex)
    end

    private def log_to_stdout?
      config.logger.log_file.empty? || config.logger.log_file.downcase == "stdout"
    end
  end
end
