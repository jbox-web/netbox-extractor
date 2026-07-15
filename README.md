# netbox-extractor

[![GitHub License](https://img.shields.io/github/license/jbox-web/netbox-extractor)](https://github.com/jbox-web/netbox-extractor/blob/master/LICENSE)
[![Build Status](https://github.com/jbox-web/netbox-extractor/actions/workflows/ci.yml/badge.svg)](https://github.com/jbox-web/netbox-extractor/actions/workflows/ci.yml)
[![GitHub Release](https://img.shields.io/github/v/release/jbox-web/netbox-extractor)](https://github.com/jbox-web/netbox-extractor/releases/latest)

A Crystal CLI that extracts data from [Netbox](https://github.com/netbox-community/netbox) to generate:

* Ansible inventories
* Icinga2 configuration files
* Bind DNS zone files

## Installation

Get binary from [releases page](https://github.com/jbox-web/netbox-extractor/releases).

If you use [mise](https://mise.jdx.dev/) you can also install netbox-extractor with [asdf-netbox-extractor](https://github.com/jbox-web/asdf-netbox-extractor).

## Usage

```sh
netbox-extractor <subcommand> <action> [flags...]
```

| Command                | Description                                    |
|------------------------|------------------------------------------------|
| `ansible generate`     | Generate Ansible inventory YAML files          |
| `ansible fetch_facts`  | Gather Ansible facts into the shared cache     |
| `icinga generate`      | Generate Icinga2 configuration files           |
| `bind generate`        | Generate Bind DNS zone data                    |
| `test_api get`         | Check connectivity to the Netbox API           |

Common flags:

| Flag              | Default                | Description                                            |
|-------------------|------------------------|--------------------------------------------------------|
| `--config`, `-c`  | `netbox-extractor.yml` | Path to the config file                                |
| `--env`, `-e`     | `.env`                 | Path to the env file                                   |
| `--site`, `-s`    | `all`                  | Site id to process (`all` = every site); `ansible` and `icinga` only |

Examples:

```sh
# Generate Ansible + Icinga config for every configured site
netbox-extractor ansible generate
netbox-extractor icinga generate

# Restrict to one site, with an explicit config path
netbox-extractor icinga generate --site dc1 --config /etc/netbox-extractor.yml
```

## Configuration

`netbox-extractor` is driven by a YAML config file (`netbox-extractor.yml` by
default) plus an env file (`.env`) for secrets. See
[`netbox-extractor.yml.example`](netbox-extractor.yml.example) for a complete,
loadable example.

* **Netbox connection** — `netbox.hostname`, `netbox.port` and `netbox.api_token`.
  The token is typically injected from the env file, e.g.
  `api_token: "{{ ENV['NETBOX_TOKEN_API'] }}"`.
* **Sites** — declared inline under `sites:` or loaded from external files listed
  in `sites_config:`. Each site lists the Netbox device/vm roles to export and,
  for Icinga, the checks to generate.
* **Filtering** — objects can be included/excluded per site via `include_objects`
  and `exclude_objects`.
* **Tag-driven behavior** — the `check-by-snmp` tag forces SNMP monitoring,
  `check-only-ping` restricts a host to a ping check; OS detection is based on the
  Netbox platform slug.

## Development

Tooling is managed with [mise](https://mise.jdx.dev/).

```sh
mise run dev:deps     # Install dependencies (shards install)
mise run dev:build    # Compile bin/netbox-extractor
mise run dev:spec     # Run tests
mise run dev:ameba    # Static analysis (ameba)
mise run dev:format   # Format code
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
