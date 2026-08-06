# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2026-08-06

> **Upgrade note.** The `filename` key of an Icinga role was accepted by the
> config and read by nothing; it now sets the output subdirectory, as the
> shipped example config had always implied. A site declaring `filename:
> "physical-linux"` for the `server-linux` role therefore writes to
> `physical-linux/` instead of `server-linux/` on the next run. The files of the
> old directory are not migrated — the swap only creates what generation
> produces — so the Icinga zone changes shape server-side. Check your
> `include_device_roles` and `include_vm_roles` before upgrading; `config check`
> shows what the config resolves to.
>
> Two smaller behaviour changes: an unknown subcommand now exits `1` instead of
> printing the help and exiting `0`, which may surface in a cron or CI job that
> was silently doing nothing; and a role `filename` that is not a safe path
> segment is now refused at validation.

### Added

- `config check`: reports what a generation run would quietly ignore, and
  writes nothing. Validates the file itself with no network access; with
  `--with-netbox`, also matches every configured name against what Netbox
  holds — `checks_config` entries, `include_objects`/`exclude_objects` and
  roles designating no object, objects carrying no platform, and platform
  slugs the OS detection cannot classify unambiguously. Findings name the file
  to edit. Warnings exit `0` unless `--strict` is given; errors always exit
  `1`.
- `config dump`: prints the effective configuration — template rendered,
  `sites_config:` files merged, defaults applied — as valid YAML. Secrets
  (`api_token` and every `password`) are redacted, with no flag to reveal
  them.
- The `filename` key of an Icinga role now works: it sets the output
  subdirectory, as the example config had always implied. A role filename that
  is not a safe path segment is refused at validation.
- `ansible.fetch_facts.max_parallel_playbooks` config option: a hard cap on the
  number of concurrent `ansible-playbook` processes across the whole run
  (`0` = unlimited).
- Fiber-level failure isolation for the per-site fan-out
  (`Concurrency.each_isolated`): a single site/inventory failure is counted and
  surfaced instead of silently turning the whole run green.
- `http_sni` support for Icinga vhosts.

### Changed

- Generation now reports what it drops instead of dropping it silently: an
  object with no status or no platform, a `checks_config` entry matching no
  host, a malformed facts file. Each used to remove a host from the output
  without a word.
- `checks_config` entries are matched case-insensitively and across the
  FQDN/short-name boundary, so an entry keyed `web1.example.com` now applies to
  the Netbox host `web1` instead of falling through to the default checks.
- An unknown subcommand (`ansible genrate`) exits `1` with a message instead of
  printing the help and exiting `0`, which made a total no-op look like a
  success in cron and CI.
- A missing `.env` no longer aborts a run whose secrets are already exported,
  as in a container or CI job.
- Relative `sites_config:` paths resolve next to the config file that declares
  them, falling back to the working directory.
- The Icinga zone swap no longer leaves a window in which the site has no
  configuration at all.
- Per-host check lookups are memoised: 98.58µs → 8.42µs per host on 100
  `checks_config` entries, with allocations down from 149kB to 12.6kB.
- The library and the program are now separate files: requiring
  `src/netbox_extractor.cr` starts nothing, and `src/netbox-extractor.cr` only
  runs the CLI. The entry point keeps its name and path.
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

- An untagged Netbox object keeps its role tag, and the SNMP/ping predicates
  answer `false` instead of `nil`: Netbox returns a null tag list rather than an
  empty one, and that nil used to be threaded through.
- A facts file that is valid JSON but not an object no longer kills the host's
  fiber and aborts the site's config swap.
- A closed reader (`… | head`) exits `0` instead of answering with a stack
  trace: Crystal ignores SIGPIPE, so the resulting `EPIPE` reached the
  catch-all handler.
- A load failure is no longer reported twice — the stack trace no longer prints
  underneath a message that already explained it.
- The fatal-error handler is no longer gated on `CRYSTAL_ENV`, which nothing
  set, so it was dead code exactly where it was meant to run.
- Errors keep their cause: config template and log file failures no longer
  discard the original exception and its backtrace.
- Warnings raised from included modules now carry their own log source instead
  of landing on the root logger, where no per-source level could reach them.
- Restored `", "` spacing in `icinga_array` output to avoid churn in already
  generated Icinga config.
- A transient Netbox failure no longer wipes already-generated output.
- Use a dict instead of an array for RabbitMQ queues and PostgreSQL instances in
  the Icinga template.
- Stopped a temp-file leak during fact gathering (generated files are now removed
  even on failure).
- Assorted correctness, config-parsing and diagnostics cleanups.

### Security

- `test_api get` no longer dumps the users, permissions and tokens endpoints at
  debug level, which wrote Netbox API tokens to the log file in clear text.
  Only their count is logged.
- Escape Netbox-sourced values interpolated into the Icinga2 DSL (both strings
  and arrays): a value containing a quote or backslash can no longer break the
  zone or inject configuration. `$` is now escaped too — Icinga2 reads `$name$`
  inside a double-quoted string as a runtime macro, so a vendor name or an LSB
  fact containing one could break the zone or resolve to something else.

### Removed

- Dead code and redundant build steps.

## [1.0.1] - 2026-03-04

### Fixed

- Windows hosts are now monitored over SNMP.

## [1.0.0] - 2026-03-03

Initial release: generate Ansible inventories, Icinga2 configuration and Bind
DNS zone files from a Netbox instance.
