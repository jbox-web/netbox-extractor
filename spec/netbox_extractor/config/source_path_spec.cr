require "../../spec_helper"

Spectator.describe NetboxExtractor::Config::Site do
  # A finding has to say which file to edit. With sites spread across a main
  # config and any number of sites_config: files, the site id alone leaves the
  # reader grepping for it.
  describe "#source_path" do
    it "records the file a site was loaded from, as written in the config" do
      tmp = File.tempname("nbx-source-path-spec")
      FileUtils.mkdir_p File.join(tmp, "sites")

      begin
        example = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
        base = NetboxExtractor::Config::Base.from_yaml(File.read(example))

        # One site inline in the main file, one pulled from sites/jaguar.yml.
        # The external one needs an id of its own, since duplicates are refused.
        site_yaml = base.sites.first.to_yaml.sub("id: #{base.sites.first.id}", "id: jaguar")
        File.write(File.join(tmp, "sites", "jaguar.yml"), site_yaml)

        main = File.read(example) + "\nsites_config:\n  - sites/jaguar.yml\n"
        File.write(File.join(tmp, "netbox-extractor.yml"), main)

        Dir.cd(tmp) do
          NetboxExtractor.load_config("netbox-extractor.yml", ".env")
        end

        sources = NetboxExtractor.config.sites.map(&.source_path)

        expect(sources.first).to eq("netbox-extractor.yml")
        expect(sources.last).to eq("sites/jaguar.yml")
      ensure
        FileUtils.rm_rf tmp
      end
    end
  end
end
