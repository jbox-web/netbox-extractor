require "../../spec_helper"

# The presenters only read `name` off the host for this lookup.
private record FakeNamedHost, name : String?

private class CustomConfigHarness
  include NetboxExtractor::Presenters::WithCustomConfig

  def initialize(@site : NetboxExtractor::Config::Site, @host : FakeNamedHost)
  end

  def lookup
    find_custom_config_for(@host)
  end
end

Spectator.describe NetboxExtractor::Presenters::WithCustomConfig do
  let(site) do
    path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
    NetboxExtractor::Config::Base.from_yaml(File.read(path)).sites.first
  end

  # checks_config carries credentials and thresholds. Matching it on the exact
  # string meant an entry keyed by FQDN, or differing only in case, silently
  # produced a host rendered with default checks — no error, no warning, just
  # monitoring quietly reduced.
  describe ".matches_host?" do
    it "matches an exact name" do
      expect(NetboxExtractor::Presenters::WithCustomConfig.matches_host?("web1", "web1")).to be_true
    end

    it "matches regardless of case" do
      expect(NetboxExtractor::Presenters::WithCustomConfig.matches_host?("WEB1", "web1")).to be_true
    end

    it "matches a config entry keyed by FQDN against a short Netbox name" do
      expect(NetboxExtractor::Presenters::WithCustomConfig.matches_host?("web1.example.com", "web1")).to be_true
    end

    it "matches a short config entry against an FQDN Netbox name" do
      expect(NetboxExtractor::Presenters::WithCustomConfig.matches_host?("web1", "web1.example.com")).to be_true
    end

    it "does not match a different host sharing a prefix" do
      expect(NetboxExtractor::Presenters::WithCustomConfig.matches_host?("web12", "web1")).to be_false
    end

    it "does not match a nil name" do
      expect(NetboxExtractor::Presenters::WithCustomConfig.matches_host?("web1", nil)).to be_false
    end
  end

  describe "#find_custom_config_for" do
    it "finds an entry keyed by FQDN for a host named short in Netbox" do
      entry = NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: web1.example.com\ncheck_type: snmp")
      site.icinga.checks_config << entry

      expect(CustomConfigHarness.new(site, FakeNamedHost.new("web1")).lookup).to eq(entry)
    end

    it "returns nil when no entry matches" do
      expect(CustomConfigHarness.new(site, FakeNamedHost.new("nothing-here")).lookup).to be_nil
    end
  end
end
