require "../../spec_helper"

Spectator.describe NetboxExtractor::Controllers::Config do
  # The loaded config carries the Netbox API token, interpolated from the
  # environment by the config template. Dumping it verbatim would put a live
  # credential on a terminal, in a redirected file, and in the log of whatever
  # CI job called the command.
  describe ".redact_secrets" do
    it "redacts the Netbox API token" do
      yaml = "netbox:\n  hostname: netbox.example.com\n  api_token: 0123456789abcdef\n"

      expect(NetboxExtractor::Controllers::Config.redact_secrets(yaml)).to_not contain("0123456789abcdef")
    end

    it "redacts passwords wherever they appear, whatever the indentation" do
      yaml = "checks_config:\n  - host: db1\n    check_mysql:\n      username: admin\n      password: hunter2\n"

      redacted = NetboxExtractor::Controllers::Config.redact_secrets(yaml)

      expect(redacted).to_not contain("hunter2")
      expect(redacted).to contain("username: admin")
    end

    it "keeps the key and the layout, so the dump still reads as config" do
      yaml = "netbox:\n  api_token: secret\n"

      redacted = NetboxExtractor::Controllers::Config.redact_secrets(yaml)

      expect(redacted).to contain("  api_token:")
      expect(redacted.lines.size).to eq(yaml.lines.size)
    end

    it "leaves anything that merely mentions a secret alone" do
      yaml = "ansible:\n  playbook: password-rotation.yml\n"

      expect(NetboxExtractor::Controllers::Config.redact_secrets(yaml)).to contain("password-rotation.yml")
    end
  end
end
