# QFT

A growing, multi-book Lean 4 / Mathlib formalization of mathematical quantum
field theory, built with [AutoformBot](https://github.com/facebookresearch/autoform-bot)
and following the same blueprint conventions as
[ATLAS](https://github.com/facebookresearch/atlas-lean). New books and
papers are added over time as their own tracks, rather than this repository
being scoped to a single text.

## Guiding problem

Formalization priorities in this repository are guided by
[**Yang–Mills Existence and Mass Gap**](docs/yang-mills-existence-and-mass-gap.md),
Arthur Jaffe and Edward Witten's Clay Mathematics Institute Millennium
Prize Problem description. Its own account of what the problem needs maps
directly onto this repository's books:

- The problem's §6.2-6.4 point to Glimm-Jaffe-Spencer-style constructive
  QFT (correlation inequalities, cluster expansions, the `P(φ)₂` and `φ⁴`
  constructions) as the established toolkit for building nonlinear QFTs —
  **book 1**.
- §6.4 singles out Brydges-Fröhlich-Seiler's 2D abelian Higgs model as "the
  only complete example of an interacting gauge theory satisfying the
  axioms" — a concrete, far more tractable gauge-theory stepping stone than
  full 4D Yang–Mills.
- The problem is stated in the Wightman/Osterwalder-Schrader axiomatic
  framework (§3-4); Segal's alternative functorial axioms, targeted by
  **book 2**, are a rigorously-established alternative axiomatic framework
  for a genuinely interacting 2D CFT, relevant background for what
  "axiomatic properties at least as strong as" a QFT should mean.
- §6.5's lattice gauge theory and Balaban's renormalization-group program is
  the closest existing approach to the actual 4D Yang–Mills construction,
  a natural place to look when scoping **book 3**.
- The differential geometry of connections, curvature, and principal
  bundles that the Yang–Mills Lagrangian (1) is built from is exactly the
  content of **book 4**'s reference library.

## Books

| Book | Target | Status |
| --- | --- | --- |
| [Glimm-Jaffe: Quantum Physics](blueprint/roadmap/glimm-jaffe/README.md) | Ch. 17, "The φ⁴ Critical Point" | Ch. 4 (correlation inequalities) has `sorry`-proved Lean statements; rest is coarse chapters |
| [Liouville theory](blueprint/roadmap/liouville-theory/README.md) | Segal's axioms & conformal bootstrap for LCFT | Coarse chapters only |
| [Quantum Fields and Strings](blueprint/roadmap/quantum-fields-and-strings/README.md) | Not yet chosen | Placeholder; see that page's plan |
| [Gauge theory and four-manifolds](blueprint/roadmap/gauge-theory-references/README.md) | Not yet chosen | Reference library of 8 texts (Hamilton, Sontz, Frankel, Naber, Donaldson-Kronheimer, Freed-Uhlenbeck, Scorpan) |

Each book's own README links its full chapter list, sources, and
dependencies. Start at [`blueprint/README.md`](blueprint/README.md) for the
overall roadmap index.

## Adding a new book

1. Get a legitimate copy of the source (own it, institutional access, or an
   open preprint/repository) — never a pirated copy.
2. Add a citation note under `blueprint/sources/<book>/`, recording exact
   editions, page ranges, and section structure as they're read.
3. Add a `blueprint/roadmap/<book>/README.md` with a coarse, chapter-level
   milestone breakdown, and link it from `blueprint/roadmap/README.md`.
4. Add one row per chapter/area to `blueprint/coverage/README.md`.
5. Get the coarse plan reviewed before decomposing it into pull-request-sized
   Lean statement nodes (see `blueprint/roadmap/glimm-jaffe/correlation-inequalities/`
   for a worked example, including which of its results are already in
   Mathlib).
6. Write the Lean statements (`sorry`-proved first) under `QuantumPhysicsLean/`,
   and record their `lean:` declaration names in the corresponding roadmap
   articles once they compile.

## Building

```bash
lake exe cache get
lake build
```

## Proof-engineering tooling

This repo's `.mcp.json` configures [lean-lsp-mcp](https://github.com/oOo0oOo/lean-lsp-mcp)
(MIT), which gives an MCP-capable agent (e.g. Claude Code) live Lean goal
states, diagnostics, and Mathlib lemma search — much faster than editing and
running a full `lake build` per attempt. It should be picked up automatically
by any MCP-aware client opened in this directory.

The committed config points `command` at an absolute `uvx` path
(`/Users/niveditavij/.local/bin/uvx`) rather than a bare `uvx`, because on
the machine this was set up on, `~/.zshrc`/`~/.bash_profile`/`~/.config` are
root-owned and don't get `uv`'s install directory onto `PATH` normally. On a
different machine, replace that with a bare `"uvx"` (or wherever `uvx`
resolves) if `command not found` errors show up.

## Validating the blueprint

From an [AutoformBot](https://github.com/facebookresearch/autoform-bot)
checkout, run the full publication sequence before pushing — a Markdown
link wrapped across two lines once passed `check`/`audit` but broke the
strict site build silently:

```bash
uv run --project <AUTOFORM_CHECKOUT> autoform check blueprint --lean-root .
uv run --project <AUTOFORM_CHECKOUT> autoform audit blueprint --lean-root .
uv run --project <AUTOFORM_CHECKOUT> autoform-visualize blueprint
uv run --project <AUTOFORM_CHECKOUT> autoform render blueprint --output site-src --lean-root . --require-declarations
uvx --from mkdocs==1.6.1 --with mkdocs-material==9.6.21 --with mkdocs-literate-nav==0.6.2 --with pymdown-extensions==10.21.3 mkdocs build --strict
```

## Status

Early-stage, ongoing work. Contributions and review are welcome — open an
issue or PR.
