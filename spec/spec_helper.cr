require "spectator"
require "crystal-env/spec"

# The library, not the program: requiring the entry point would run the CLI
# against the spec runner's own ARGV.
require "../src/netbox_extractor"
