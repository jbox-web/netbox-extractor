# netbox-extractor — Code Audit (merged)

Scope: all hand-written source under `src/**` (60 `.cr` files, 2481 LOC), plus
`spec/`, `templates/**`, `.github/workflows/*`, `Dockerfile`, `Makefile.release`,
`docker-bake.hcl`, `mise.toml`, `shard.yml/lock`, and the shipped config/docs
(`netbox-extractor.yml`, `.yml.example`, `config/*.yml`, `README.md`). The
generated `vendor/netbox-client/**` and `openapi-generator-cli.jar` are out of
scope (only the connection's error contract and one-shot-request model were read
to substantiate concurrency/error findings). Coverage: complete — every `src`
file, every template, every CI/build file, and every config leaf class was read.

This report is the reconciliation of two independent audit passes. Where they
disagreed, the discrepancy was re-verified against the code this run; corrections
are noted inline (see S2, T1).

Severity legend: **CRITICAL** (silent data loss/corruption OR security breach —
nothing else) · **HIGH** · **MEDIUM** · **LOW** · **NIT**.

Crystal semantics verified empirically (probe) or by source read, not assumed:
- `begin/rescue/else`: on a rescued exception the `else` block is **skipped** — a
  result assigned only in `else` keeps its initial value (probed: stays `[]`).
- Integer `/` returns `Float64`; integer division is `//` (probed).
- An unhandled exception in a `spawn`/`WaitGroup` fiber prints to STDERR and the
  process **continues, exiting 0** — it does not abort the program.
- `Process.run(..., shell: true, args: [...])` passes `args` as real argv (`"$@"`)
  → **no shell injection** through them.
- `RecursiveHash#merge!` is a **deep merge** (`any_hash` `deep_merge!`) → repeated
  `merge!({host => ...})` compose sub-hashes rather than overwrite.
- The vendored `NetboxClient::Connection#request` **raises `ApiError` on any
  non-2xx** (connection.cr:70) and uses one-shot `Crest::Request.execute` per call
  (no shared mutable HTTP client) → the shared client singleton is fiber-safe.
- Crinja autoescape defaults OFF and is HTML-only when on → every `{{ value }}`
  reaches an Icinga2 config verbatim.
- The `password:`/`username:` values in `config/*.yml` are **Icinga constant
  names** (e.g. `COLT_UL_ESX_API_PASS`), not literal secrets (verified by reading
  the configs); they are emitted as bareword references resolved by Icinga at
  runtime → **no secret is written to disk**.

---

## Priority summary (fix in this order)

1. **C1 / D2** — a transient network failure silently wipes existing output. *Worst.*
2. **C7** — pagination can silently skip objects when `fetch_limit` exceeds the server cap.
3. **T1** — the test suite is empty; CI is green vacuously.
4. **K1 / E1** — `--site all` exits 0 even on partial failure.
5. **K2 / K3** — concurrent runs wipe shared cache / zone directories.
6. **S3** — `test_api post` writes junk objects into the real (prod) Netbox with no guard.
7. **S1** — Icinga config injection via unescaped Netbox values.
8. **Doc1 / Doc2** — example config is not loadable; README dev section is broken.

---

## 1. Correctness

**C1 — CRITICAL — Transient Netbox failure silently wipes existing output.**
`netbox/concerns/inventory_macros.cr:20-25`. The `rescue` catches only
`Socket::Addrinfo::Error`, and the `else` branch (`{{ivar}} = results`) does **not**
run on error, so the inventory ivar keeps its empty init array. Generators then
treat "empty" as "zero hosts" and destroy existing output:
- `generators/ansible.cr:60,75` → `File.delete(inventory_file)`
- `generators/icinga.cr:30` → `FileUtils.rm_rf @site.icinga_zones_path`

A DNS blip therefore erases a site's Ansible inventories and entire Icinga config,
and the run still exits 0.
*Fix:* the macro must distinguish "load failed" from "loaded zero" — re-`raise` or
set a `@load_failed` flag; generators must abort destructive ops on failure and
never equate empty-load with zero-hosts.

**C2 — HIGH — The rescue is far too narrow.**
`inventory_macros.cr:20` handles only DNS resolution. Everything else propagates
uncaught: `Socket::ConnectError`, `IO::TimeoutError`, HTTP 401/403/429/500
(`NetboxClient::ApiError`), `JSON::ParseException`. In `--site all` the fiber dies
(printed, exit 0, partial output); single-site propagates to the top level. No
retry/backoff on a paginated API.
*Fix:* rescue at least `NetboxClient::ApiError | IO::Error | Socket::Error |
JSON::ParseException`, log structured (`Log.error(exception: ex)`), define per-site
failure semantics.

