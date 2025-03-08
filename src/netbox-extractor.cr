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

  VERSION = "1.0.0"

  def self.version
    VERSION
  end

  def self.load_config(config_path, env_path)
    Dotenv.load File.expand_path(env_path)
    config_template = File.read(File.expand_path(config_path))
    config_file = NetboxExtractor::Utils.render_template(config_template, {"ENV" => ENV.to_h})
    self.config = Config::Base.from_yaml(config_file)
  end

  def self.config=(config : Config::Base)
    @@config = config
  end

  def self.config
    @@config ||= Config::Base.from_yaml("")
  end

  def self.init_app!
    setup_log!
    setup_netbox_api!
  end

  def self.setup_netbox_api!
    NetboxClient.configure do |client|
      client.scheme = config.netbox.http_scheme
      client.host = config.netbox.hostname
      client.debugging = config.netbox.debug?
      client.api_key[:Authorization] = config.netbox.api_token
      client.api_key_prefix[:Authorization] = "Token"
    end
  end
end

# Start the CLI
if Crystal.env.production?
  begin
    NetboxExtractor::CLI.run
  rescue e : Exception
    puts e.message
    exit 1
  end
else
  NetboxExtractor::CLI.run
end
