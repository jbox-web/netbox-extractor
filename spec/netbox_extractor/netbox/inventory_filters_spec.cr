require "../../spec_helper"

# Minimal stand-in for a Netbox object: only what the shared filters read.
private class FakeObject
  getter name : String?

  def initialize(@name : String?, @status : String? = "active", @platform : String? = "debian-12")
  end

  def netbox_is_os?(os)
    @platform.try(&.includes?(os)) || false
  end

  def netbox_platform_known?
    !@platform.nil?
  end

  def netbox_powered_on?
    @status == "active"
  end

  def netbox_status_known?
    !@status.nil?
  end
end

# Host for the mixin, standing in for a real inventory: it only has to provide
# `@site` and a `Log`, as the mixin's doc-comment states.
private class FilterHarness
  include NetboxExtractor::Netbox::InventoryFilters

  def initialize(@site : NetboxExtractor::Config::Site)
  end

  def call(objects)
    filter_objects(objects)
  end

  def call_os(objects, os)
    objects.select { |o| object_matches_os?(o, os) }
  end
end

Spectator.describe NetboxExtractor::Netbox::InventoryFilters do
  let(site) do
    path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
    NetboxExtractor::Config::Base.from_yaml(File.read(path)).sites.first
  end

  let(backend) { Log::MemoryBackend.new }

  # Scoped to this spec's own source: a global setup would lower the level for
  # every other example and dump their logs into the run output.
  before_each { ::Log.setup("netbox-extractor.inventory_filters", :debug, backend) }
  after_each { ::Log.setup_from_env }

  # A null status is not the same as a status of "offline": the object is
  # dropped because Netbox says nothing about it, which is a data problem to
  # report, not a decision to make silently.
  describe "an object whose status is null" do
    it "is dropped, and says so" do
      result = FilterHarness.new(site).call([FakeObject.new("host1", status: nil)])

      expect(result).to be_empty
      expect(backend.entries.map(&.message).any?(&.includes?("host1"))).to be_true
    end
  end

  # A VM with no platform matches no OS family, so it vanishes from every
  # inventory and every Icinga config even though it carries a configured role.
  # That is the single most expensive failure to notice, since nothing anywhere
  # mentions the host.
  describe "an object whose platform is null" do
    it "matches no OS family, and says so" do
      result = FilterHarness.new(site).call_os([FakeObject.new("host3", platform: nil)], "linux")

      expect(result).to be_empty
      expect(backend.entries.map(&.message).any?(&.includes?("host3"))).to be_true
    end
  end

  describe "an object whose platform is set but of another family" do
    it "is dropped without a warning, which is the normal case" do
      result = FilterHarness.new(site).call_os([FakeObject.new("host4", platform: "windows-2022")], "linux")

      expect(result).to be_empty
      expect(backend.entries.map(&.message).any?(&.includes?("host4"))).to be_false
    end
  end

  describe "an object that is powered off" do
    it "is dropped without a warning, which is the normal case" do
      result = FilterHarness.new(site).call([FakeObject.new("host2", status: "offline")])

      expect(result).to be_empty
      expect(backend.entries.map(&.message).any?(&.includes?("host2"))).to be_false
    end
  end
end
