---
declaration: theorem
origin: cited
---

# Monotonicity and the infinite-volume limit

As a consequence of the [second Griffiths inequality](second-griffiths-inequality.md),
the correlation functions `⟨ξ^B⟩` of a ferromagnetic Hamiltonian are monotone
increasing in each coupling `J_A` (since `d⟨ξ^B⟩/dJ_A = ⟨ξ^B ξ^A⟩ -
⟨ξ^A⟩⟨ξ^B⟩ ≥ 0`). For the Ising model (`ξ_i = ±1`) the couplings are
ferromagnetic and every correlation function is bounded, `⟨ξ^A⟩ ≤ 1`. Adding
volume `Λ ↑ R^d` only increases certain couplings, so monotonicity together
with this uniform upper bound gives convergence of the Ising model
correlation functions `⟨ξ^B⟩` as `Λ ↑ R^d`.

The couplings-monotonicity half and the Ising `≤ 1` bound are formalized
(statement only) as `griffiths_monotone_in_coupling` and
`ising_correlation_le_one` in `QuantumPhysicsLean/CorrelationInequalities.lean`.
The convergence statement itself (Theorem 4.2.3) needs a family of
Hamiltonians indexed by an increasing sequence of finite volumes and is not
yet stated; this node is not marked `statement: formalized` until that is
added.

## Depends on

- [Second Griffiths inequality](second-griffiths-inequality.md)

## Sources

- [Glimm-Jaffe](../../../sources/glimm-jaffe.md), Propositions 4.2.1-4.2.2 and Theorem 4.2.3, p. 59-60.
