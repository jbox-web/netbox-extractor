require "./netbox_extractor"

# Entry point. Everything else lives in src/netbox_extractor.cr, which is a
# library: requiring it has no side effect and starts nothing.
#
# The two were one file until they weren't: the spec binary requires the code,
# and the application's argument parser was handed the spec runner's own ARGV —
# `--no-color` was read as a subcommand and the suite exited before defining a
# single example. Keep this file to the program's own concern — running — so
# anything that needs the code can require the library instead.
#
# The handler is unconditional: `Crystal.env` reads CRYSTAL_ENV at runtime and
# nothing sets it — not the Dockerfile, not Makefile.release, and certainly not
# an operator running the static binary from a release. Guarding it on
# `production?` made it dead code exactly where it was meant to run.
begin
  NetboxExtractor::CLI.run
rescue e : Exception
  # A reader that walked away is not a failure of this program: `| head` takes
  # its lines and leaves, `| less` is quit halfway. Crystal's runtime ignores
  # SIGPIPE at startup, so the process is not killed and the write comes back
  # EPIPE instead — which fell straight into the catch-all below and answered a
  # perfectly ordinary `| head` with a stack trace and a non-zero exit. Exit
  # quietly and successfully: the output was truncated because the reader asked
  # for it.
  #
  # Matched on the errno rather than on the message, which is not a contract.
  exit 0 if e.is_a?(IO::Error) && e.os_error == Errno::EPIPE
  STDERR.puts e.inspect_with_backtrace
  exit 1
end
