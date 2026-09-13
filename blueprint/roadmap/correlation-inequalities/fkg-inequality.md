---
declaration: theorem
origin: cited
statement: formalized
lean: QuantumPhysicsLean.CorrelationInequalities.fkg_inequality
---

# The FKG inequality

Let `F, G` be monotone increasing functions of `ξ = (ξ_1,...,ξ_n) ∈ R^n` (with
the coordinatewise order), and let the expectation `⟨·⟩` be as in
[Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md),
with the interaction polynomials `P_j` allowed arbitrary nonnegative
boundary quadratic terms. Then

`⟨F⟩⟨G⟩ ≤ ⟨FG⟩`.

The hypotheses differ from Griffiths' second inequality (different allowed
interactions and observables), and the proof is by induction on the number of
lattice sites using a duplicate-variable argument, rather than power-series
expansion.

**Already in Mathlib** in the finite, discrete-lattice form: `Finset.fkg` in
`Mathlib/Combinatorics/SetFamily/FourFunctions.lean` proves exactly this
inequality for a log-supermodular weight `μ` (`μ a * μ b ≤ μ (a ⊓ b) * μ (a ⊔ b)`)
and monotone `f, g` on a finite distributive lattice, derived there from the
Ahlswede-Daykin four functions theorem. Adapting it to this chapter's
continuous single-spin measures is future bridging work, not a new proof of
FKG itself.

## Depends on

- [Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)

## Sources

- [Glimm-Jaffe](../../sources/glimm-jaffe.md), Theorem 4.4.1, p. 65.
