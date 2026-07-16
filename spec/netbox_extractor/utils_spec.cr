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
  end

  describe "the icinga_array filter" do
    it "renders a JSON array literal with each element escaped, ', '-separated" do
      rendered = NetboxExtractor::Utils.render_template(%q({{ v | icinga_array }}), {"v" => ["a", %q(x"y)]})

      expect(rendered).to eq(%q(["a", "x\"y"]))
    end
  end
end
