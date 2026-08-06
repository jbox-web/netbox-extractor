require "../../spec_helper"

# A Netbox connection that fails every request, standing in for an unreachable
# or erroring Netbox instance.
class RaisingConnection < NetboxClient::Connection
  def request(klass : T.class, **opts) forall T
    raise NetboxClient::ApiError.new("simulated Netbox failure")
  end
end

Spectator.describe NetboxExtractor::Generators::Icinga do
  # The orphan-entry rule moved to ConfigCheck::Checker, which the generator
  # now calls; it is covered in spec/netbox_extractor/config_check/checker_spec.cr.

  # The swap used to delete the live directory and then rename the staged one
  # over it, leaving a window with no config at all. Moving the old one aside
  # first means the destination is only ever occupied by a complete zone.
  describe ".swap_directory" do
    it "replaces the live config, leaving neither the old one nor a leftover" do
      tmp = File.tempname("nbx-swap-spec")
      FileUtils.mkdir_p tmp

      begin
        final_path = Path.new(tmp, "zone")
        staging_path = Path.new(tmp, ".zone.staging")
        previous_path = Path.new(tmp, ".zone.previous")

        FileUtils.mkdir_p final_path
        File.write(final_path.join("old.conf"), "OLD")
        FileUtils.mkdir_p staging_path
        File.write(staging_path.join("new.conf"), "NEW")

        NetboxExtractor::Generators::Icinga.swap_directory(staging_path, final_path, previous_path)

        expect(File.exists?(final_path.join("new.conf"))).to be_true
        expect(File.exists?(final_path.join("old.conf"))).to be_false
        expect(File.exists?(previous_path)).to be_false
      ensure
        FileUtils.rm_rf tmp
      end
    end

    it "works when there is no live config yet" do
      tmp = File.tempname("nbx-swap-spec")
      FileUtils.mkdir_p tmp

      begin
        final_path = Path.new(tmp, "zone")
        staging_path = Path.new(tmp, ".zone.staging")
        FileUtils.mkdir_p staging_path
        File.write(staging_path.join("new.conf"), "NEW")

        NetboxExtractor::Generators::Icinga.swap_directory(staging_path, final_path, Path.new(tmp, ".zone.previous"))

        expect(File.exists?(final_path.join("new.conf"))).to be_true
      ensure
        FileUtils.rm_rf tmp
      end
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
