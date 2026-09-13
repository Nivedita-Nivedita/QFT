---
declaration: def
origin: cited
statement: formalized
proof: formalized
lean: QuantumPhysicsLean.YangMillsMillenniumProblem.HaagKastlerNet.CovariantRep.SatisfiesSpectralCondition, QuantumPhysicsLean.YangMillsMillenniumProblem.HaagKastlerNet.CovariantRep.vacuum_orthogonal_range, QuantumPhysicsLean.YangMillsMillenniumProblem.HaagKastlerNet.CovariantRep.IsCyclicVacuumFor, QuantumPhysicsLean.YangMillsMillenniumProblem.HaagKastlerNet.CovariantRep.IsSeparatingVacuumFor
---

# Vacuum structure of a covariant representation

`CovariantRep.SatisfiesSpectralCondition` and `CovariantRep.vacuum_orthogonal_range` transport
the [spectral condition and vacuum-orthogonality](../axiomatic-qft/spectral-condition-and-vacuum-structure.md) already formalized for the Wightman picture onto a representation's own
Hamiltonian; the latter is a genuinely proved theorem (no `sorry`, only the
three standard axioms), not merely a restatement.

`IsCyclicVacuumFor rep B` and `IsSeparatingVacuumFor rep B` are the two
standard vacuum-structure axioms of algebraic QFT: the vacuum is **cyclic**
for a region's local algebra if
acting on it with that algebra spans a dense subspace of the Hilbert space,
and **separating** if no nonzero element of the algebra annihilates it.
These are recorded here only as definitions, not proved: in the concrete
Wightman setting both properties follow, for every non-empty open region,
from the Reeh-Schlieder theorem's analytic-continuation argument on vacuum
expectation values — an argument well beyond what this net-level
formalization currently has the tools to reach, and not attempted here.

## Depends on

- [The Haag-Kastler net](haag-kastler-net.md)
- [Covariant representations and mass gap](covariant-representation.md)
- [The spectral condition, and vacuum-orthogonality](../axiomatic-qft/spectral-condition-and-vacuum-structure.md)

## Sources

- [Standard algebraic QFT background](../../../sources/algebraic-qft-background/README.md), for the cyclic/separating vacuum axioms and their relation to the Reeh-Schlieder theorem.
