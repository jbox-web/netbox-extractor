module NetboxExtractor
  module Presenters
    module Templatable
      alias TemplateLocals = NetboxExtractor::RecursiveHash

      def initialize(@template_locals = TemplateLocals.new)
      end

      private def render_template(template, template_locals)
        NetboxExtractor::Utils.render_template(template, template_locals)
      end

      private def write_file(file, data)
        dirname = File.dirname(file)
        FileUtils.mkdir_p dirname unless Dir.exists?(dirname)

        File.open(file, "w") do |f|
          f.puts data
        end
      end
    end
  end
end
