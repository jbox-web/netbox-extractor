module NetboxExtractor
  module Controllers
    # :nodoc:
    class TemplatesManager
      extend BakedFileSystem
      bake_folder "../../../templates"
    end
  end
end
