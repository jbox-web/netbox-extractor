require "../../spec_helper"

Spectator.describe NetboxExtractor::ConfigCheck::Checker do
  let(site) do
    path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
    NetboxExtractor::Config::Base.from_yaml(File.read(path)).sites.first
  end

  # The rule the presenters use, so what the checker calls an orphan is exactly
  # what the generator would fail to apply.
  describe ".orphan_checks_config" do
    let(entries) do
      [
        NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: web1.example.com"),
        NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: gone"),
      ]
    end

    it "keeps only the entries matching no loaded host" do
      orphans = NetboxExtractor::ConfigCheck::Checker.orphan_checks_config(entries, ["web1", "db1"])

      expect(orphans.map(&.host)).to eq(["gone"])
    end

    it "reports every entry when nothing was loaded" do
      expect(NetboxExtractor::ConfigCheck::Checker.orphan_checks_config(entries, [] of String).size).to eq(2)
    end
  end

  describe ".check_site" do
    it "reports nothing when every configured name designates a loaded host" do
      # The shipped example names hosts of its own; this case is about a
      # configuration whose every name resolves.
      site.icinga.checks_config.clear
      site.exclude_objects = [] of String
      site.icinga.checks_config << NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: web1")
      site.include_objects = ["web1"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.map(&.message)).to be_empty
    end

    # A role that brings back nothing is the same class of mistake seen from
    # the other end: the configuration asks for objects Netbox does not have
    # under that slug, and the run simply generates fewer files.
    it "reports a configured role that no loaded object carries" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"], roles: ["server-linux"])

      expect(findings.any?(&.message.includes?("storage-netapp"))).to be_true
    end

    it "says nothing about roles when Netbox was not queried for them" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.any?(&.message.includes?("role"))).to be_false
    end

    it "reports a checks_config entry designating no host" do
      site.icinga.checks_config << NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: bime-mariadb01.mar02")

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.any?(&.message.includes?("bime-mariadb01.mar02"))).to be_true
      expect(findings.all?(&.warning?)).to be_true
    end

    # include_objects is compared by strict equality in InventoryFilters, so an
    # entry naming a host that does not exist silently keeps every other host
    # out — the most destructive of the silent cases, since it empties the
    # inventory rather than degrading one host.
    it "reports an include_objects entry designating no host" do
      site.include_objects = ["typo-host"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.any?(&.message.includes?("typo-host"))).to be_true
    end

    it "reports an exclude_objects entry designating no host" do
      site.exclude_objects = ["already-decommissioned"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.any?(&.message.includes?("already-decommissioned"))).to be_true
    end

    it "carries the site id on every finding" do
      site.exclude_objects = ["nope"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.map(&.site).uniq!).to eq([site.id])
    end

    # Which file to edit is the point of the report: a site id alone does not
    # say whether the entry sits in the main config or in one of the
    # sites_config: files.
    it "names the file the site was read from" do
      site.source_path = "sites/jaguar.yml"
      site.exclude_objects = ["W2022"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])
      rendered = findings.map(&.to_s)

      expect(rendered.any?(&.includes?("(sites/jaguar.yml)"))).to be_true
      expect(rendered.any?(&.includes?("W2022"))).to be_true
    end
  end

  # Without Netbox there is nothing to compare names against, so only what the
  # file says about itself can be judged.
  describe ".check_static" do
    it "accepts the shipped example config" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))

      expect(NetboxExtractor::ConfigCheck::Checker.check_static(config)).to be_empty
    end

    it "reports a validation failure as an error, not a warning" do
      path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
      config = NetboxExtractor::Config::Base.from_yaml(File.read(path))
      config.sites << config.sites.first

      findings = NetboxExtractor::ConfigCheck::Checker.check_static(config)

      expect(findings.any?(&.error?)).to be_true
    end
  end
end
