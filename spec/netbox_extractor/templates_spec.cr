require "../spec_helper"

Spectator.describe "Icinga templates" do
  # Templates are baked at compile time and only parsed by Crinja at render
  # time, so a syntax error in a template would not surface from `crystal build`.
  # Parse every template through the shared environment (which registers the
  # custom filters) to catch edit mistakes such as a broken filter pipe.
  it "all parse without a Crinja syntax error" do
    dir = File.expand_path("../../templates/icinga", __DIR__)
    templates = Dir.glob(File.join(dir, "*.j2"))
    expect(templates).to_not be_empty

    templates.each do |path|
      NetboxExtractor::Utils::CRINJA.from_string(File.read(path))
    end
  end

  # Credential fields are emitted BARE on purpose: operators put the name of an
  # Icinga2 constant there (`JAGUAR_POSTGRES_PASS`, defined in constants.conf),
  # not a literal. Quoting them turns the reference into the string
  # "JAGUAR_POSTGRES_PASS", so the check receives the constant's name instead of
  # its value — with no parse error to reveal it. This spec exists to stop a
  # future pass from "fixing" the missing quotes; the trade-off is documented in
  # the template itself.
  describe "credentials" do
    it "are emitted bare so an Icinga2 constant reference survives" do
      dir = File.expand_path("../../templates/icinga", __DIR__)
      constant = "JAGUAR_POSTGRES_PASS"

      # The shared environment raises on undefined, so the unconditional part of
      # each template needs a value; only the credential blocks are under test.
      base = {
        "hostname"        => "host1",
        "icinga_zone"     => "zone1",
        "ipv4_address"    => "10.0.0.1",
        "check_type"      => "snmp",
        "host_zone"       => "dc1",
        "host_type"       => "virtual",
        "hosting_node"    => "esx1",
        "tags"            => [] of String,
        "os_name"         => "linux",
        "os_family"       => "debian",
        "vendor_name"     => "Dell",
        "vendor_model"    => "R740",
        "partitions_list" => [] of String,
      }

      {
        "generic-host.j2"   => {"icinga_check_rabbit_data" => {"username" => "admin", "password" => constant, "node" => "rabbit1", "queues" => [] of String}},
        "hypervisor-esx.j2" => {"icinga_check_esx_data" => {"username" => "admin", "password" => constant}},
        "storage-netapp.j2" => {"icinga_check_netapp_data" => {"check_api" => {"username" => "admin", "password" => constant, "base_url" => "https://netapp1"}}},
      }.each do |template, bindings|
        variables = Crinja::Variables.new
        base.each { |k, v| variables[k] = Crinja::Value.new(v) }
        bindings.each { |k, v| variables[k] = Crinja::Value.new(v) }

        rendered = NetboxExtractor::Utils::CRINJA.from_string(File.read(File.join(dir, template))).render(variables)

        expect(rendered).to contain("= JAGUAR_POSTGRES_PASS")
        expect(rendered).to_not contain(%q("JAGUAR_POSTGRES_PASS"))
      end
    end
  end
end
