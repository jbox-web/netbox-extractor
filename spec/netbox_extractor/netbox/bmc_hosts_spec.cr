require "../../spec_helper"
require "log/spec"

# A BMC modelled as the out-of-band IP of its server (`oob_ip`, on the server's
# management interface) must give monitoring exactly what the BMC modelled as a
# device of role `network-bmc` gave it: same host name, address, tags, vendor and
# file, so that no Icinga host, check setting or history is lost when the BMC
# devices are removed from Netbox.

private FIXTURES = Path.new(__DIR__, "../../fixtures/netbox")

# Netbox answering every list endpoint from fixtures, in a single page.
private class FixtureConnection < NetboxClient::Connection
  def initialize(@lists : Hash(String, Array(String)))
    super(NetboxClient::Configuration.new)
  end

  def request(klass : T.class, *, method : Symbol, path : String,
              body = nil, query : Hash(String, _)? = nil,
              form : Hash(String, Crest::ParamsValue)? = nil,
              header : Hash(String, String?)? = nil,
              accept : Array(String) = %w[application/json],
              content_type : Array(String) = %w[application/json],
              auth : Array(String) = %w[],
              raw : Bool = false) : NetboxClient::Response(T) forall T
    results = @lists.fetch(path, [] of String)
    json = %({"count": #{results.size}, "next": null, "previous": null, "results": [#{results.join(",")}]})
    NetboxClient::Response(T).new(T.from_json(json), 200, HTTP::Headers.new)
  end
end

# Netbox answering the IP list with only the IPs whose ids the request names,
# as Netbox's `id` filter does; records the id list of every IP request.
private class IdFilteringConnection < FixtureConnection
  getter ip_requests = [] of Array(Int32)

  def initialize(@devices : Array(String), @ips : Hash(Int32, String))
    super({"/api/dcim/devices/" => @devices})
  end

  def request(klass : T.class, *, method : Symbol, path : String,
              body = nil, query : Hash(String, _)? = nil,
              form : Hash(String, Crest::ParamsValue)? = nil,
              header : Hash(String, String?)? = nil,
              accept : Array(String) = %w[application/json],
              content_type : Array(String) = %w[application/json],
              auth : Array(String) = %w[],
              raw : Bool = false) : NetboxClient::Response(T) forall T
    return super unless path == "/api/ipam/ip-addresses/"

    ids = query.try(&.["id"]?).as?(Array(Int32)) || [] of Int32
    @ip_requests << ids
    results = ids.compact_map { |id| @ips[id]? }
    json = %({"count": #{results.size}, "next": null, "previous": null, "results": [#{results.join(",")}]})
    NetboxClient::Response(T).new(T.from_json(json), 200, HTTP::Headers.new)
  end
end

private def fixture(name)
  File.read(FIXTURES.join("#{name}.json"))
end

# The fixture server and its out-of-band IP, renumbered: server `esx<n>.lab01`,
# IP id `ip_id`, BMC host `drac-esx<n>.lab01`.
private def server_and_oob_ip(n, ip_id)
  rename = ->(json : String) { json.gsub("esx07.lab01", "esx#{n}.lab01").gsub(%("id": 7054), %("id": #{ip_id})) }
  {rename.call(fixture("server_with_oob_ip")), rename.call(fixture("oob_ip_address"))}
end

# Runs the Icinga generator of the example config's first site against the
# given Netbox lists; returns the content of the BMC host file, or nil.
private def render_bmc(devices : Array(String), ips : Array(String), host = "drac-esx07.lab01")
  example = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
  config = NetboxExtractor::Config::Base.from_yaml(File.read(example))
  tmp = File.tempname("nbx-bmc-spec")
  config.icinga.zones_dir = tmp
  config.ansible.fetch_facts.cache_dir = File.join(tmp, "facts")
  NetboxExtractor.config = config

  begin
    site = config.sites.first
    client = NetboxClient::Client.new(FixtureConnection.new({
      "/api/dcim/devices/"      => devices,
      "/api/ipam/ip-addresses/" => ips,
    }))
    NetboxExtractor::Generators::Icinga.new(
      site,
      NetboxExtractor::Netbox::DeviceInventory.new(site, client),
      NetboxExtractor::Netbox::VmInventory.new(site, client)
    ).run
    file = site.icinga_zones_path.join("network-bmc", "#{host}.conf")
    File.exists?(file) ? File.read(file) : nil
  ensure
    FileUtils.rm_rf tmp
  end
end

private def example_config
  example = File.expand_path("../../../netbox-extractor.yml.example", __DIR__)
  NetboxExtractor.config = NetboxExtractor::Config::Base.from_yaml(File.read(example))
end

# A loaded device inventory of the example config's first site.
private def inventory(devices : Array(String), ips : Array(String))
  site = example_config.sites.first
  client = NetboxClient::Client.new(FixtureConnection.new({
    "/api/dcim/devices/"      => devices,
    "/api/ipam/ip-addresses/" => ips,
  }))
  NetboxExtractor::Netbox::DeviceInventory.new(site, client).tap(&.load!)
end

Spectator.describe "BMC hosts from the servers' oob_ip" do
  it "renders the host the BMC device rendered, byte for byte" do
    from_device = render_bmc([fixture("legacy_bmc_device")], [] of String)
    from_oob_ip = render_bmc([fixture("server_with_oob_ip")], [fixture("oob_ip_address")])

    expect(from_device).not_to be_nil
    expect(from_oob_ip).to eq(from_device)
  end

  it "presents the BMC's name, address, role, vendor and generation" do
    rendered = render_bmc([fixture("server_with_oob_ip")], [fixture("oob_ip_address")])
    expect(rendered).not_to be_nil
    rendered = rendered.to_s

    expect(rendered).to contain(%(object Host "drac-esx07.lab01" {))
    expect(rendered).to contain(%(  address  = "192.0.2.54"))
    expect(rendered).to contain(%(vars.config["check"]["type"] = "snmp"))
    expect(rendered).to contain(%(vars.config["server"]["tags"]           = ["network-bmc"]))
    expect(rendered).to contain(%(vars.config["server"]["os_name"]        = "idrac9"))
    expect(rendered).to contain(%(vars.config["server"]["vendor_name"]    = "Dell"))
    expect(rendered).to contain(%(vars.config["server"]["vendor_model"]   = "iDrac9"))
  end

  # Migrated pair by pair: until its device is deleted, a BMC exists both as a
  # device and as its server's oob_ip. The device keeps the host.
  it "leaves a name still held by a device to that device" do
    legacy = fixture("legacy_bmc_device").gsub("192.0.2.54/24", "192.0.2.99/24")
    Log.capture("netbox-extractor.device_inventory") do |logs|
      rendered = render_bmc([legacy, fixture("server_with_oob_ip")], [fixture("oob_ip_address")])
      expect(rendered.to_s).to contain(%(  address  = "192.0.2.99"))
      logs.check(:warn, /drac-esx07\.lab01: still a Netbox device, the out-of-band IP of esx07\.lab01 is not used/)
    end
  end

  it "renders no host for an out-of-band IP without a DNS name, and says why" do
    ip = fixture("oob_ip_address").sub(%("dns_name": "drac-esx07.lab01"), %("dns_name": ""))
    Log.capture("netbox-extractor.device_inventory") do |logs|
      expect(inventory([fixture("server_with_oob_ip")], [ip]).fetch_devices("network-bmc")).to be_empty
      logs.check(:warn, /esx07\.lab01: out-of-band IP 192\.0\.2\.54\/24 has no DNS name, no BMC host/)
    end
  end

  # A decommissioned BMC device was skipped as not powered on; its IP, once
  # migrated, is no longer active and must be skipped the same way.
  it "renders no host for an out-of-band IP that is not active" do
    ip = fixture("oob_ip_address").sub(%("value": "active"), %("value": "deprecated"))
    expect(render_bmc([fixture("server_with_oob_ip")], [ip])).to be_nil
  end

  it "carries the IP's tags, as the BMC device carried its own" do
    tag = %({"id": 3, "url": "https://netbox.example.net/api/extras/tags/3/", "display_url": "https://netbox.example.net/extras/tags/3/", "display": "Broken", "name": "Broken", "slug": "broken", "color": "f44336"})
    ip = fixture("oob_ip_address").sub(%("tags": []), %("tags": [#{tag}]))
    rendered = render_bmc([fixture("server_with_oob_ip")], [ip]).to_s
    expect(rendered).to contain(%(vars.config["server"]["tags"]           = ["broken", "network-bmc"]))
  end

  it "gives Ansible the inventory entry the BMC device gave it" do
    site = example_config.sites.first
    from_device = inventory([fixture("legacy_bmc_device")], [] of String).fetch_devices("network-bmc")
    from_oob_ip = inventory([fixture("server_with_oob_ip")], [fixture("oob_ip_address")]).fetch_devices("network-bmc")
    expect(from_device.size).to eq(1)
    expect(from_oob_ip.size).to eq(1)

    entry = NetboxExtractor::Presenters::Ansible.new(site, from_oob_ip.first).to_ansible
    expect(entry).to eq(NetboxExtractor::Presenters::Ansible.new(site, from_device.first).to_ansible)
    expect(entry.to_json).to eq(%({"drac-esx07.lab01":{"ansible_user":"root","ansible_host":"192.0.2.54","netbox_tags":["network-bmc"],"netbox_os_name":"idrac9"}}))
  end

  # Generated inventories list their hosts in name order (Netbox's list order).
  # BMC hosts come from another list: merged in, they must take the place their
  # device had, or every migrated BMC would move in the generated inventory.
  it "serves devices and BMC hosts together in name order" do
    other = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "drac-aaa.lab01").gsub("192.0.2.54/24", "192.0.2.99/24")
    later = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "drac-zzz.lab01").gsub("192.0.2.54/24", "192.0.2.98/24")
    hosts = inventory([other, later, fixture("server_with_oob_ip")], [fixture("oob_ip_address")]).fetch_devices("network-bmc")
    expect(hosts.map(&.name)).to eq(["drac-aaa.lab01", "drac-esx07.lab01", "drac-zzz.lab01"])
  end

  # Netbox 4.4 sorts names with the ICU collation `und-u-kn-true`: numbers by
  # value, letters regardless of case. The order of the generated inventories
  # is Netbox's, not a byte order.
  it "serves devices in Netbox's order when no BMC host comes from an out-of-band IP" do
    two = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "drac-srv2.lab01").gsub("192.0.2.54/24", "192.0.2.92/24")
    ten = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "drac-srv10.lab01").gsub("192.0.2.54/24", "192.0.2.90/24")
    hosts = inventory([two, ten], [] of String).fetch_devices("network-bmc")
    expect(hosts.map(&.name)).to eq(["drac-srv2.lab01", "drac-srv10.lab01"])
  end

  it "merges BMC hosts into Netbox's order, numbers by value and letters regardless of case" do
    two = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "drac-esx2.lab01").gsub("192.0.2.54/24", "192.0.2.92/24")
    ten = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "drac-esx10.lab01").gsub("192.0.2.54/24", "192.0.2.90/24")
    upper = fixture("legacy_bmc_device").gsub("drac-esx07.lab01", "Drac-esx08.lab01").gsub("192.0.2.54/24", "192.0.2.88/24")
    hosts = inventory([two, fixture("server_with_oob_ip"), upper, ten], [fixture("oob_ip_address")]).fetch_devices("network-bmc")
    expect(hosts.map(&.name)).to eq(["drac-esx2.lab01", "drac-esx07.lab01", "Drac-esx08.lab01", "drac-esx10.lab01"])
  end

  # Netbox does not make an IP's DNS name unique: two servers can designate
  # out-of-band IPs of the same name. One host per name, or the second would
  # overwrite the first one's file and inventory entry without a word.
  it "renders one host per name when two out-of-band IPs share it, and says why" do
    first_server, first_ip = server_and_oob_ip("07", 7054)
    second_server, second_ip = server_and_oob_ip("08", 7055)
    second_ip = second_ip.gsub("drac-esx08.lab01", "drac-esx07.lab01").gsub("192.0.2.54/24", "192.0.2.55/24")

    Log.capture("netbox-extractor.device_inventory") do |logs|
      hosts = inventory([first_server, second_server], [first_ip, second_ip]).fetch_devices("network-bmc")
      expect(hosts.map(&.name)).to eq(["drac-esx07.lab01"])
      expect(hosts.first.netbox_primary_ip).to eq("192.0.2.54")
      logs.check(:warn, /drac-esx07\.lab01: already the out-of-band IP of esx07\.lab01, the out-of-band IP of esx08\.lab01 is not used/)
    end
  end

  # The out-of-band IPs are asked for by id, one `id=` per IP in the query
  # string. Gunicorn, Netbox's application server, refuses a request line over
  # 4094 bytes: a large site must not make the whole load fail.
  it "asks Netbox for the out-of-band IPs in requests a web server accepts" do
    pairs = (1..500).map { |n| server_and_oob_ip(n, 1_000_000 + n) }
    connection = IdFilteringConnection.new(pairs.map(&.[0]), pairs.to_h { |pair| {JSON.parse(pair[1])["id"].as_i, pair[1]} })
    site = example_config.sites.first
    inventory = NetboxExtractor::Netbox::DeviceInventory.new(site, NetboxClient::Client.new(connection)).tap(&.load!)

    request_lines = connection.ip_requests.map { |ids| "GET /api/ipam/ip-addresses/?limit=1000&offset=0&#{ids.join("&") { |id| "id=#{id}" }} HTTP/1.1".bytesize }
    expect(request_lines.max).to be < 4094
    expect(inventory.fetch_devices("network-bmc").size).to eq(500)
  end
end
