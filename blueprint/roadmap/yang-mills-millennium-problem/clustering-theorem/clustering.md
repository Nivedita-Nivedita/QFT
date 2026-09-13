---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.YangMillsMillenniumProblem.clustering_from_mass_gap
---

# Clustering from a mass gap

A precise Lean statement of Jaffe-Witten §5, eq. (2): the two-point
function of a translation-covariant local operator with vanishing vacuum
expectation, given as (a hypothesis stating it is) the Fourier transform of
a finite measure with no mass near the origin — the mass-gap condition
transferred to momentum space — decays exponentially at any rate below the
gap.

`sorry`-terminated: a complete proof needs a Stone/SNAG-type correspondence
between a unitary representation and its spectral measure, and a
Paley-Wiener-type theorem relating the support of that measure to decay of
its Fourier transform. Neither exists in Mathlib as of this writing
(checked directly: no `PaleyWiener` declaration, no Stone/SNAG
spectral-measure development). The statement is precise and compiles; the
proof is open because the supporting library isn't built yet.

## Depends on

- [Mass gap, mass operator, and vacuum definitions](../axiomatic-qft/mass-gap-definitions.md)

## Sources

- [Yang-Mills problem statement](../../../sources/yang-mills-millennium-problem/README.md), §5, eq. (2).
