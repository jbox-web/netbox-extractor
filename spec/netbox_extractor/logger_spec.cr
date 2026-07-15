require "../spec_helper"

Spectator.describe NetboxExtractor::Logger do
  # C10: the config level was matched case-sensitively against lowercase keys,
  # so "Info" or "DEBUG" silently fell back to info.
  describe ".severity_for" do
    it "matches a level regardless of case" do
      expect(NetboxExtractor::Logger.severity_for("DEBUG")).to eq(Log::Severity::Debug)
      expect(NetboxExtractor::Logger.severity_for("Warn")).to eq(Log::Severity::Warn)
    end

    it "falls back to Info for an unknown level" do
      expect(NetboxExtractor::Logger.severity_for("nonsense")).to eq(Log::Severity::Info)
    end
  end
end
