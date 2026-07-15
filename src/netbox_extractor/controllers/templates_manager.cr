module NetboxExtractor
  module Controllers
    # Embeds the `templates/` directory into the compiled binary via
    # `BakedFileSystem`, so templates (Ansible playbook/config, Icinga output)
    # can be read at runtime with no dependency on the working directory.
    class TemplatesManager
      extend BakedFileSystem
      bake_folder "../../../templates"
    end
  end
end
