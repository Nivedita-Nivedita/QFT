# QuantumPhysicsLean

A Lean 4 / Mathlib formalization of J. Glimm and A. Jaffe, *Quantum Physics:
A Functional Integral Point of View* (2nd ed., Springer, 1987), built with
[AutoformBot](https://github.com/facebookresearch/autoform-bot) and following
the same blueprint conventions as
[ATLAS](https://github.com/facebookresearch/atlas-lean).

The target is Chapter 17, "The φ⁴ Critical Point" (pp. 339-355): the
existence of a critical point `σ_c` for the two-dimensional `φ⁴` Euclidean
quantum field. Getting there requires formalizing the full dependency chain
the book itself relies on — correlation inequalities (Ch. 4), the covariance
operator and quantization on function space (Chs. 7-9), dimension-independent
estimates and removal of cutoffs (Chs. 10-11), the Euclidean axioms (Ch. 12),
phase transitions (Ch. 16), and the cluster expansion (Ch. 18).

- [`blueprint/`](blueprint/) — the roadmap: chapters, statements, sources,
  and the dependency DAG. Start at
  [`blueprint/README.md`](blueprint/README.md).
- [`QuantumPhysicsLean/`](QuantumPhysicsLean/) — the Lean sources.
  Chapter 4 (correlation inequalities) currently has statement-level
  (`sorry`-proved) formalizations; see
  [`CorrelationInequalities.lean`](QuantumPhysicsLean/CorrelationInequalities.lean).

## Building

```bash
lake exe cache get
lake build
```

## Validating the blueprint

From an [AutoformBot](https://github.com/facebookresearch/autoform-bot)
checkout:

```bash
uv run --project <AUTOFORM_CHECKOUT> autoform check blueprint --lean-root .
uv run --project <AUTOFORM_CHECKOUT> autoform audit blueprint --lean-root .
```

## Status

This is early-stage, ongoing work; most of the dependency chain above is
still only sketched as roadmap chapters, not yet decomposed into Lean
statements. Contributions and review are welcome — open an issue or PR.
