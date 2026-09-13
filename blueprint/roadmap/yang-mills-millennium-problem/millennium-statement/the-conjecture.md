---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.YangMillsMillenniumProblem.yang_mills_existence_and_mass_gap
---

# Yang-Mills Existence and Mass Gap

A precise Lean statement of the boxed conjecture in Jaffe-Witten §4: a
non-trivial quantum field theory exists with a mass gap, using the
[mass gap and vacuum definitions](../axiomatic-qft/mass-gap-definitions.md).
The gauge group data `G` is taken abstractly (`[Group G]`); the Yang-Mills
Lagrangian, gauge invariance, and the full Wightman/Osterwalder-Schrader
axiom sets are not encoded — only the existence-of-a-vacuum and mass-gap
content is.

This is the Millennium Prize Problem itself. It is `sorry`-terminated and
must stay that way: no proof is attempted here, and none should be.

## Depends on

- [Mass gap, mass operator, and vacuum definitions](../axiomatic-qft/mass-gap-definitions.md)

## Sources

- [Yang-Mills problem statement](../../../sources/yang-mills-millennium-problem/README.md), §4 (boxed statement).
