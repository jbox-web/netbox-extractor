# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `ansible.fetch_facts.max_parallel_playbooks` config option: a hard cap on the
  number of concurrent `ansible-playbook` processes across the whole run
  (`0` = unlimited).
- Fiber-level failure isolation for the per-site fan-out
  (`Concurrency.each_isolated`): a single site/inventory failure is counted and
  surfaced instead of silently turning the whole run green.
- `http_sni` support for Icinga vhosts.

### Changed

- Fact gathering is now best-effort: an unreachable host or failed inventory is
  logged as a one-line warning and skipped, instead of aborting the whole run
  with a stack trace.
- Migrated to the idiomatic `netbox-client` API and regenerated the vendored
  client with the idiomatic Crystal generator.
- Capped the `ansible-playbook` fan-out and cached compiled Crinja templates so
  a role template is parsed once instead of once per host.
- Switched toolchain management from asdf to mise; `dev:format` now formats only
  `src` and `spec` (the vendored client is handled by `netbox-api:format`).

### Fixed

- Restored `", "` spacing in `icinga_array` output to avoid churn in already
  generated Icinga config.
- A transient Netbox failure no longer wipes already-generated output.
- Use a dict instead of an array for RabbitMQ queues and PostgreSQL instances in
  the Icinga template.
- Stopped a temp-file leak during fact gathering (generated files are now removed
  even on failure).
- Assorted correctness, config-parsing and diagnostics cleanups.

### Security

- Escape Netbox-sourced values interpolated into the Icinga2 DSL (both strings
  and arrays): a value containing a quote or backslash can no longer break the
  zone or inject configuration.

### Removed

- Dead code and redundant build steps.

## [1.0.1] - 2026-03-04

### Fixed

- Windows hosts are now monitored over SNMP.

## [1.0.0] - 2026-03-03

Initial release: generate Ansible inventories, Icinga2 configuration and Bind
DNS zone files from a Netbox instance.
