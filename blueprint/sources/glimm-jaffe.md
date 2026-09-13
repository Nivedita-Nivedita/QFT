# Source: Glimm & Jaffe, Quantum Physics (2nd ed.)

James Glimm and Arthur Jaffe, *Quantum Physics: A Functional Integral Point of
View*, 2nd ed., Springer-Verlag, 1987. ISBN 0-387-96476-2.

Local copy: `~/Projects/autoform/Quantum Physics - A Functional Integral Point
of View - Glimm and Jaffe.pdf` (not committed to this repository; the author
holds their own copy). Page numbers below are the book's printed page numbers.

## Target: Chapter 17, "The φ⁴ Critical Point" (pp. 339-355)

- 17.1 Elementary Considerations (339) — defines the interaction
  `V(φ) = λφ⁴ + σφ² - μφ`, `λ > 0`, and the critical value `σ_c` as the
  infimum of `σ` (at `μ = 0`) for which the theory has a unique phase and
  exponential decay of correlations.
- 17.2 The Absence of Even Bound States (340)
- 17.3 A Bound on the Coupling Constant λ_phys (342)
- 17.4 Existence of Particles and a Bound on dm²/dσ (344)
- 17.5 Existence of the φ⁴ Critical Point (345)
- 17.6 Continuity of dμ at the Critical Point (348)
- 17.7 Critical Exponents (349)
- 17.8 η ≤ 1 (351)
- 17.9 The Scaling Limit (353)
- 17.10 The Conjecture Γ⁽⁶⁾ ≤ 0 (354)

## Prerequisite chain (not yet scoped)

Chapter 17 sits in Part III ("The Physics of Quantum Fields") and is not
self-contained. Its opening page alone cites:

- The **Lee-Yang theorem** (Ch. 4, "Correlation Inequalities and the
  Lee-Yang Theorem", p. 56) — used to rule out a phase transition for
  `μ ≠ 0`.
- **Ch. 16, "Phase Transitions"** (p. 316), particularly 16.2 "The Two Phase
  Region" — used for existence of a phase transition when `σ` is very
  negative.
- The **cluster expansion**, Ch. 18 (p. 356) — cited forward, for the
  high-temperature (large `σ`) regime.

More broadly, Part III (Chs. 13-20) presupposes the existence construction of
the `P(φ)₂` quantum field built across **Part II** (Chs. 7-12: covariance
operators, Feynman-Kac quantization, function-space calculus and
renormalization, dimension-independent estimates, removal of cutoffs,
regularity/axioms), and the **correlation inequalities of Ch. 4**.

Decomposing this dependency chain into roadmap milestones (as opposed to
formalizing an isolated Ch. 17 statement against assumed hypotheses) is a
scope decision for the project author; see the open question recorded in
`blueprint/coverage/README.md`.
