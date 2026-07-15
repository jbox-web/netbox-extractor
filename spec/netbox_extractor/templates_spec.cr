require "../spec_helper"

Spectator.describe "Icinga templates" do
  # Templates are baked at compile time and only parsed by Crinja at render
  # time, so a syntax error in a template would not surface from `crystal build`.
  # Parse every template through the shared environment (which registers the
  # custom filters) to catch edit mistakes such as a broken filter pipe.
  it "all parse without a Crinja syntax error" do
    dir = File.expand_path("../../templates/icinga", __DIR__)
    templates = Dir.glob(File.join(dir, "*.j2"))
    expect(templates).to_not be_empty

    templates.each do |path|
      NetboxExtractor::Utils::CRINJA.from_string(File.read(path))
    end
  end
end
