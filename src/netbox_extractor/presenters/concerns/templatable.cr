module NetboxExtractor
  module Presenters
    # Renders an Icinga template through Crinja and writes the result to disk.
    # Mixed into every Icinga presenter; expects the host class to provide
    # `@template`, `@icinga_filename`, and a `load_template_locals!` hook that
    # populates `@template_locals`.
    module Templatable
      alias TemplateLocals = NetboxExtractor::RecursiveHash

      # Initializes the shared `@template_locals` accumulator (empty by default).
      def initialize(@template_locals = TemplateLocals.new)
      end

      # Fills the template locals, renders `@template`, and writes the output to
      # `@icinga_filename` (creating parent directories as needed).
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
        Log.debug { template_locals.try &.to_h }

        NetboxExtractor::Utils.render_template(template, template_locals)
      end

      private def write_file(file, data)
        dirname = File.dirname(file)
        FileUtils.mkdir_p dirname

        File.open(file, "w") do |f|
          f.puts data
        end
      end
    end
  end
end