**C7 — HIGH — Pagination can silently skip objects.**
`inventory_macros.cr:13-16`. `offset` advances by the *requested* `limit`, not the
number of rows actually returned. Netbox caps page size server-side
(`MAX_PAGE_SIZE`, default 1000). If `config.netbox.fetch_limit` (default 50,
config sets 250, user-configurable) exceeds that cap, the server returns fewer rows
than `limit` while still sending `next`, so `offset` overshoots and whole blocks of
devices/VMs/IPs are silently dropped. Not triggered at the default; latent for any
`fetch_limit > 1000`.
*Fix:* `offset += data.results.size`, plus `break if data.results.empty?`.

**C3 — MEDIUM — Missing `netbox_tags` crashes a whole facts inventory.**
`facts_fetcher/ansible.cr:78` `v["netbox_tags"].as_a` raises `KeyError` for any host
without a `netbox_tags` key.
*Fix:* `v["netbox_tags"]?.try(&.as_a) || [] of YAML::Any`.

**C4 — MEDIUM — Corrupt/partial facts crash Icinga generation.**
`presenters/concerns/icinga_helper.cr:182` `JSON.parse(File.read(facts_file))` with
no rescue; `:163` `mounts.as_a.map(&.["mount"].as_s)` raises if a mount entry lacks
`mount` or is non-string; `:107` `num_cpus.as_i` raises for a non-integer fact.
*Fix:* rescue `JSON::ParseException`/`IO::Error` (treat as no facts); use
`["mount"]?.try(&.as_s)` + compact. (Note: `exclude_volumes` is typed
`Array(String)` via `Partitions#to_h`, so it is *not* a scalar/type hazard.)

**C5 — MEDIUM — A malformed existing file aborts the role's fiber.**
`generators/ansible.cr:84` and `facts_fetcher/ansible.cr:59` `YAML.parse` the
existing file with no rescue; corrupt/hand-edited YAML kills the fiber.
*Fix:* rescue, fall back to empty vars + warning.

**C8 — MEDIUM — Nil host name not handled in filters / filenames.**
`netbox/concerns/inventory_filters.cr:6`: `h.name` is `String?`. A nil-named object
with non-empty `include_objects` is silently excluded; with empty it passes and
yields filenames like `".conf"` (`patches/netbox_device.cr:27`, `netbox_vm.cr:21`),
where two such objects collide and overwrite. The name is also unsanitized — a `/`
or `..` escapes the zones dir.
*Fix:* filter out / require non-nil names before matching; validate against
`^[A-Za-z0-9._-]+$` before using as a path segment.

**C6 — LOW — `ansible_os_name` may return nil.**
`icinga_helper.cr:131-141`: if `ansible_lsb.description` is absent AND
`@host.netbox_os_name` is nil, it returns nil and `debian?` (`:168`) /
`debian_release` (`:174`) call `.includes?`/`.match` on nil.
*Note:* `netbox_os_name` (`patches/netbox_client.cr:36`) falls back to `"unknown"`
(non-nil), so this only fires if the *facts* path yields nil — narrow but real.
*Fix:* guarantee a non-nil string (fallback `""`).

**C9 — LOW — `netbox_powered_on?` conflates missing status with "off".**
`patches/netbox_client.cr:73-74` returns `Bool?` and only accepts `"active"`; an
object with no `status` is dropped like an inactive one, indistinguishably
(`inventory_filters.cr:7` treats nil as falsy).
*Fix:* return a real `Bool`; log/handle missing status separately if it matters.

**C10 — LOW — Log level lookup is case-sensitive.**
`logger.cr:31` `SEVERITY_MAP[config.logger.level]?` with lowercase keys → `level:
Info`/`DEBUG` silently falls back to `info`.
*Fix:* `SEVERITY_MAP[config.logger.level.downcase]?`.

**L1 — LOW — Possible infinite pagination loop.**
`inventory_macros.cr:12-19`: if the API returns `_next` non-nil with an empty
`results` page, the loop spins forever. Covered by the `break if
data.results.empty?` guard from C7.

---

## 2. Concurrency / fiber-safety

