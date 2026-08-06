require "../spec_helper"

Spectator.describe NetboxExtractor do
  # A container or CI run exports NETBOX_TOKEN_API and ships no .env file. The
  # loader used to raise File::NotFoundError before doing any work, so every
  # secret being present was not enough to start.
  describe ".load_config" do
    it "loads the config when no .env file exists" do
      tmp = File.tempname("nbx-load-config-spec")
      FileUtils.mkdir_p tmp

      begin
        example = File.expand_path("../../netbox-extractor.yml.example", __DIR__)
        config_path = File.join(tmp, "netbox-extractor.yml")
        File.write(config_path, File.read(example))

        expect { NetboxExtractor.load_config(config_path, File.join(tmp, ".env")) }.to_not raise_error
      ensure
        FileUtils.rm_rf tmp
      end
    end

    # A bare `raise "..."` drops the original exception, and with it the
    # template line Crinja reports — the only thing that says which expression
    # failed.
    it "keeps the Crinja failure as the cause when the template is broken" do
      tmp = File.tempname("nbx-load-config-spec")
      FileUtils.mkdir_p tmp

      begin
        config_path = File.join(tmp, "netbox-extractor.yml")
        File.write(config_path, "logger:\n  level: {{ unclosed ")

        error = nil
        begin
          NetboxExtractor.load_config(config_path, File.join(tmp, ".env"))
        rescue ex : Exception
          error = ex
        end

        expect(error).to_not be_nil
        expect(error.try(&.cause)).to be_a(Crinja::Error)
      ensure
        FileUtils.rm_rf tmp
      end
    end
  end
end
