require "../../spec_helper"

# Only `name` is read off the host when locating its facts file.
private record FakeFactsHost, name : String?

private class FactsHarness
  include NetboxExtractor::Presenters::IcingaHelper

  def read_facts(site, host)
    fetch_ansible_facts(site, host)
  end
end

private record FakeCheckedHost, name : String?

# Wires the per-host check lookup into the template locals, as IcingaHost does.
private class CheckLocalsHarness
  include NetboxExtractor::Presenters::WithCustomConfig
  include NetboxExtractor::Presenters::IcingaHelper

  def initialize(@site : NetboxExtractor::Config::Site, @host : FakeCheckedHost)
  end

  def opensearch_locals
    locals = {} of String => Hash(String, String)
    load_template_locals_check_opensearch(locals)
    locals
  end
end

Spectator.describe NetboxExtractor::Presenters::IcingaHelper do
  let(config) do
    path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
    NetboxExtractor::Config::Base.from_yaml(File.read(path))
  end

  # A facts file is written by an external Ansible run, so its shape is not
  # guaranteed. Valid JSON that is not an object made `.as_h` raise a
  # TypeCastError, which the rescue did not cover: the exception escaped into
  # the host's fiber and aborted the whole site's config swap.
  describe "#fetch_ansible_facts" do
    it "ignores a facts file whose JSON is valid but not an object" do
      tmp = File.tempname("nbx-facts-spec")
      FileUtils.mkdir_p tmp
      config.ansible.fetch_facts.cache_dir = tmp
      NetboxExtractor.config = config

      begin
        site = config.sites.first
        host = FakeFactsHost.new("host1")
        File.write(File.join(tmp, "#{site.id}.host1"), %q(["not", "an", "object"]))

        expect(FactsHarness.new.read_facts(site, host)).to be_nil
      ensure
        FileUtils.rm_rf tmp
      end
    end

    it "reads a well-formed facts file" do
      tmp = File.tempname("nbx-facts-spec")
      FileUtils.mkdir_p tmp
      config.ansible.fetch_facts.cache_dir = tmp
      NetboxExtractor.config = config

      begin
        site = config.sites.first
        host = FakeFactsHost.new("host2")
        File.write(File.join(tmp, "#{site.id}.host2"), %q({"ansible_distribution": "Debian"}))

        facts = FactsHarness.new.read_facts(site, host)

        expect(facts.try(&.["ansible_distribution"]?.try(&.as_s))).to eq("Debian")
      ensure
        FileUtils.rm_rf tmp
      end
    end
  end

  describe "#load_template_locals_check_opensearch" do
    it "exposes the host's check_opensearch credentials to the template" do
      site = config.sites.first
      entry = NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml(
        "host: search1\ncheck_opensearch:\n  username: JAGUAR_OPENSEARCH_USER\n  password: JAGUAR_OPENSEARCH_PASS\n")
      site.icinga.checks_config << entry

      locals = CheckLocalsHarness.new(site, FakeCheckedHost.new("search1")).opensearch_locals

      expect(locals).to eq({
        "icinga_check_opensearch_data" => {"username" => "JAGUAR_OPENSEARCH_USER", "password" => "JAGUAR_OPENSEARCH_PASS"},
      })
    end

    it "leaves the locals untouched for a host without check_opensearch" do
      locals = CheckLocalsHarness.new(config.sites.first, FakeCheckedHost.new("nothing-here")).opensearch_locals

      expect(locals).to be_empty
    end
  end
end
