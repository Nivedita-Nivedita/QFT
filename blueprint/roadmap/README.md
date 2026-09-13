# Glimm-Jaffe: Quantum Physics - phi^4 Theory roadmap

Formalizing the mathematical path to Chapter 17 of Glimm and Jaffe,
*Quantum Physics: A Functional Integral Point of View* (2nd ed.): the
construction of the two-dimensional `P(φ)₂` Euclidean quantum field and the
proof that the `φ⁴` interaction has a critical point `σ_c` with a genuine
phase transition. See [sources/glimm-jaffe.md](../sources/glimm-jaffe.md) for
the book's exact page ranges.

This is a coarse milestone plan, not yet decomposed into pull-request-sized
statements. Each milestone below is a chapter directory; expanding one into
leaf declarations is future work.

## Chapters

1. [Correlation inequalities](correlation-inequalities/README.md) — Griffiths,
   FKG, and Lee-Yang, used throughout to control phases and analyticity.
2. [Covariance operators](covariance-operators/README.md) — the free
   Euclidean propagator and its boundary-condition dependence.
3. [Quantization on function space](function-space-quantization/README.md) —
   constructing the interacting measure and its perturbative renormalization.
4. [Dimension-independent estimates](dimension-independent-estimates/README.md)
   — bounds that let the ultraviolet and infinite-volume cutoffs be removed.
5. [Regularity and axioms](regularity-and-axioms/README.md) — the existence
   theorem: the cutoff-free `P(φ)₂` field satisfies the Euclidean axioms.
6. [Phase transitions](phase-transitions/README.md) — symmetry breaking and
   the existence of a phase transition for very negative `σ`.
7. [The cluster expansion](cluster-expansion/README.md) — convergent
   expansion away from the critical point, used for the high-temperature
   (large `σ`) regime.
8. [The φ⁴ critical point](phi4-critical-point/README.md) — the target
   chapter: existence of `σ_c` and the critical exponents.
