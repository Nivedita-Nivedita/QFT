---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.CorrelationInequalities.lee_yang_theorem
---

# The Lee-Yang theorem

For a single-spin measure `dμ_i = e^{-P_i(ξ_i)} dξ_i` with
`P_i(ξ_i) = a_iξ_i⁴ + b_iξ_i²` (`a_i > 0`), Hamiltonian
`H(ξ) = -Σ J_{ij}ξ_iξ_j - Σ h_iξ_i` with ferromagnetic pair couplings
`0 ≤ J_{ij}`, and partition function `Z_Λ({h_i}) = ∫ e^{-H(ξ)} dμ(ξ)`: if
`|Im h_i| ≤ Re h_i` for all `i`, then

`0 < Z_Λ(h_i = 0) ≤ Z_Λ(Re h_i - |Im h_i|) ≤ |Z_Λ(h_i)|`,

so in particular `Z_Λ ≠ 0` whenever `Re h_i ≠ 0` for all `i`: the theory has
no phase transition (no zero of the partition function) for nonzero real part
of the external field. The proof (following Dunlop rather than the original
Lee-Yang argument) expresses `|Z(h)|²` as an integral, in duplicate-variable
polar coordinates, of a product of functions shown to be positive definite
(nonnegative Fourier coefficients), using that positive definite functions
form a multiplicative convex cone closed under sums, products, and
exponentials.

## Depends on

- [Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)

## Sources

- [Glimm-Jaffe](../../../sources/glimm-jaffe.md), Definition 4.5.2, Proposition 4.5.3,
  and Theorem 4.5.1', p. 66-69.
