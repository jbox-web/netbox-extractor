require "../../spec_helper"

# A Netbox connection that fails every request, standing in for an unreachable
# or erroring Netbox instance.
class RaisingConnection < NetboxClient::Connection
  def request(klass : T.class, **opts) forall T
    raise NetboxClient::ApiError.new("simulated Netbox failure")
  end
end

Spectator.describe NetboxExtractor::Generators::Icinga do
  # An entry naming a host the site does not have is dead config: the tuning it
  # carries applies to nothing, and nothing said so.
  describe ".orphan_checks_config" do
    let(entries) do
      [
        NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: web1.example.com"),
        NetboxExtractor::Config::Icinga::SiteCheckConfig.from_yaml("host: gone"),
      ]
    end

    it "keeps only the entries matching no loaded host" do
      orphans = NetboxExtractor::Generators::Icinga.orphan_checks_config(entries, ["web1", "db1"])

      expect(orphans.map(&.host)).to eq(["gone"])
    end

    it "reports every entry when nothing was loaded" do
      orphans = NetboxExtractor::Generators::Icinga.orphan_checks_config(entries, [] of String)

      expect(orphans.size).to eq(2)
    end
  end

  # C1: a transient Netbox failure must never be mistaken for "zero hosts" and
  # wipe the existing Icinga config. With build-then-swap the live directory is
  # only touched on success, so a load failure leaves it fully intact.
  it "does not wipe existing output when the Netbox load fails" do
    example = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
    config = NetboxExtractor::Config::Base.from_yaml(File.read(example))

    tmp = File.tempname("nbx-icinga-spec")
    config.icinga.zones_dir = tmp
    NetboxExtractor.config = config

    begin
      site = config.sites.first
      zone_dir = site.icinga_zones_path
      FileUtils.mkdir_p zone_dir
      existing = zone_dir.join("existing.conf")
      File.write(existing, "PREVIOUS CONFIG")

      client = NetboxClient::Client.new(RaisingConnection.new(NetboxClient::Configuration.new))
      device_inventory = NetboxExtractor::Netbox::DeviceInventory.new(site, client)
      vm_inventory = NetboxExtractor::Netbox::VmInventory.new(site, client)
      generator = NetboxExtractor::Generators::Icinga.new(site, device_inventory, vm_inventory)

      expect { generator.run }.to raise_error(NetboxClient::ApiError)

      expect(File.exists?(existing)).to be_true
      expect(File.read(existing)).to eq("PREVIOUS CONFIG")
    ensure
      FileUtils.rm_rf tmp
    end
  end
end
