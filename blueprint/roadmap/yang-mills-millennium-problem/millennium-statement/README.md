# The Millennium Problem statement

Source: Jaffe-Witten, §4 "The Problem" (the boxed statement), in
the problem statement (`docs/yang-mills-existence-and-mass-gap.md`).

> **Yang-Mills Existence and Mass Gap.** Prove that for any compact simple
> gauge group `G`, a non-trivial quantum Yang-Mills theory exists on `R⁴`
> and has a mass gap `Δ > 0`. Existence includes establishing axiomatic
> properties at least as strong as those cited in [Wightman; Osterwalder-Schrader].

Formalizing this precisely is a legitimate, checkable act of translation:
it pins down exactly what "exists" and "mass gap" must mean, using the
[axiomatic QFT chapter](../axiomatic-qft/README.md)'s definitions. It is
**not** a proof, and stating it in Lean does not constitute progress
toward solving it — the statement is recorded as an explicit, honestly
unproved conjecture (`sorry`), never asserted with `proof: formalized`.

- [Yang-Mills Existence and Mass Gap](the-conjecture.md)

## Depends on

- [Axiomatic quantum field theory](../axiomatic-qft/README.md)
