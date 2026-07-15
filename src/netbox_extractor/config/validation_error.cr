module NetboxExtractor
  module Config
    # Raised when the loaded configuration is internally inconsistent — e.g. two
    # sites or two roles that would resolve to the same output path and clobber
    # each other's generated files.
    class ValidationError < Exception
    end
  end
end
