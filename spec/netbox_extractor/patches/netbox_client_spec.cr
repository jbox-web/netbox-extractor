require "../../spec_helper"

# Stand-ins for the generated Netbox types: the mixin only reads `slug` off
# tags, role and platform.
private record FakeSlug, slug : String

# Minimal host carrying the mixin, with just the fields the helpers read.
private class FakeHost
  include NetboxExtractor::Patches::NetboxClient

  getter tags : Array(FakeSlug)?
  getter role : FakeSlug?
  getter name : String?
  getter platform : FakeSlug?

  def initialize(@tags : Array(FakeSlug)? = nil,
                 @role : FakeSlug? = FakeSlug.new("storage"),
                 @name : String? = "host1",
                 platform : String? = nil)
    @platform = platform.try { |slug| FakeSlug.new(slug) }
  end

  # Type-specific part, as the real device and VM patches provide it.
  def netbox_icinga_subdir
    netbox_role.to_s
  end
end

Spectator.describe NetboxExtractor::Patches::NetboxClient do
  describe "#netbox_tags" do
    it "adds the role slug and strips source-* provenance tags" do
      host = FakeHost.new([FakeSlug.new("check-by-snmp"), FakeSlug.new("source-vmware")])

      expect(host.netbox_tags).to eq(["check-by-snmp", "storage"])
    end

    # Netbox returns a null tags array rather than an empty one for an object
    # that was never tagged. Threading that nil through meant the role slug was
    # never added and the SNMP/ping detection returned nil instead of false, so
    # an untagged host silently lost its role tag in the generated config.
    it "still yields the role slug when Netbox returns no tags at all" do
      host = FakeHost.new(nil)

      expect(host.netbox_tags).to eq(["storage"])
    end

    it "yields an empty list when there are neither tags nor a role" do
      host = FakeHost.new(nil, nil)

      expect(host.netbox_tags).to be_empty
    end
  end

  # The `filename` key of an Icinga role was accepted by the config and read by
  # nobody: the example config has been asking for a renamed directory since the
  # beginning and silently getting the role name instead.
  describe "#netbox_icinga_filename" do
    it "defaults to the type's own subdirectory" do
      expect(FakeHost.new(nil).netbox_icinga_filename).to eq("storage/host1.conf")
    end

    it "uses the role's configured filename as the subdirectory when given" do
      expect(FakeHost.new(nil).netbox_icinga_filename("physical-linux")).to eq("physical-linux/host1.conf")
    end
  end

  # OS detection is what decides whether a host enters an inventory at all
  # (fetch_vms selects on netbox_is_os?), and it had no spec whatsoever.
  describe "OS detection" do
    it "reads the platform slug, falling back to unknown" do
      expect(FakeHost.new(platform: "debian-12").netbox_os_name).to eq("debian-12")
      expect(FakeHost.new.netbox_os_name).to eq("unknown")
    end

    it "classes the Linux-family slugs as linux" do
      %w[linux debian-12 ubuntu-24-04 vmkernel-7 vmware-esxi].each do |slug|
        host = FakeHost.new(platform: slug)

        expect(host.netbox_linux?).to be_true
        expect(host.netbox_os_family).to eq("linux")
        expect(host.netbox_is_os?("linux")).to be_true
      end
    end

    it "classes the Windows slugs as windows" do
      %w[windows microsoft-windows-2022].each do |slug|
        host = FakeHost.new(platform: slug)

        expect(host.netbox_windows?).to be_true
        expect(host.netbox_os_family).to eq("windows")
        expect(host.netbox_is_os?("windows")).to be_true
      end
    end

    it "matches no family without a platform, which is what makes the host vanish" do
      host = FakeHost.new

      expect(host.netbox_is_os?("linux")).to be_false
      expect(host.netbox_is_os?("windows")).to be_false
      expect(host.netbox_os_family).to eq("unknown")
    end

    it "returns false for an OS name it does not dispatch on" do
      expect(FakeHost.new(platform: "debian-12").netbox_is_os?("bsd")).to be_false
    end

    # Documents current behaviour, not desired behaviour: detection is a
    # substring test and linux is tried first, so a slug carrying both words is
    # classed linux. Left as-is pending a decision — changing it would move
    # hosts between inventories.
    it "classes a slug carrying both words as linux, linux being tested first" do
      expect(FakeHost.new(platform: "windows-subsystem-linux").netbox_linux?).to be_true
      expect(FakeHost.new(platform: "windows-subsystem-linux").netbox_os_family).to eq("linux")
    end
  end

  describe "#netbox_check_by_snmp?" do
    it "is false, not nil, for an untagged host" do
      expect(FakeHost.new(nil).netbox_check_by_snmp?).to be_false
    end
  end
end
