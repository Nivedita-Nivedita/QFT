---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.CorrelationInequalities.second_griffiths_inequality
---

# Second Griffiths inequality

Under the same hypotheses as the
[first Griffiths inequality](first-griffiths-inequality.md), pair correlations
are also nonnegative:

`0 ≤ ⟨ξ^A ξ^B⟩ - ⟨ξ^A⟩⟨ξ^B⟩`.

The proof introduces rotated duplicate-variable coordinates
`t_i = 2^{-1/2}(ξ_i + χ_i)`, `q_i = 2^{-1/2}(ξ_i - χ_i)` and the key lemma
that for any exponent `A`, `2^{-|A|/2}(ξ^A ± χ^A) = (q + t)^A ± (q - t)^A` is
ferromagnetic (has nonnegative coefficients) as a polynomial in `q` and `t`;
the inequality then follows by applying the first Griffiths inequality to
`H(ξ) + H(χ)`, itself ferromagnetic in the rotated variables.

## Depends on

- [Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)
- [First Griffiths inequality](first-griffiths-inequality.md)

## Sources

- [Glimm-Jaffe](../../sources/glimm-jaffe.md), Lemma 4.1.2 and Theorem 4.1.3, p. 58-59.
