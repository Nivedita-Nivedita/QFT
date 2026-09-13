---
declaration: def
origin: cited
statement: formalized
proof: formalized
lean: QuantumPhysicsLean.YangMillsMillenniumProblem.SatisfiesSpectralCondition, QuantumPhysicsLean.YangMillsMillenniumProblem.vacuum_orthogonal_range
---

# The spectral condition, and vacuum-orthogonality

Unlike the rest of this chapter, this node is not a direct transcription of
anything in the Jaffe-Witten problem statement — it is a genuine extension
of this project, formalizing standard surrounding AQFT structure (Haag,
*Local Quantum Physics*, §II.5.1) that the source document assumes rather
than states.

`SatisfiesSpectralCondition Ham`: `Ham` is self-adjoint and its spectrum is
real and non-negative — positivity of the energy, already implicit in the
source document's description of a QFT as carrying a "positive-energy
unitary representation." This is strictly weaker than `HasMassGap`: a
massless (but still positive-energy) theory satisfies it too.

`vacuum_orthogonal_range` is a genuinely proved theorem (no `sorry`,
`#print axioms` shows only `propext`, `Classical.choice`, `Quot.sound`):
given the spectral condition and a vacuum vector `vac` for `Ham`, every
vector of the form `Ham w` is orthogonal to `vac`. The proof is short but
not vacuous — it uses that a self-adjoint operator is normal, so its
kernel and range are orthogonal complements (`ContinuousLinearMap.
IsStarNormal.orthogonal_range`), and that the vacuum lies in `ker Ham` by
definition.

## Depends on

- [Mass gap, mass operator, and vacuum definitions](mass-gap-definitions.md)

## Sources

- [Standard algebraic QFT background](../../../sources/algebraic-qft-background/README.md), for the spectral condition as a standard structural axiom independent of the mass gap.
