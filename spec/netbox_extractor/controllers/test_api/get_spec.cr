require "../../../spec_helper"

Spectator.describe NetboxExtractor::Controllers::TestApi::GET do
  # The smoke test dumps every result as YAML at debug level. Applied to the
  # users API that means Netbox API tokens written verbatim into the log file,
  # which outlives the run and is not treated as a secret store. Sensitive
  # endpoints must report their count and nothing else.
  describe ".log_result" do
    let(backend) { Log::MemoryBackend.new }

    # Scoped to the controller's own source: a global setup would lower the
    # level for every other example and dump their logs into the run output.
    before_each { ::Log.setup("netbox-extractor.test_api.get", :debug, backend) }
    after_each { ::Log.setup_from_env }

    it "never dumps the payload of a sensitive endpoint" do
      NetboxExtractor::Controllers::TestApi::GET.log_result(["s3cr3t-token"], sensitive: true)

      messages = backend.entries.map(&.message)
      expect(messages).to contain("count: 1")
      expect(messages.any?(&.includes?("s3cr3t-token"))).to be_false
    end

    it "still dumps the payload of a regular endpoint" do
      NetboxExtractor::Controllers::TestApi::GET.log_result(["site1"])

      expect(backend.entries.map(&.message).any?(&.includes?("site1"))).to be_true
    end
  end
end
