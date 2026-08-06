require "../spec_helper"

Spectator.describe NetboxExtractor::Utils do
  # Netbox-sourced values land verbatim inside Icinga2 DSL string literals; a
  # stray quote, backslash or newline would break the string and abort loading
  # the whole zone. These filters neutralise that (S1).
  describe "the icinga_string filter" do
    it "escapes backslashes, quotes and control characters" do
      value = %q(a"b\c) + "\n"
      rendered = NetboxExtractor::Utils.render_template(%q("{{ v | icinga_string }}"), {"v" => value})

      expect(rendered).to eq(%q("a\"b\\c\n"))
    end

    # Icinga2 substitutes `$name$` as a runtime macro inside double-quoted
    # strings, so a `$` coming from free-text Netbox fields (vendor name and
    # model) or from LSB facts (os name, distro) either resolves to something
    # else or fails validation and takes the whole zone down. Doubling is the
    # DSL's own escape for a literal `$`.
    it "doubles dollar signs so they are not read as macros" do
      rendered = NetboxExtractor::Utils.render_template(%q("{{ v | icinga_string }}"), {"v" => "Dell $Node$"})

      expect(rendered).to eq(%q("Dell $$Node$$"))
    end
  end

  describe "the icinga_array filter" do
    it "renders a JSON array literal with each element escaped, ', '-separated" do
      rendered = NetboxExtractor::Utils.render_template(%q({{ v | icinga_array }}), {"v" => ["a", %q(x"y)]})

      expect(rendered).to eq(%q(["a", "x\"y"]))
    end

    # JSON encoding quotes and escapes each element, but `$` is not a JSON
    # metacharacter — it still reaches Icinga2 as a macro delimiter.
    it "doubles dollar signs in elements" do
      rendered = NetboxExtractor::Utils.render_template(%q({{ v | icinga_array }}), {"v" => ["a$b"]})

      expect(rendered).to eq(%q(["a$$b"]))
    end
  end
end
