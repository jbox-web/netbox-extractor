module NetboxExtractor
  # Fiber fan-out with failure isolation and aggregation.
  #
  # An unhandled exception in a `WaitGroup` fiber is printed to STDERR and then
  # swallowed — the process keeps running and still exits 0. That silently turns
  # a partial failure (a site that failed to load, a role that failed to render)
  # into a green run. `each_isolated` closes that gap: it rescues every fiber,
  # logs the failure, counts it fiber-safely, and re-raises one summary error
  # after all fibers finish so the caller — and the process exit code — sees it.
  module Concurrency
    Log = ::Log.for("netbox-extractor.concurrency")

    # Raised once, after all fibers complete, when one or more of them failed.
    class PartialFailure < Exception
    end

    def self.each_isolated(items : Array(T), what : String, &block : T ->) forall T
      failures = Atomic(Int32).new(0)

      WaitGroup.wait do |wg|
        items.each do |item|
          wg.spawn do
            block.call(item)
          rescue ex
            failures.add(1)
            Log.error(exception: ex) { "#{what} failed" }
          end
        end
      end

      count = failures.get
      return if count == 0

      raise PartialFailure.new("#{what}: #{count} of #{items.size} task(s) failed")
    end
  end
end
