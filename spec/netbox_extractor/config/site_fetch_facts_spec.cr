require "../../spec_helper"

Spectator.describe NetboxExtractor::Config::Ansible::SiteFetchFacts do
  # E6: with non-nil defaults the site value always won and an explicit `false`
  # was indistinguishable from "unset", silently shadowing the global config.
  describe "override inheritance" do
    it "leaves overrides nil (inherit global) when unset" do
      ff = NetboxExtractor::Config::Ansible::SiteFetchFacts.from_yaml("inventories: []")

      expect(ff.host_key_checking).to be_nil
      expect(ff.fork_limit).to be_nil
    end

    it "distinguishes an explicit false override from unset" do
      ff = NetboxExtractor::Config::Ansible::SiteFetchFacts.from_yaml("host_key_checking: false")

      expect(ff.host_key_checking).to be_false
    end
  end
end
