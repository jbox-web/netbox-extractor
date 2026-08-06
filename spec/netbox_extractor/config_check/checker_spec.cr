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

    # An orphan exclude_objects entry is not always dead config. The filter
    # compares by strict equality, so an entry differing from a real host only
    # in case, or by a domain, silently fails to exclude it: the host is
    # monitored while the config says it should not be. Deleting the entry would
    # entrench the opposite of the intent, so the report has to tell the two
    # cases apart.
    it "names the near match when an exclude entry differs only in case" do
      site.exclude_objects = ["W2022"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["w2022"])
      message = findings.map(&.message).find(&.includes?("W2022"))

      expect(message).to_not be_nil
      expect(message.to_s).to contain("w2022")
      expect(message.to_s).to contain("not being applied")
    end

    it "names the near match across the FQDN boundary" do
      site.include_objects = ["web1.example.com"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])
      message = findings.map(&.message).find(&.includes?("web1.example.com"))

      expect(message.to_s).to contain("web1")
      expect(message.to_s).to contain("not being applied")
    end

    it "says plainly that nothing resembles the entry when nothing does" do
      site.exclude_objects = ["long-gone"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])
      message = findings.map(&.message).find(&.includes?("long-gone"))

      expect(message.to_s).to contain("matches no host")
      expect(message.to_s).to_not contain("not being applied")
    end

    it "reports an exclude_objects entry designating no host" do
      site.exclude_objects = ["already-decommissioned"]

      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.any?(&.message.includes?("already-decommissioned"))).to be_true
    end

    # OS detection is a substring test with linux tried first, so a slug
    # carrying markers of both families is classed linux without windows ever
    # being evaluated. Whether that matters depends on the slugs a given Netbox
    # actually holds — which nothing exposed until now.
    it "reports a platform slug that carries markers of both OS families" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"], platforms: ["windows-subsystem-linux"])

      message = findings.map(&.message).find(&.includes?("windows-subsystem-linux"))
      expect(message.to_s).to contain("both")
      expect(message.to_s).to contain("linux")
    end

    it "says nothing about unambiguous slugs" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"], platforms: ["debian-12", "microsoft-windows-2022", "vmware-esxi"])

      expect(findings.map(&.message).any?(&.includes?("both"))).to be_false
    end

    # A VM with no platform matches no OS family and vanishes from every
    # output; a device still gets generated, but with an OS of "unknown".
    it "reports a VM with no platform as absent from every output" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"], vms_without_platform: ["vm-no-platform"])

      message = findings.map(&.message).find(&.includes?("vm-no-platform"))
      expect(message.to_s).to contain("no platform")
    end

    it "reports a device with no platform as generated with an unknown OS" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"], devices_without_platform: ["dev-no-platform"])

      message = findings.map(&.message).find(&.includes?("dev-no-platform"))
      expect(message.to_s).to contain("unknown")
    end

    it "says nothing about platforms when Netbox was not queried for them" do
      findings = NetboxExtractor::ConfigCheck::Checker.check_site(site, ["web1"])

      expect(findings.map(&.message).any?(&.includes?("platform"))).to be_false
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
