require "../../spec_helper"

Spectator.describe NetboxExtractor::Config::Base do
  # sites_config: paths were resolved against the process working directory, so
  # `netbox-extractor -c /etc/netbox-extractor.yml` from anywhere else failed on
  # a file sitting right next to that config.
  describe "sites_config: resolution" do
    let(tmp) { File.tempname("nbx-sites-config-spec") }

    before_each do
      FileUtils.mkdir_p File.join(tmp, "sites")

      example = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      base = NetboxExtractor::Config::Base.from_yaml(File.read(example))
      site_yaml = base.sites.first.to_yaml.sub("id: #{base.sites.first.id}", "id: jaguar")
      File.write(File.join(tmp, "sites", "jaguar.yml"), site_yaml)

      main = File.read(example) + "\nsites_config:\n  - sites/jaguar.yml\n"
      File.write(File.join(tmp, "netbox-extractor.yml"), main)
    end

    after_each { FileUtils.rm_rf tmp }

    it "finds a site file next to the config, whatever the working directory" do
      NetboxExtractor.load_config(File.join(tmp, "netbox-extractor.yml"), File.join(tmp, ".env"))

      expect(NetboxExtractor.config.sites.map(&.id)).to contain("jaguar")
    end

    # Installations that rely on the old behaviour keep working: a path that
    # does not resolve next to the config is still tried against the working
    # directory.
    it "still falls back to the working directory" do
      FileUtils.mv File.join(tmp, "sites"), File.join(tmp, "elsewhere")
      FileUtils.mkdir_p File.join(tmp, "sites")
      FileUtils.mv File.join(tmp, "elsewhere", "jaguar.yml"), File.join(tmp, "sites", "jaguar.yml")

      Dir.cd(tmp) do
        NetboxExtractor.load_config("netbox-extractor.yml", ".env")
      end

      expect(NetboxExtractor.config.sites.map(&.id)).to contain("jaguar")
    end

    it "names both places it looked when the file is nowhere" do
      File.delete File.join(tmp, "sites", "jaguar.yml")

      error = nil
      begin
        NetboxExtractor.load_config(File.join(tmp, "netbox-extractor.yml"), File.join(tmp, ".env"))
      rescue ex : Exception
        error = ex
      end

      expect(error.try(&.message)).to contain("sites/jaguar.yml")
    end
  end
end
