# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

`netbox-extractor` is a Crystal CLI tool that pulls data from a [Netbox](https://github.com/netbox-community/netbox) instance and generates:
- Ansible inventory YAML files
- Icinga2 configuration files
- Bind DNS zone files

## Commands

Tool management uses [mise](https://mise.jdx.dev/). Crystal version: 1.20.3.

```sh
mise run dev:deps          # Install dependencies (shards install)
mise run dev:build         # Compile development binary to bin/netbox-extractor
mise run dev:spec          # Run tests
mise run dev:spec-mt       # Run tests multi-threaded (CI runs both)
mise run dev:ameba         # Run static analysis (ameba, a mise tool, bounded by its task timeout)
mise run dev:format        # Format code (crystal tool format src/ spec/)
mise run dev:format-check  # Check formatting without writing (CI gate)
mise run dev:docs          # Build API docs (CI gate)
mise run dev:coverage      # Spec line coverage with kcov -> coverage/index.html
mise run dev:licenses      # Assemble licenses/ (every compiling task depends on it)
mise run release:static    # Release snapshot by crystalreleaser into dist/, nothing published
```

Run a single spec file (never bare `crystal spec`: it skips the pinned
toolchain and the `dev:licenses` dependency):
```sh
mise dev:spec spec/path/to/file_spec.cr
```

`mise.toml`, `.github/workflows/{ci,release}.yml`, `.crystalreleaser.yml`,
`Brewfile` and `scripts/` are copies of the canonical templates of
`~/.claude/templates/crystal/`. Project divergences: the java/python tools,
the `OPENAPI_*`/`NETBOX_*` vars and the `netbox-api:*` tasks in `mise.toml`,
no `dev:docker-image` (the project builds no image), the libxml2/xz apk
packages in `.crystalreleaser.yml`, `curl` in the `Brewfile`.

Releases: crystalreleaser builds the binaries (`mise release:static` locally,
`.github/workflows/release.yml` on a `v*` tag, which publishes
`netbox-extractor-<os>-<arch>` and its `.sha256`). The darwin binaries link
Homebrew's `openssl@4` statically; crystalreleaser fails the build if one
still loads a library macOS does not ship — the reason
`vendor/netbox-client-patches/03-no-big.diff` drops the generated client's
unused `require "big"`, which linked Homebrew's GMP.

Licenses: `licenses.manifest` follows the link line of the static binary
(recorded in its header) and lists every runtime shard, transitive ones
included; `scripts/harvest-licenses.sh` assembles the gitignored `licenses/`,
which `src/netbox_extractor/licenses.cr` embeds and `netbox-extractor
licenses` prints. Compiling without it fails on purpose.

## Architecture

### Entry point flow

`src/netbox-extractor.cr` (entry point: requires the library and runs the CLI, nothing else) → `src/netbox_extractor.cr` (the library: requiring it starts nothing) → `NetboxExtractor::CLI` (admiral-based, `src/netbox_extractor/cli.cr`) → subcommands (`ansible`, `icinga`, `bind`, `config`, `test_api`) → Controllers → Generators → write files.

The two files are separate on purpose: the spec suite requires the library, and
requiring the entry point would run the CLI against the spec runner's own ARGV.

### Key layers

**Controllers** (`src/netbox_extractor/controllers/`) — orchestrate work per site. Accept a `site` flag ("all" runs all sites in parallel via `Concurrency.each_isolated`).

**Generators** (`src/netbox_extractor/generators/`) — load inventories from Netbox, transform via Presenters, write output files.

**Netbox Inventories** (`src/netbox_extractor/netbox/`) — `DeviceInventory`, `VmInventory`, `IpamInventory`. Use the `define_netbox_load` macro (in `concerns/inventory_macros.cr`) for paginated API calls.

**Presenters** (`src/netbox_extractor/presenters/`) — convert a Netbox object + site config into the data structure needed by the output format.

**Patches** (`src/netbox_extractor/patches/`) — extend the auto-generated `NetboxClient` types (from `vendor/netbox-client`) with domain-specific helpers. `netbox_client.cr` is included by both device and VM types; `netbox_device.cr` and `netbox_vm.cr` add type-specific overrides.

**Config** (`src/netbox_extractor/config/`) — YAML-serializable config classes. Top-level site config is `Config::Site`; nested under it are `Ansible::Site`, `Icinga::Site`, etc. Loaded from `netbox-extractor.yml` + `.env` at startup.

**Config checking** (`src/netbox_extractor/config_check/`) — `Checker` decides what is wrong with a configuration and returns `Finding`s; it is free of I/O and logging, so every rule is exercised without a Netbox instance. Driven by `Controllers::Config` (`config check`), and its orphan-entry rule is also called by the Icinga generator. Named `ConfigCheck` because `Checks` would collide with `Config::Icinga::Checks`, the Icinga service checks.

**Templates** (`templates/`) — Jinja2-style templates rendered via the `crinja` shard, used for Icinga config output.

### Netbox client

The `vendor/netbox-client/` directory contains a Crystal client auto-generated from the Netbox OpenAPI spec (`vendor/netbox-rest.<version>.yml`) using the OpenAPI Generator. Patches in `vendor/netbox-client-patches/` fix nullability and compatibility issues in the generated code.

To regenerate the client for a new Netbox version, update `NETBOX_VERSION` in `mise.toml` and run:
```sh
mise netbox-api:build
```

### Behavior conventions

- Netbox tags drive behavior: `check-by-snmp` → SNMP monitoring; `check-only-ping` → ping-only. Storage/network device roles also force SNMP checks.
- OS detection (`netbox_linux?`, `netbox_windows?`) is based on the platform slug from Netbox.
- Objects can be filtered per-site via `include_objects` / `exclude_objects` in the site config.
- A server's `oob_ip` yields a `Netbox::BmcHost` served with role `network-bmc`, rendering exactly the host a BMC device of that role rendered (DNS name, IP, IP tags and status, server vendor, interface name as model and platform). `spec/netbox_extractor/netbox/bmc_hosts_spec.cr` holds that equivalence; keep it byte for byte.
