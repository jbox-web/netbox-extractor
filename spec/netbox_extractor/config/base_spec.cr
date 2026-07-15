require "../../spec_helper"

Spectator.describe NetboxExtractor::Config::Base do
  # The example config is the reference users copy from: it must load through
  # the real deserializer, or every copy starts from a broken file (Doc1/Doc4).
  describe "the shipped example config" do
    it "round-trips through Config::Base.from_yaml" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))

      expect(config.netbox.hostname).to eq("<hostname>")
      expect(config.sites.size).to eq(1)
    end

    it "leaves mitogen disabled when the block is omitted" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))

      expect(config.ansible.fetch_facts.mitogen.enabled?).to be_false
    end
  end
end
