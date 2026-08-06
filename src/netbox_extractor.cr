# Load std libs
require "log"
require "json"
require "yaml"

# Load external libs
require "crystal-env/core"

require "admiral"
require "any_hash"
require "baked_file_system"
require "cr-color-logging"
require "crinja"
require "dotenv"
require "netbox-client"

# Set environment
Crystal::Env.default("development")

# Load stacker
require "./netbox_extractor/**"

# Top-level namespace. Holds the process-wide `config` and `client` singletons
# (both require explicit initialisation via `load_config`/`init_app!`) and
# exposes the version string.
#
# This file is a library: requiring it has no side effect and starts nothing.
# Running the program is the concern of src/netbox-extractor.cr alone, so that
# anything else — the spec suite, a future benchmark harness — can require the
# code without the CLI parsing its arguments. The two were one file until the
# spec binary's own `--no-color` reached the CLI's argument parser.
module NetboxExtractor
  extend NetboxExtractor::Logger

  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
  GIT_REF = {{ `git log -n 1 --format="%H" | head -c 8`.chomp.stringify }}

  # Human-readable version string combining the shard `VERSION` and the short
  # `GIT_REF` of the build commit.
  def self.version
    "#{VERSION} (#{GIT_REF})"
  end

  # Loads the `.env` file if there is one, renders the YAML config template
  # (which may reference `ENV`) through Crinja, deserialises it into
  # `Config::Base`, validates it, and stores it as the `config` singleton.
  # Raises if the template fails to render.
  #
  # `load?` rather than `load`: a container or CI run exports its secrets and
  # ships no `.env`, and refusing to start there would reject an environment
  # that is in fact complete. A `.env` that is present still wins as before.
  def self.load_config(config_path, env_path)
    Dotenv.load? File.expand_path(env_path)
    config_template = File.read(File.expand_path(config_path))
    config_file = NetboxExtractor::Utils.render_template(config_template, {"ENV" => ENV.to_h})
    self.config = Config::Base.from_yaml(config_file)
    config.validate!
  rescue ex : Crinja::Error
    # Keep the Crinja error as the cause: its message carries the template line
    # and surrounding context, which a bare String raise would drop along with
    # the backtrace.
    raise RuntimeError.new("Failed to render config template #{config_path}: #{ex.message}", cause: ex)
  end

  # Sets the process-wide configuration singleton.
  def self.config=(config : Config::Base)
    @@config = config
  end

  @@config : Config::Base? = nil

  # The loaded configuration singleton. Raises if `load_config` has not run yet.
  def self.config : Config::Base
    @@config || raise "Configuration not loaded — call load_config first"
  end

  @@client : NetboxClient::Client?

  # The shared, per-instance Netbox client, built eagerly by `init_app!`.
  # Requiring explicit init avoids a lazy `||=` that could race if `client` were
  # ever first touched from concurrent fibers (K5).
  def self.client : NetboxClient::Client
    @@client || raise "Netbox client not initialised — call init_app! first"
  end

  # Eagerly initialises the application: configures logging and builds the shared
  # Netbox client. Must be called after `load_config` and before any controller.
  def self.init_app!
    setup_log!
    setup_netbox_api!
  end

  # Builds and stores the shared `NetboxClient::Client` from the loaded config.
  def self.setup_netbox_api!
    @@client = build_netbox_client
  end

  private def self.build_netbox_client : NetboxClient::Client
    cfg = NetboxClient::Configuration.new
    cfg.scheme = config.netbox.http_scheme
    # Fold the configured port into the host authority; it was previously
    # advertised but ignored, silently unreachable on a non-standard port (D5).
    cfg.host = "#{config.netbox.hostname}:#{config.netbox.port}"
    cfg.debugging = config.netbox.debug?
    cfg.api_key[:Authorization] = config.netbox.api_token
    cfg.api_key_prefix[:Authorization] = "Token"
    NetboxClient::Client.new(NetboxClient::Connection.new(cfg))
  end
end
