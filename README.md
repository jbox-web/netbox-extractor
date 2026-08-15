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

If you use [mise](https://mise.jdx.dev/), install it from the
[jbox-web aqua registry](https://github.com/jbox-web/aqua-registry):

```toml
# mise.toml
[settings]
aqua.registries = ["https://github.com/jbox-web/aqua-registry"]

[tools]
"aqua:jbox-web/netbox-extractor" = "2.1.0"
```

The registry has to be declared: the tool is not in the default aqua registry,
and without that setting the name resolves to nothing.

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
| `config check`         | Check the configuration without generating     |
| `config dump`          | Print the effective configuration, secrets redacted |
| `test_api get`         | Check connectivity to the Netbox API           |

Common flags:

| Flag              | Default                | Description                                            |
|-------------------|------------------------|--------------------------------------------------------|
| `--config`, `-c`  | `netbox-extractor.yml` | Path to the config file                                |
| `--env`, `-e`     | `.env`                 | Path to the env file                                   |
| `--site`, `-s`    | `all`                  | Site id to process (`all` = every site); `ansible`, `icinga` and `config check` only |

Examples:

```sh
# Generate Ansible + Icinga config for every configured site
netbox-extractor ansible generate
netbox-extractor icinga generate

# Restrict to one site, with an explicit config path
netbox-extractor icinga generate --site dc1 --config /etc/netbox-extractor.yml
```

### Checking the configuration

`config check` reports what a generation run would quietly ignore, and writes
nothing:

```sh
# Validate the file itself: schema, duplicate site ids, colliding or unsafe
# role filenames. Instant, no network, no token needed.
netbox-extractor config check

# Also match everything the config says against what Netbox holds: checks_config
# entries, include_objects/exclude_objects and roles designating no object,
# objects carrying no platform, and platform slugs the OS detection cannot
# classify unambiguously.
netbox-extractor config check --with-netbox
```

An `include_objects`/`exclude_objects` entry that matches no host is reported
with the near miss when there is one, because the two cases call for opposite
fixes — these filters match exactly, so an entry differing only in case or by a
domain is not dead config, it is a filter that silently does nothing:

```
WARNING  [dc1] exclude_objects entry 'W2022' matches no host of this site, but 'w2022' does
         — the exclusion is not being applied, as these filters match exactly (config/dc1.yml)
WARNING  [dc1] exclude_objects entry 'mattermost' matches no host of this site (config/dc1.yml)
```

The first has to be corrected, the second deleted.

`--with-netbox` loads each site's inventories, so it costs as many API calls as
a generation run — which is why it is not the default.

Exit status:

| Situation                                            | Status |
|------------------------------------------------------|--------|
| Nothing to report                                     | `0`    |
| Warnings only (a name that designates nothing)        | `0`    |
| Warnings only, with `--strict`                        | `1`    |
| Errors (unreadable file, invalid config, Netbox down) | `1`    |

Warnings are things to clean up rather than breakage, so they do not fail a
pipeline unless `--strict` says they should:

```sh
netbox-extractor config check --with-netbox --strict
```

### Seeing the effective configuration

The file on disk is a template: it interpolates `ENV`, and it may pull whole
sites in from `sites_config:`. `config dump` prints what the program actually
ended up with — template rendered, external site files merged, defaults
applied:

```sh
netbox-extractor config dump

# One site only
netbox-extractor config dump --site dc1
```

The output is valid YAML, so it can be piped into anything that reads YAML.

**Secrets are redacted**: `api_token` and every `password` come out as
`<redacted>`. There is no flag to reveal them — the value would land on a
terminal, in a redirected file, and in the log of whichever CI job ran the
command. Read the config file itself if you need them.

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
mise run dev:deps          # Install dependencies (shards install)
mise run dev:build         # Compile bin/netbox-extractor
mise run dev:spec          # Run tests
mise run dev:spec-mt       # Run tests multi-threaded
mise run dev:ameba         # Static analysis (ameba)
mise run dev:format        # Format code
mise run dev:format-check  # Check formatting without writing
mise run dev:docs          # Build API docs
bin/netbox-extractor
```

CI runs `dev:format-check`, `dev:ameba`, `dev:docs`, `dev:spec` and
`dev:spec-mt`, so all five should pass before pushing.

## Contributing

1. Fork it (<https://github.com/your-github-user/netbox-extractor/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nicolas Rodriguez](https://github.com/n-rodriguez) - creator and maintainer
