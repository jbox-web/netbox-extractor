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

    # Compiled templates keyed by their source. A role's template is rendered
    # once per host; parsing it every time is wasted work, so parse once and
    # reuse the compiled template across renders (P1).
    @@template_cache = {} of String => Crinja::Template
    @@cache_mutex = Mutex.new

    def render_template(template, variables)
      compiled = @@cache_mutex.synchronize { @@template_cache[template] ||= CRINJA.from_string(template) }
      compiled.render(variables)
    end
  end
end
