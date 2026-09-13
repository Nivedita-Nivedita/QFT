---
declaration: theorem
origin: cited
---

# Analyticity of the free energy

For a translation-invariant, nearest-neighbor, ferromagnetic lattice field
with free energy `f_Λ = |Λ|⁻¹ ln Z_Λ`, the infinite-volume limit
`f = lim_{Λ↑∞} f_Λ` exists (a special case of the
[infinite-volume limit](infinite-volume-limit.md) monotonicity argument), and
if the [Lee-Yang](lee-yang-theorem.md) bound holds for `Z_Λ(h)`, then `f(h)`
is analytic for `|Im h| < Re h`. The proof uses the Vitali convergence
theorem on `g_Λ(h) = Z_Λ(h)^{1/|Λ|}`, bounded uniformly on compact subsets of
the analyticity domain by the Lee-Yang inequality. A limiting argument
(dominated convergence as `λ → ∞` in `P_λ(ξ) = λ(ξ²-1)²`) transports the
result to the Ising model, and the same idea is used in Part II to show the
`φ⁴` quantum field's free energy is analytic for `|Im h| < Re h`.

## Depends on

- [Monotonicity and the infinite-volume limit](infinite-volume-limit.md)
- [The Lee-Yang theorem](lee-yang-theorem.md)

## Sources

- [Glimm-Jaffe](../../sources/glimm-jaffe.md), Proposition 4.6.1 and Theorem 4.6.2, p. 69-70.