**K1 — HIGH — No per-fiber error isolation/aggregation in `--site all`.**
`controllers/ansible.cr:8-12`, `controllers/icinga.cr:8-12`, and the per-role/host
`wg.spawn` bodies in `generators/{icinga,ansible}.cr:32-63` — none have
`begin/rescue`. A site/role/host exception is printed by the runtime, then the run
exits 0 (verified). CI/cron see success while sites failed (and, after the Icinga
`rm_rf`, with configs already deleted).
*Fix:* wrap each fiber body in a rescue, log site + exception, record failure in a
fiber-safe accumulator (`Atomic(Bool)` / `Channel`), exit non-zero if any failed.

**K2 — HIGH — Shared cache wiped during concurrent execution.**
`facts_fetcher/ansible.cr:21` `@cache_path = config.ansible.fetch_facts.cache_path`
(global, not per-site) and `:39` `FileUtils.rm_rf @cache_path` at the start of each
site's `run`. Under `--site all`, each site wipes the shared cache while others
write. Amplified by the relative default `cache_dir: "./generated/facts"`
(`config/ansible/global_fetch_facts.cr:15`) → the `rm_rf` target is CWD-relative.
*Fix:* wipe once before the per-site fan-out, or scope the cache per site.

**K3 — HIGH — Per-site zone `rm_rf`; disjointness not enforced.**
`generators/icinga.cr:30`. If two sites resolve to the same/overlapping
`icinga_zones_path`, one deletes the other's fresh output. Same hazard for duplicate
role `filename`s writing the same path from sibling fibers
(`generators/ansible.cr:56,71`). The `rm_rf` also runs *before* any regeneration, so
any mid-generation failure leaves the dir wiped.
*Fix:* validate uniqueness/disjointness of resolved paths; build into a temp dir and
atomically swap on success, else serialize.

**K4 — MEDIUM — Unbounded fan-out of `ansible-playbook` processes.**
`facts_fetcher/ansible.cr:42-50`: one fiber per inventory file, each launching an
`ansible-playbook` to shared STDOUT/STDERR → interleaved output and resource
pressure (compounds with K1: sites × inventories).
*Fix:* bound concurrency (fixed-size semaphore/`Channel`), capture output per process.

**K5 — LOW — Non-atomic `||=` memoizations.**
`netbox-extractor.cr:53` `@@client ||=` and `:45` `@@config ||=`. Masked today
because `init_app!` builds the client before any `spawn`. Latent if `client` is ever
called first from concurrent fibers.
*Fix:* keep eager init as the only path, or guard with a `Mutex`.

Positive: the shared HTTP client is fiber-safe (a fresh request/socket per call via
Crest; `Configuration` read-only), so sharing `@@client` is fine.

---

## 3. Error model

**E1 — MEDIUM — Unknown site → silent success.**
`controllers/ansible.cr:17,33`, `controllers/icinga.cr:17`: `--site typo` only logs
an error then returns → exit 0.
*Fix:* `raise` (the prod wrapper exits 1) or set a non-zero exit code.

**E2 — MEDIUM — `ansible-playbook` status discarded.**
`facts_fetcher/ansible.cr:93-99`: the returned `Process::Status` is dropped; a
failed playbook goes unnoticed.
*Fix:* `status = Process.run(...)`; `Log.error`/raise on `!status.success?`.

**E3 — MEDIUM — Weak top-level handler.**
`netbox-extractor.cr:80-83`: `puts e.message` → blank line when nil, on STDOUT, no
class or backtrace.
*Fix:* `STDERR.puts(e.inspect_with_backtrace)` before `exit 1`.

**E4 — MEDIUM — Missing `sites_config` path silently ignored.**
`config/base.cr:16` `if File.exists?(file)` with no `else` → a mistyped site-config
path yields zero sites, zero diagnostics.
*Fix:* `Log.warn`/`raise` when a listed path is absent.

**E5 — MEDIUM — Dead config fallback.**
`netbox-extractor.cr:45` `@@config ||= Config::Base.from_yaml("")` cannot work
(`logger`/`netbox` are required → raises `Missing YAML attribute`), masking
"config not loaded" behind an obscure YAML error.
*Fix:* explicit guard `raise "config not loaded — call load_config first"`.

**E6 — MEDIUM — Lossy `||` overrides make global config dead.**
`facts_fetcher/ansible.cr:27-33`: `@site...host_key_checking? || global...` cannot
express "site `false` overriding global `true`"; and `host_key_checking`/
`deprecation_warnings` (`property? ... : Bool = true/false`,
`config/ansible/site_fetch_facts.cr:13-14`) plus `caching_timeout`/`fork_limit`/
`timeout` (non-nil `Int32`, `:9-11`) are always truthy and `site.fetch_facts` is
required → the global fallback and the constants are **unreachable**. Concretely,
`netbox-extractor.yml:20` `host_key_checking: false` is silently ignored.
*Fix:* make site fields `Bool?`/`Int32?` (nil = inherit) and prefer the non-nil value.

