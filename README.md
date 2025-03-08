# netbox-extractor

Extract data from Netbox (https://github.com/netbox-community/netbox).

Generate :

* Ansible inventories
* Icinga config files

## Installation

Get binary from [releases page](https://github.com/jbox-web/netbox-extractor/releases)

## Usage

```sh
Usage:
  bin/netbox-extractor [flags...] [arg...]

Generate Ansible inventories and Icinga configuration files from Netbox

Flags:
  --help     # Displays help for the current command.
  --version  # Displays the version of the current application.

Subcommands:
  ansible    # Netbox/Ansible subcommands
  bind       # Netbox/Bind subcommands
  icinga     # Netbox/Icinga subcommands
  test_api   # Netbox/Test subcommands
```

## Development

```sh
make setup
make deps
make spec
make build
bin/netbox-extractor
```

## Contributing

1. Fork it (<https://github.com/your-github-user/netbox-extractor/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nicolas Rodriguez](https://github.com/n-rodriguez) - creator and maintainer
