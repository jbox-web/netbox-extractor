module NetboxExtractor
  module Utils
    extend self

    # Shared Crinja environment, built once at load (before any fiber renders),
    # with the Icinga-escaping filters registered.
    CRINJA = begin
      env = Crinja.new
      env.filters << NetboxExtractor::CrinjaFilters::IcingaString.new
      env.filters << NetboxExtractor::CrinjaFilters::IcingaArray.new
      env
    end

    def render_template(template, variables)
      CRINJA.from_string(template).render(variables)
    end
  end
end
