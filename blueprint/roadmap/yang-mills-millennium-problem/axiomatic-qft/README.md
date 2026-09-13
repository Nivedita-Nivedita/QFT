# Axiomatic quantum field theory

Source: Jaffe-Witten, §3 "Quantum Fields," §4 "The Problem," and §6.2, in
the problem statement (`docs/yang-mills-existence-and-mass-gap.md`).

A quantum field theory, in the Wightman sense used here, carries a Hilbert
space `H` with a positive-energy unitary representation of the Poincaré
group and a vacuum vector `Ω` invariant under that representation (unique
up to phase). Writing `H` (overloaded with the Hilbert space's name, as the
source does) for the Hamiltonian and `P⃗` for the momentum operators: the
theory has a **mass gap** `Δ` if the spectrum of `H` meets `(0,Δ)` nowhere,
for some `Δ > 0`; the **mass** `m` is the supremum of such `Δ`, required
finite. The **mass operator** is `M = √(H² − P⃗²) ≥ 0`; since `Ω` is
Poincaré-invariant, `HΩ = 0` and `MΩ = 0`.

This chapter formalizes only the amount of structure needed to state the
mass gap and the clustering theorem precisely — not a full axiomatization
of Wightman QFT (fields, causality, Poincaré covariance of the fields
themselves are not needed for those two statements and are not yet
formalized here).

- [Mass gap, mass operator, and vacuum definitions](mass-gap-definitions.md)
- [The spectral condition, and vacuum-orthogonality](spectral-condition-and-vacuum-structure.md)
