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
mise run dev:deps      # Install dependencies (shards install)
mise run dev:build     # Compile development binary to bin/netbox-extractor
mise run dev:spec      # Run tests
mise run dev:ameba     # Run static analysis (ameba linter)
mise run dev:format    # Format code (crystal tool format)
```

Run a single spec file:
```sh
crystal spec spec/path/to/file_spec.cr
```

## Architecture

### Entry point flow

`src/netbox-extractor.cr` → `NetboxExtractor::CLI` (admiral-based, `src/netbox_extractor/cli.cr`) → subcommands (`ansible`, `icinga`, `bind`, `test_api`) → Controllers → Generators → write files.

### Key layers

**Controllers** (`src/netbox_extractor/controllers/`) — orchestrate work per site. Accept a `site` flag ("all" runs all sites in parallel via `Concurrency.each_isolated`).

**Generators** (`src/netbox_extractor/generators/`) — load inventories from Netbox, transform via Presenters, write output files.

**Netbox Inventories** (`src/netbox_extractor/netbox/`) — `DeviceInventory`, `VmInventory`, `IpamInventory`. Use the `define_netbox_load` macro (in `concerns/inventory_macros.cr`) for paginated API calls.

**Presenters** (`src/netbox_extractor/presenters/`) — convert a Netbox object + site config into the data structure needed by the output format.

**Patches** (`src/netbox_extractor/patches/`) — extend the auto-generated `NetboxClient` types (from `vendor/netbox-client`) with domain-specific helpers. `netbox_client.cr` is included by both device and VM types; `netbox_device.cr` and `netbox_vm.cr` add type-specific overrides.

**Config** (`src/netbox_extractor/config/`) — YAML-serializable config classes. Top-level site config is `Config::Site`; nested under it are `Ansible::Site`, `Icinga::Site`, etc. Loaded from `netbox-extractor.yml` + `.env` at startup.

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