**E7 — MEDIUM — `clusters.results.first` crashes on empty list.**
`controllers/test_api/post.cr:19`: `.first` (no `?`) raises `IndexError` on a Netbox
with zero clusters; not wrapped by a `with_debug` rescue.
*Fix:* `.first?` and bail with a clear message.

---

## 4. Performance / memory / CPU

**P1 — MEDIUM — Crinja re-parses the template per host.**
`presenters/concerns/templatable.cr:33` + `utils.cr:6`: `Crinja.render(string, ...)`
re-lexes/re-parses for every host of a role.
*Fix:* parse once (`Crinja::Template`) per template/role, render per host.

**P4 — MEDIUM — `results += data.results` is O(n²).**
`inventory_macros.cr:15` reallocates+copies each page.
*Fix:* `results.concat(data.results)`.

**P5 — MEDIUM — IPAM loads the entire global table.**
`netbox/ipam_inventory.cr:28-30`: no filter → the whole IPAM table in memory,
unbounded on large installs and not scoped per site (consistent with the Bind stub,
D6).
*Fix:* filter server-side / paginate lazily.

**G1 — MEDIUM — Temp files leaked on every run.**
`facts_fetcher/ansible.cr:144-154`: `generate_file` renames the tempfile to
`"#{tempfile.path}.#{suffix}"` and never deletes it — each run leaks 3 temp files per
inventory into `$TMPDIR` (the inventory one contains host vars). The `File.tempfile`
handle (already open) is also leaked, being reopened via `File.open` (`:147`).
*Fix:* track generated paths and `File.delete` in an `ensure` after `Process.run`, or
use a dedicated temp dir removed at end of `run`; write via the tempfile handle
directly.

**P2 — LOW — Repeated linear lookup per host.**
`presenters/concerns/with_custom_config.cr:30` `checks_config.find { ... }` is
re-invoked per service + `check_type` + `notification_period` per host
(`icinga_helper.cr:77,94`).
*Fix:* memoize `find_custom_config_for` once per presenter.

**P3 — LOW — No wall-clock bound on `ansible-playbook`.**
`facts_fetcher/ansible.cr:87`: `--timeout` only covers SSH connection; a wedged
playbook hangs the fiber indefinitely.
*Fix:* process-level timeout/kill.

Memory: loading all pages into RAM (`inventory_macros`) is acceptable at typical
Netbox volumes; the only leak is temp files (G1).

---

## 5. API design

**D1 — MEDIUM — Global mutable singletons.**
`@@config`/`@@client` (`netbox-extractor.cr`) make unit testing impractical and cause
K5; presenters/inventories reach into `NetboxExtractor.config`/`.client` as hidden
dependencies (`device_inventory.cr:32`, `icinga_helper.cr:179`, ...).
*Fix:* inject config/client via constructors, at least to a testable boundary.

**D2 — MEDIUM — `define_netbox_load` conflates "not loaded" with "empty".**
Root cause of C1. A load API should return an explicit success+data vs failure
result, not mutate an ivar by side effect.

**D3 — LOW — Massive duplication in `cli.cr`.**
The three flags (`config`/`env`/`site`) + `load_config`/`init_app!` are copy-pasted
across ~7 subcommands (drift risk). `Bind::Generate` omits `site`.
*Fix:* a shared base command or a macro.

**D4 — LOW — Magic `"all"` sentinel.**
A site literally named `all` can never be selected individually
(`controllers/*.cr:7`).
*Fix:* document the reserved name or use a distinct `--all-sites` flag.

**D5 — LOW — `port` advertised but ignored.**
`config/netbox.cr:8`: `build_netbox_client` (`netbox-extractor.cr:65-73`) never uses
`config.netbox.port` → a Netbox on a non-standard port is silently unreachable.
*Fix:* fold `port` into `cfg.host`, or remove the field.

**D6 — LOW — `generators/bind.cr` is a stub.**
`run` does `puts YAML.dump(ips)` to stdout — writes no zone file despite the class
name and docs. `Log` declared, never used (`:4`).
*Fix:* confirm/mark as unfinished.

