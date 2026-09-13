# QFT

A growing, multi-book Lean 4 / Mathlib formalization of mathematical quantum
field theory, built with [AutoformBot](https://github.com/facebookresearch/autoform-bot)
and following the same blueprint conventions as
[ATLAS](https://github.com/facebookresearch/atlas-lean). New books and
papers are added over time as their own tracks, rather than this repository
being scoped to a single text.

## Books

| Book | Target | Status |
| --- | --- | --- |
| [Glimm-Jaffe: Quantum Physics](blueprint/roadmap/glimm-jaffe/README.md) | Ch. 17, "The φ⁴ Critical Point" | Ch. 4 (correlation inequalities) has `sorry`-proved Lean statements; rest is coarse chapters |
| [Liouville theory](blueprint/roadmap/liouville-theory/README.md) | Segal's axioms & conformal bootstrap for LCFT | Coarse chapters only |
| [Quantum Fields and Strings](blueprint/roadmap/quantum-fields-and-strings/README.md) | Not yet chosen | Placeholder; see that page's plan |

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
