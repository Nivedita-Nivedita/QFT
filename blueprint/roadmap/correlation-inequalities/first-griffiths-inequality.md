---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.CorrelationInequalities.first_griffiths_inequality
---

# First Griffiths inequality

Let `H` be ferromagnetic, let each single-spin measure `dμ_i(ξ_i)` be
symmetric under `ξ_i → -ξ_i`, and let the integrability condition of
[Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)
hold. Then all moments are nonnegative:

`0 ≤ ⟨ξ^A⟩`

for every subset `A` (with repeats) of the lattice.

The proof expands `e^{-H}` in a power series in the couplings `J_A ≥ 0` and
uses the symmetry of each `dμ_i` to show every term of the expansion is
nonnegative.

## Depends on

- [Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)

## Sources

- [Glimm-Jaffe](../../sources/glimm-jaffe.md), Theorem 4.1.1, p. 58.
