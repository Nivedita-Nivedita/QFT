---
declaration: def
origin: cited
statement: formalized
proof: formalized
lean: QuantumPhysicsLean.YangMillsMillenniumProblem.HasMassGap, QuantumPhysicsLean.YangMillsMillenniumProblem.mass, QuantumPhysicsLean.YangMillsMillenniumProblem.IsVacuum, QuantumPhysicsLean.YangMillsMillenniumProblem.IsMassOperator, QuantumPhysicsLean.YangMillsMillenniumProblem.massOperator_vac_eq_zero
---

# Mass gap, mass operator, and vacuum definitions

`HasMassGap Ham Δ`: the Hamiltonian's spectrum meets `(0,Δ)` nowhere.
`mass Ham`: the supremum of such `Δ`. `IsVacuum Ham vac`: `vac` is nonzero
and annihilated by `Ham`. `IsMassOperator Ham P M`: `M` is self-adjoint,
has spectrum in `[0,∞)`, and satisfies `M² = H² − P⃗²`.

`massOperator_vac_eq_zero` is a genuinely proved theorem (no `sorry`,
`#print axioms` shows only `propext`, `Classical.choice`, `Quot.sound`):
given `IsMassOperator Ham P M` and that both `Ham` and each `P i` annihilate
the vacuum, `M` does too — `MΩ = 0`, matching the source's remark that
this "follows...via the defining relation `M² = H² − P⃗²`."

These formalize a bounded-operator simplification of the source's
unbounded Hamiltonian, and characterize the mass operator by its defining
relation rather than constructing it via continuous functional calculus.

## Depends on

- (none: this is the book's foundational definitions)

## Sources

- [Yang-Mills problem statement](../../../sources/yang-mills-millennium-problem/README.md), §3-4, 6.2.
