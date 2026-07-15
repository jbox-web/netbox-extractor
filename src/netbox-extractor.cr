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

module NetboxExtractor
  extend NetboxExtractor::Logger

  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
  GIT_REF = {{ `git log -n 1 --format="%H" | head -c 8`.chomp.stringify }}

  def self.version
    "#{VERSION} (#{GIT_REF})"
  end

  def self.load_config(config_path, env_path)
    Dotenv.load File.expand_path(env_path)
    config_template = File.read(File.expand_path(config_path))
    config_file = NetboxExtractor::Utils.render_template(config_template, {"ENV" => ENV.to_h})
    self.config = Config::Base.from_yaml(config_file)
    config.validate!
  end

  def self.config=(config : Config::Base)
    @@config = config
  end

  @@config : Config::Base? = nil

  def self.config : Config::Base
    @@config || raise "Configuration not loaded — call load_config first"
  end

  @@client : NetboxClient::Client?

  # The shared, per-instance Netbox client. Built from the loaded config the
  # first time it is needed (or eagerly by `setup_netbox_api!`).
  def self.client : NetboxClient::Client
    @@client ||= build_netbox_client
  end

  def self.init_app!
    setup_log!
    setup_netbox_api!
  end

  def self.setup_netbox_api!
    @@client = build_netbox_client
  end

  private def self.build_netbox_client : NetboxClient::Client
    cfg = NetboxClient::Configuration.new
    cfg.scheme = config.netbox.http_scheme
    cfg.host = config.netbox.hostname
    cfg.debugging = config.netbox.debug?
    cfg.api_key[:Authorization] = config.netbox.api_token
    cfg.api_key_prefix[:Authorization] = "Token"
    NetboxClient::Client.new(NetboxClient::Connection.new(cfg))
  end
end

# Start the CLI
if Crystal.env.production?
  begin
    NetboxExtractor::CLI.run
  rescue e : Exception
    STDERR.puts e.inspect_with_backtrace
    exit 1
  end
else
  NetboxExtractor::CLI.run
end
