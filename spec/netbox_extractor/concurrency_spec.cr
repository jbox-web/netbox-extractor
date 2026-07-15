require "../spec_helper"

Spectator.describe NetboxExtractor::Concurrency do
  describe ".each_isolated" do
    it "runs the block for every item" do
      seen = [] of Int32
      mutex = Mutex.new

      NetboxExtractor::Concurrency.each_isolated([1, 2, 3], "task") do |n|
        mutex.synchronize { seen << n }
      end

      expect(seen.sort).to eq([1, 2, 3])
    end

    it "isolates a failing fiber and still runs the others, then raises a summary" do
      completed = [] of Int32
      mutex = Mutex.new

      expect do
        NetboxExtractor::Concurrency.each_isolated([1, 2, 3], "task") do |n|
          raise "boom" if n == 2
          mutex.synchronize { completed << n }
        end
      end.to raise_error(NetboxExtractor::Concurrency::PartialFailure)

      # The non-failing items still completed — one bad fiber does not abort the rest.
      expect(completed.sort).to eq([1, 3])
    end

    it "does not raise when every item succeeds" do
      expect do
        NetboxExtractor::Concurrency.each_isolated([1, 2], "task") { |_n| }
      end.to_not raise_error
    end
  end
end
