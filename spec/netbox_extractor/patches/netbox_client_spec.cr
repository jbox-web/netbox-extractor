require "../../spec_helper"

# Stand-ins for the generated Netbox types: the mixin only reads `slug` off
# tags and role.
private record FakeSlug, slug : String

# Minimal host carrying the mixin, with just the fields `netbox_tags` reads.
private class FakeHost
  include NetboxExtractor::Patches::NetboxClient

  getter tags : Array(FakeSlug)?
  getter role : FakeSlug?
  getter name : String?

  def initialize(@tags : Array(FakeSlug)?, @role : FakeSlug? = FakeSlug.new("storage"), @name : String? = "host1")
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

  describe "#netbox_check_by_snmp?" do
    it "is false, not nil, for an untagged host" do
      expect(FakeHost.new(nil).netbox_check_by_snmp?).to be_false
    end
  end
end
