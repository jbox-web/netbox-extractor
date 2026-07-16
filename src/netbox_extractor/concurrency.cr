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

    # Runs `block` for each item on its own fiber, isolating failures: an
    # exception in one fiber is logged and counted (via an `Atomic`) rather than
    # crashing the fan-out. `what` labels the work in log and error messages.
    #
    # `fatal` controls what a failure means for the caller:
    # - `true` (default): each failure is logged at `error` with its full
    #   backtrace, and a single `PartialFailure` is raised after all fibers
    #   finish so the caller — and the process exit code — reflect the failure.
    #   Use for work where a failure is a real bug (inventory/Icinga generation).
    # - `false`: each failure is logged at `warn` as a one-line message (no
    #   backtrace) and nothing is raised. Use for best-effort work where partial
    #   failure is routine (fact gathering: unreachable hosts).
    def self.each_isolated(items : Array(T), what : String, fatal : Bool = true, &block : T ->) forall T
      failures = Atomic(Int32).new(0)

      WaitGroup.wait do |wg|
        items.each do |item|
          wg.spawn do
            block.call(item)
          rescue ex
            failures.add(1)
            if fatal
              Log.error(exception: ex) { "#{what} failed" }
            else
              Log.warn { "#{what} failed: #{ex.message}" }
            end
          end
        end
      end

      count = failures.get
      return if count == 0 || !fatal

      raise PartialFailure.new("#{what}: #{count} of #{items.size} task(s) failed")
    end
  end
end
