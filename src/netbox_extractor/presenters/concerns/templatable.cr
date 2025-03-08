module NetboxExtractor
  module Presenters
    module Templatable
      alias TemplateLocals = NetboxExtractor::RecursiveHash

      def initialize(@template_locals = TemplateLocals.new)
      end

      def save!
        load_template_locals!

        data = render_template(@template, @template_locals)
        write_file(@icinga_filename, data)

        Log.debug { "Icinga config file generated: #{@icinga_filename}" }
      end

      private def load_template(template)
        get_template(template).gets_to_end
      end

      private def get_template(template)
        NetboxExtractor::Controllers::TemplatesManager.get(template)
      end

      private def get_template?(template)
        NetboxExtractor::Controllers::TemplatesManager.get?(template)
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
