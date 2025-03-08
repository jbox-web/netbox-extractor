module NetboxExtractor
  module Utils
    extend self

    def render_template(template, variables)
      Crinja.render(template, variables: variables)
    end
  end
end
