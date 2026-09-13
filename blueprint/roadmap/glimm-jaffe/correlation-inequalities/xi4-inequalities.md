---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.CorrelationInequalities.lebowitz_inequality, QuantumPhysicsLean.CorrelationInequalities.triple_correlation_nonpos
---

# ξ⁴ inequalities and the Lebowitz inequalities

For a single-spin measure `dμ_i = e^{-P_i(ξ_i)} dξ_i` with a quartic
interaction `P_i(ξ_i) = λ_i ξ_i⁴ + σ_i ξ_i²` (`0 < λ_i`, or `λ_i = 0` and
`0 < σ_i`), a fourfold duplicate-variable expectation
`0 ≤ ⟨α^A β^B γ^C δ^D⟩` holds, where `α, β, γ, δ` are obtained from two
independent duplicate pairs `(ξ, χ)` and `(ξ', χ')` by an orthogonal change of
variables. Specializing to twofold (Lebowitz) inequalities in the rotated
`t, q` variables and translating back gives the useful corollary:

`0 ≤ ⟨ξ_i ξ_j ξ_k⟩ - ⟨ξ_i⟩⟨ξ_j ξ_k⟩ - ⟨ξ_j⟩⟨ξ_i ξ_k⟩ - ⟨ξ_k⟩⟨ξ_i ξ_j⟩ + 2⟨ξ_i⟩⟨ξ_j⟩⟨ξ_k⟩ ≤ 0`

(under `h_i ≥ 0`), which bounds the truncated three-point function.

## Depends on

- [Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)
- [Second Griffiths inequality](second-griffiths-inequality.md)

## Sources

- [Glimm-Jaffe](../../../sources/glimm-jaffe.md), Theorem 4.3.1, Corollaries 4.3.2 and 4.3.4, p. 60-63.
