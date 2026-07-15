module NetboxExtractor
  # Custom Crinja filters that make Netbox-sourced values safe to interpolate
  # into Icinga2 DSL. Registered on the shared environment in `Utils`.
  module CrinjaFilters
    # Escapes a scalar for use inside an Icinga2 double-quoted string. Without
    # this a value containing `"`, `\` or a newline breaks the string literal and
    # icinga2 fails to load the entire zone (S1).
    class IcingaString
      include Crinja::Callable

      getter name = "icinga_string"
      getter defaults = Crinja::Variables.new

      def call(arguments)
        (arguments.target.try(&.to_string) || "")
          .gsub('\\', "\\\\")
          .gsub('"', "\\\"")
          .gsub('\n', "\\n")
          .gsub('\r', "\\r")
          .gsub('\t', "\\t")
      end
    end

    # Renders a sequence as an Icinga2 array literal via JSON encoding, so every
    # element is quoted and escaped. Replaces the fragile
    # `| string | replace("'", "\"")` hack that broke on any element containing a
    # quote (S1).
    class IcingaArray
      include Crinja::Callable

      getter name = "icinga_array"
      getter defaults = Crinja::Variables.new

      def call(arguments)
        target = arguments.target
        elements = target ? target.to_a : [] of Crinja::Value
        elements.map(&.to_string).to_json
      end
    end
  end
end
