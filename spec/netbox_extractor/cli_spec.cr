require "../spec_helper"

Spectator.describe NetboxExtractor::CLI do
  # A parent command with no subcommand match used to print the help and exit 0.
  # In cron or CI that turns `netbox-extractor ansible genrate` into a complete
  # no-op reported as a success: nothing generated, nothing failed.
  #
  # Admiral leaves the unmatched word in @argv (probed: [] with no argument,
  # ["subb"] on a typo), which is what tells a typo apart from a bare
  # invocation — the latter must keep printing the help and exiting 0.
  describe ".unknown_subcommand" do
    it "returns nothing when no argument was given" do
      expect(NetboxExtractor::CLI.unknown_subcommand([] of Admiral::StringValue)).to be_nil
    end

    it "returns the offending word when one is left over" do
      argv = Admiral.new_arglist(["genrate"])

      expect(NetboxExtractor::CLI.unknown_subcommand(argv)).to eq("genrate")
    end

    # `crystal spec` passes --no-color to the spec binary, which loads the CLI:
    # taking a flag for a subcommand made the suite exit before defining a
    # single example.
    it "ignores a leftover flag, which is Admiral's business, not a subcommand" do
      expect(NetboxExtractor::CLI.unknown_subcommand(Admiral.new_arglist(["--no-color"]))).to be_nil
    end

    it "reports the first word when several are left over" do
      argv = Admiral.new_arglist(["genrate", "--site", "dc1"])

      expect(NetboxExtractor::CLI.unknown_subcommand(argv)).to eq("genrate")
    end
  end
end
