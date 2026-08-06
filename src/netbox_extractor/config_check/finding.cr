module NetboxExtractor
  # Configuration checking: reports what a run would silently ignore, without
  # generating anything.
  #
  # Named `ConfigCheck` rather than `Checks`, which would collide with
  # `Config::Icinga::Checks` — the Icinga service checks (drac, mysql, …) — and
  # make a bare `Checks` mean different things depending on where it is read.
  module ConfigCheck
    # How much a finding matters. An error means the configuration cannot be
    # used as it stands; a warning means it works but says something that
    # designates nothing — a `checks_config` entry for a decommissioned host,
    # a role that matches no object.
    enum Severity
      Error
      Warning
    end

    # One thing worth reporting about the configuration. `site` is nil for a
    # finding about the file as a whole rather than about one site, and `source`
    # is the file to edit — with sites spread across a main config and any
    # number of `sites_config:` files, the site id alone leaves the reader
    # hunting for the right one.
    record Finding,
      severity : Severity,
      message : String,
      site : String? = nil,
      source : String? = nil do
      def error?
        severity.error?
      end

      def warning?
        severity.warning?
      end

      def to_s(io)
        io << (error? ? "ERROR" : "WARNING") << "  "
        io << "[" << site << "] " if site
        io << message
        io << " (" << source << ")" if source
      end
    end
  end
end
