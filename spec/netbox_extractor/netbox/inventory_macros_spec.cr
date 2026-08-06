require "../../spec_helper"

# A Netbox connection whose name cannot be resolved, as an unreachable host is.
private class UnresolvableConnection < NetboxClient::Connection
  def request(klass : T.class, **opts) forall T
    raise Socket::Addrinfo::Error.new(-8, "No address found", "netbox.example.net")
  end
end

Spectator.describe NetboxExtractor::Netbox::InventoryMacros do
  let(site) do
    path = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
    config = NetboxExtractor::Config::Base.from_yaml(File.read(path))
    NetboxExtractor.config = config
    config.sites.first
  end

  let(backend) { Log::MemoryBackend.new }

  before_each { ::Log.setup("netbox-extractor.device_inventory", :debug, backend) }
  after_each { ::Log.setup_from_env }

  describe "a load failure" do
    # The failure is re-raised, and the caller decides what to do with it —
    # each_isolated logs it with its stack, `config check` turns it into a
    # finding. Attaching the exception here too printed a full stack trace
    # underneath a report that had already explained the problem in one line.
    it "is reported without a stack trace, and re-raised" do
      inventory = NetboxExtractor::Netbox::DeviceInventory.new(
        site,
        NetboxClient::Client.new(UnresolvableConnection.new(NetboxClient::Configuration.new)))

      expect { inventory.load! }.to raise_error(Socket::Addrinfo::Error)

      failure = backend.entries.find(&.severity.error?)
      expect(failure).to_not be_nil
      expect(failure.try(&.message)).to contain("load failed")
      expect(failure.try(&.exception)).to be_nil
    end
  end
end