**D7 — LOW/NIT — Dead params & no-op arithmetic.**
Unused `filename` (`generators/icinga.cr:68,79`); dead `filename ||= role` if
`role.filename` is never nil (`generators/ansible.cr:55,70`);
`((num_cpus * 2) / 1).to_i` — `/1` is a no-op and float division is obscure
(`icinga_helper.cr:110-112,125-127`, prefer `//`); redundant/TOCTOU
`mkdir_p unless Dir.exists?` (`templatable.cr:38`, `generators/ansible.cr:116`).

**N1 — NIT — Global `::Hash` monkey-patch.**
`patches/hash.cr:1-6` reopens `::Hash` to add `to_any_h` for every Hash in the
program, a broad surface for a narrow `RecursiveHash` use.
*Fix:* method on `RecursiveHash` or a module helper.

**D8 — LOW/NIT — Duplicated per-type patch/config classes.**
`Ansible::SiteDeviceRole`/`Icinga::SiteDeviceRole` (and the vm_role pair) are
byte-identical; the `netbox_*` helpers in `patches/netbox_device.cr` /
`netbox_vm.cr` are defined in parallel with divergent bodies.
*Fix:* extract shared base(s) with explicit overrides.

---

## 6. Security

**S3 — HIGH — `test_api post` writes to the real (prod) Netbox with no guard.**
`controllers/test_api/post.cr:53,67` (reachable via `test_api post`, `cli.cr:194`)
issues real `virtual_machines.create` + `bookmarks.create` against the configured
client — no env/prod guard, no confirmation. Running the shipped subcommand against
production injects junk VMs `foo<random>` and bookmarks (persistent inventory
writes). Loud, but destructive to an external system on a single command.
*Fix:* gate behind an explicit confirmation flag + a sandbox allowlist (refuse
unless the base URL matches), or remove `post` from the shipped CLI.

**S1 — MEDIUM — Icinga config injection via unescaped interpolation.**
`templates/icinga/generic-host.j2` (and `generic-vhost.j2`, `custom-host.j2`)
interpolate Netbox-sourced values with no escaping: `:1 "{{ hostname }}"`, `:16
tags | string | replace("'","\"")`, `:17/29/30` os/vendor, etc. A value containing
`"`, `\`, or a newline breaks the string and injects/aborts DSL — icinga2 then fails
to load the **entire zone** (monitoring blind spot). Rises toward HIGH if host names
are attacker-influenceable (they come from Netbox, semi-trusted; `os_name` can come
from a monitored host's `ansible_lsb.description`).
*Fix:* add a DSL-escaping Crinja filter (escape `"`, `\`, newline) and/or validate
names `^[A-Za-z0-9._-]+$`; JSON-encode array elements instead of the
`string|replace` hack.

**S2 — NOTE (not a vulnerability) — Credentials are constant references, not secrets.**
*Correction of a prior pass:* `generic-host.j2:51-52,65-66` etc. emit
rabbit/mysql/postgres/netapp `username`/`password` as **unquoted barewords**, and
`config/*.yml` supply **Icinga constant names** (e.g. `COLT_UL_ESX_API_PASS`), not
literal secrets — verified by reading the configs. So no secret material is written
to disk; Icinga resolves the constants at runtime. The only real risk is that a
constant name containing a space/quote/leading-digit produces invalid DSL.
*Fix:* document the invariant (values must be valid Icinga identifiers) and validate
them; otherwise no action. No secrets are baked into templates, config, or the
distroless non-root image (`.env` is never `COPY`ed).

---

## 7. Test coverage

**T1 — HIGH — The test suite is empty.**
*(Prior pass rated this CRITICAL; downgraded to HIGH per the rubric anchor —
"CRITICAL = silent data loss/corruption OR security breach, nothing else". Absent
coverage is not itself data loss; it is what lets the CRITICAL C1 ship undetected,
which is HIGH.)*
`spec/netbox-sync_spec.cr:3-4` is `Spectator.describe NetboxExtractor do end` — zero
assertions across 60 files / 2481 LOC. CI runs `mise dev:spec`
(`.github/workflows/ci.yml`), so **CI is green vacuously** and gives false
confidence. No coverage of: config deserialization (`Config::Base` + 25 config
classes and their `to_h`), `load_config` / template rendering, `Logger`,
`Utils.render_template`, `RecursiveHash`, all presenters/generators/controllers, the
inventories + `define_netbox_load` macro, the client patches.
*Fix (priority order):*
- round-trip `netbox-extractor.yml.example` through `Config::Base.from_yaml` (catches Doc1);
- unit-test every `to_h` (including the new `http_sni`);
- test `define_netbox_load` pagination: end-of-pages, empty page, `fetch_limit` >
  server page size (C7), and **network failure must not overwrite output** (C1);
