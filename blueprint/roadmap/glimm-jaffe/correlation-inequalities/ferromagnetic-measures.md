---
declaration: def
origin: background
statement: formalized
lean: QuantumPhysicsLean.CorrelationInequalities.FerromagneticHamiltonian, QuantumPhysicsLean.CorrelationInequalities.spinPow, QuantumPhysicsLean.CorrelationInequalities.partitionFunction, QuantumPhysicsLean.CorrelationInequalities.expectation, QuantumPhysicsLean.CorrelationInequalities.duplicateExpectation
---

# Ferromagnetic lattice Hamiltonians and expectations

For a finite lattice `Λ` with spin variables `ξ = (ξ_i)_{i ∈ Λ}`, single-spin
measures `dμ_i` on `R`, and a polynomial Hamiltonian
`H = -Σ_A J_A ξ^A` (a finite sum over subsets `A` of `Λ`, with possible
repeats, of `ξ^A := Π_i ξ_i^{a_i}`), `H` is *ferromagnetic* if `0 ≤ J_A` for
every `A`. Given the integrability condition
`∫ |ξ|^N e^{|H(ξ)|} Π dμ_i(ξ_i) < ∞` for all `N`, define the partition
function `Z = ∫ e^{-H(ξ)} dμ(ξ)` and the expectation
`⟨F⟩ = Z⁻¹ ∫ F(ξ) e^{-H(ξ)} dμ(ξ)`.

The duplicate-variable expectation, for a function `F` of two independent
copies `ξ, χ` of the lattice with the same single-spin measures, is
`⟨F⟩ = Z⁻² ∫ F(ξ, χ) e^{-H(ξ) - H(χ)} dμ(ξ) dμ(χ)`; it reduces to the
ordinary expectation when `F` depends only on `ξ` or only on `χ`.

This shared setup underlies every correlation inequality in this chapter.

## Depends on

- (none: this is the chapter's foundational definition)

## Sources

- [Glimm-Jaffe](../../../sources/glimm-jaffe.md), Ch. 4.1, eqs. (4.1.1)-(4.1.8), p. 57-58.
