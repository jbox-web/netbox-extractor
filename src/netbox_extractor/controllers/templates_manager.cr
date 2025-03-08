module NetboxExtractor
  module Controllers
    class TemplatesManager
      extend BakedFileSystem
      bake_folder "../../../templates"
    end
  end
end