- test the `netbox_*?` patches (roles, tags, OS).

**T2 — LOW — Misnamed spec.**
`netbox-sync_spec.cr` while the project is `netbox-extractor` (stale rename; breaks
the `*_spec.cr` ↔ source convention).

Audited with no findings: `recursive_hash.cr`, `utils.cr` (beyond re-parse P1),
`presenters/icinga_custom_host.cr`, `presenters/icinga_vhost.cr`,
`controllers/templates_manager.cr`, and most `config/icinga/checks/*`.

---

## 8. Documentation

**Doc1 — HIGH — Example config is not loadable.**
`config/ansible/global_fetch_facts.cr:23` `mitogen` is required (and `Mitogen#path`
required, `:10`) but `netbox-extractor.yml.example` has no `mitogen:` block →
`from_yaml` raises `Missing YAML attribute: mitogen`. (The live `netbox-extractor.yml`
works only because it ships the block, `:21-24`.)
*Fix:* make `mitogen`/`path` optional, or add the block to the example.

**Doc2 — MEDIUM — README "Development" section is broken.**
`README.md:41-47` documents `make setup/deps/spec/build`, but there is no root
`Makefile` (only `Makefile.release`); the project moved to mise.
*Fix:* use `mise run dev:deps|dev:build|dev:spec|dev:ameba` and `bin/netbox-extractor`.

**Doc3 — MEDIUM — Stale/incomplete README.**
`README.md:18` references asdf (migrated to mise); `:9-13` omits Bind DNS generation
(a shipped subcommand).

**Doc4 — MEDIUM — `netbox-extractor.yml.example` incomplete + schema-divergent.**
It uses inline `sites:` with `id:` keys while the loader expects `sites_config:`
file paths (as in the live file), and omits `include_objects`, icinga
`check_vhosts`/`check_custom_hosts`, `notification_period`, and the `mitogen` block.
Placeholders `version: <instance pg version>` / `port: <instance port>` (`:99-100`)
map to `Int32` → parse failure if copied.
*Fix:* reconcile to the real schema (`sites_config:` + commented blocks); numeric
placeholders.

**Doc5 — LOW — Unwrapped infra errors.**
`Utils.render_template` (`utils.cr:5`) and the append-mode log open (`logger.cr:39`)
have no rescue → raw backtrace on a bad config template or invalid `log_file` path.
*Fix:* wrap with the file path.

**Doc6 — NIT — Committed `.DS_Store` + loose Docker Crystal pin.**
`src/**/.DS_Store` and `templates/.DS_Store` are versioned junk; `Dockerfile:9`
pins `crystal=~1.18` vs mise.toml's exact `1.18.2` (image may drift within 1.18.x).
*Fix:* `.gitignore` + `git rm --cached` the `.DS_Store` files; pin `=1.18.2-r*`.

**Doc7 — NIT — `upx` output discarded.**
`Makefile.release:30` compresses to `…-upx`, but the Dockerfile copies the non-upx
binary → wasted build time.
*Fix:* drop `upx` or copy the compressed artifact.

Accurate, no findings: `mise.toml` (minor: `netbox-api:format` double-pass,
`netbox-api:patch` non-idempotent `git apply`, global java/python tools),
`Dockerfile` (distroless, `nonroot`, static, no `.env` copied — sound),
`docker-bake.hcl`, `.github/workflows/*` (multi-OS, `permissions: {}`,
`persist-credentials: false`), `.editorconfig`, `.ameba.yml`, `CLAUDE.md`.

---

## Config observations (leaf classes)

- **MEDIUM** `config/icinga/checks/mysql.cr:10` `check_slave : Bool? = false` — nilable
  Bool with a non-nil default is contradictory; `to_h` can emit `check_slave => nil`
  which `generic-host.j2:67` interpolates raw. Prefer `property? ... : Bool = false`.
- **LOW** `config/base.cr:8-9` inconsistent optionality: `ansible` required but
  `icinga` has a default — a config omitting `ansible:` fails hard while omitting
  `icinga:` loads.
- **LOW** `config/logger.cr:6` `level` defaults to `"debug"` — very verbose default
  for a production tool.
- **NOTE** Several `checks/*` array fields are required with no default
  (`partitions.cr:8` `exclude_volumes`, `netapp.cr:23-24`, `postgres.cr:28`,
  `rabbit.cr:27`): a present check block missing one of these fails YAML parse.

---

## 9. Remediation order

Ordering principle: severity first, then root-cause before dependents, same-file
batching, security weighted up within its tier. Items fixed by a single change are
grouped under one rank.

### Phase 0 — Root cause (CRITICAL)

| # | ID | File | Action |
|---|----|------|--------|
| 1 | **D2 + C1 + C2 + C7 + L1 + P4** | `netbox/concerns/inventory_macros.cr` | **Rewrite the load macro in one pass:** explicit success/failure return (no side-effecting ivar), broad `rescue` (`ApiError \| IO::Error \| Socket::Error \| JSON::ParseException`), `offset += data.results.size`, `break if data.results.empty?`, `results.concat(...)`. Unblocks 6 findings at once. |
| 2 | **C1 (generator side)** | `generators/ansible.cr:60,75`, `generators/icinga.cr:30` | Skip every destructive op (`File.delete`, `rm_rf`) when the load failed (flag from #1); build-then-swap for Icinga. Depends on #1. |
| 3 | **T1 (bootstrap)** | `spec/` | Bootstrap the suite + regression tests for #1/#2: example-config round-trip, `fetch_limit > server page` pagination, **network failure must not overwrite output**. In TDD, write these *before* #1/#2. |

### Phase 1 — HIGH

| # | ID | File | Action |
|---|----|------|--------|
| 4 | **K1 + E1** | `controllers/{ansible,icinga}.cr`, `generators/{icinga,ansible}.cr`, `netbox-extractor.cr` | Per-fiber error isolation/aggregation + non-zero exit on partial failure / unknown site. |
| 5 | **K2** | `facts_fetcher/ansible.cr:21,39` | Wipe the cache once before the fan-out, or scope it per site. |
| 6 | **K3** | `generators/icinga.cr:30`, `generators/ansible.cr:56,71` | Enforce disjoint zone/inventory paths, build-then-swap, else serialize. |
| 7 | **S3** | `controllers/test_api/post.cr` + `cli.cr` | Gate `test_api post` behind confirmation + sandbox allowlist, or remove from the shipped CLI. |
| 8 | **Doc1** | `config/ansible/global_fetch_facts.cr:10,23` + example | Make `mitogen`/`path` optional, or add the block → loadable example. |

### Phase 2 — MEDIUM (security → correctness → error model → perf/design → docs)

| # | ID | File | Action |
|---|----|------|--------|
| 9 | **S1** | `templates/icinga/*.j2` | Escape/validate interpolated values (`"`, `\`, newlines); JSON-encode arrays. |
| 10 | **C3** | `facts_fetcher/ansible.cr:78` | `v["netbox_tags"]?.try(&.as_a) || [] of YAML::Any`. |
| 11 | **C4** | `presenters/concerns/icinga_helper.cr:107,163,182` | Rescue `JSON::ParseException`/`IO::Error`; `["mount"]?.try(&.as_s)` + compact; `.as_i?`. |
| 12 | **C5** | `generators/ansible.cr:84`, `facts_fetcher/ansible.cr:59` | Rescue `YAML.parse`; fall back to empty vars + warning. |
| 13 | **C8** | `netbox/concerns/inventory_filters.cr:6`, `patches/netbox_device.cr:27`, `netbox_vm.cr:21` | Handle/filter `nil` names; validate name/id path segments. |
| 14 | **E2** | `facts_fetcher/ansible.cr:93-99` | Capture `Process::Status`; log/raise on `!success?`. |
| 15 | **E3** | `netbox-extractor.cr:80-83` | `STDERR.puts(e.inspect_with_backtrace)`. |
| 16 | **E4** | `config/base.cr:16` | `Log.warn`/`raise` when a `sites_config` path is absent. |
| 17 | **E5** | `netbox-extractor.cr:45` | Explicit "config not loaded" guard. |
| 18 | **E6** | `config/ansible/site_fetch_facts.cr:9-14` + `facts_fetcher/ansible.cr:27-33` | Site fields `Bool?`/`Int32?` (nil = inherit); prefer non-nil value. |
| 19 | **E7** | `controllers/test_api/post.cr:19` | `.first?` + clear bail message. |
| 20 | **K4** | `facts_fetcher/ansible.cr:42-50` | Bound `ansible-playbook` concurrency (semaphore/Channel). |
| 21 | **G1** | `facts_fetcher/ansible.cr:144-154` | Delete temp files (`ensure`); write via the existing handle. |
| 22 | **P1** | `presenters/concerns/templatable.cr:33` | Parse the Crinja template once per role. |
| 23 | **P5** | `netbox/ipam_inventory.cr:28-30` | Filter IPAM server-side / paginate. |
| 24 | **D1** | `netbox-extractor.cr` + presenters/inventories | Inject config/client via constructors (testability; widens T1). |
| 25 | **mysql** | `config/icinga/checks/mysql.cr:10` | `property? check_slave : Bool = false`. |
| 26 | **Doc2/Doc3/Doc4** | `README.md`, `netbox-extractor.yml.example` | Fix dev commands; asdf→mise; add Bind; reconcile example schema + numeric placeholders. |

### Phase 3 — LOW

| # | ID | File | Action |
|---|----|------|--------|
| 27 | **C6** | `icinga_helper.cr:131-141` | Guarantee non-nil `os_name` (fallback `""`). |
| 28 | **C9** | `patches/netbox_client.cr:73-74` | Real `Bool`; distinguish missing status. |
| 29 | **C10** | `logger.cr:31` | `.downcase` the level key. |
| 30 | **P2** | `with_custom_config.cr:30` | Memoize `find_custom_config_for` per presenter. |
| 31 | **P3** | `facts_fetcher/ansible.cr:87` | Process-level timeout/kill. |
| 32 | **K5** | `netbox-extractor.cr:45,53` | Keep eager init (or `Mutex`). |
| 33 | **D3** | `cli.cr` | DRY the flags + `load_config`/`init_app!`. |
| 34 | **D4** | `controllers/*.cr:7` | Document/rename the `"all"` sentinel. |
| 35 | **D5** | `config/netbox.cr:8` | Use `port` in `cfg.host` or remove the field. |
| 36 | **D6** | `generators/bind.cr` | Decide: finish or mark stub; drop unused `Log`. |
| 37 | **D8** | `config/**/site_*_role.cr`, `patches/netbox_{device,vm}.cr` | Extract shared base(s). |
| 38 | **S2** | `templates/icinga/*.j2` | Document/validate the Icinga-identifier invariant (no secret risk). |
| 39 | **Doc5** | `utils.cr:5`, `logger.cr:39` | Wrap infra errors with the file path. |
| 40 | **T2** | `spec/netbox-sync_spec.cr` | Rename to `netbox-extractor_spec.cr`. |
| 41 | **config-base** | `config/base.cr:8-9` | Harmonize `ansible`/`icinga` optionality. |
| 42 | **config-logger** | `config/logger.cr:6` | Less verbose default than `"debug"`. |
| 43 | **config-checks** | `checks/{partitions,netapp,postgres,rabbit}.cr` | Defaults on required arrays, or document. |

### Phase 4 — NIT

| # | ID | File | Action |
|---|----|------|--------|
| 44 | **D7** | `generators/*`, `icinga_helper.cr:110-127`, `templatable.cr:38` | Dead params, `/1` no-op (→ `//`), redundant `mkdir_p` guards. |
| 45 | **N1** | `patches/hash.cr` | Move `to_any_h` out of the global `::Hash` monkey-patch. |
| 46 | **Doc6** | `.gitignore`, `Dockerfile:9` | Drop committed `.DS_Store`; pin Crystal `=1.18.2-r*`. |
| 47 | **Doc7** | `Makefile.release:30` | Drop `upx` or copy the compressed artifact. |

Sequencing notes:
- **#1 is blocking** — it carries the worst finding (C1) and unblocks 5 same-file
  findings; do it first, ideally TDD with #3.
- Do **#24 (D1)** before the bulk of Phase 3 for solid unit tests.
- Pairs **K2/K3** and **K1/E1** are best done together (same area, same nature).

---

## Reconciliation notes (two passes → one)

- **C7 (pagination), K2 (shared-cache wipe), K4, P1, P4, P5, C5, E5, D5, D6, L1,
  D3, D4, D7, N1** were found by the data-pipeline/concurrency/perf pass and are
  carried here (each re-verified against the code).
- **S3 (`test_api post` prod write), E7 (`clusters.first`), C10 (log-level case),
  Doc6/Doc7 (build/repo nits)** were found by the surface/CLI pass and added here.
- **T1** reconciled CRITICAL → **HIGH** (rubric anchor: CRITICAL is reserved for
  silent data loss/corruption or a security breach).
- **S2** reconciled from "secrets written verbatim" → **not a vulnerability**: the
  config values are Icinga constant *names*, not literal secrets (verified by
  reading `config/*.yml`); nothing sensitive reaches disk.
- **C1 / D2** (the flagship CRITICAL) were found identically by both passes — high
  confidence in the root cause and its two destructive amplifiers.
