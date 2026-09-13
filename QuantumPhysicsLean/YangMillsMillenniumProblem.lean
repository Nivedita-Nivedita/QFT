/-
Copyright (c) 2026 Nivedita Vij. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Nivedita Vij
-/
import Mathlib

/-!
# Yang-Mills Existence and Mass Gap

Formalization of the self-contained mathematical content of Jaffe and
Witten's Clay Mathematics Institute Millennium Prize Problem statement
itself (not the ~40 papers it cites for context, which are represented,
where formalized at all, by this project's other books). See
`docs/yang-mills-existence-and-mass-gap.md` and
`blueprint/roadmap/yang-mills-millennium-problem/`.

Two of the declarations below are `sorry`-terminated, and will remain so
for different reasons:

* `yang_mills_existence_and_mass_gap` is the Millennium Problem itself.
  It is a precise translation of the boxed statement in §4, not a proof
  attempt -- no one should attempt to prove it here.
* `clustering_from_mass_gap` is the one theorem the source document proves
  outright (§5, eq. (2)), rather than citing. A complete proof needs (a) a
  Stone/SNAG-type correspondence between a unitary representation of `R^3`
  and its spectral measure, and (b) a Paley-Wiener-type theorem relating
  the support of that measure to exponential decay of its Fourier
  transform. Neither exists in Mathlib as of this writing (checked: no
  `PaleyWiener` declaration, and no Stone/SNAG spectral-measure
  development). The statement below is precise and checked; the proof is
  left open because the supporting library isn't built yet, not because
  the mathematics is in doubt.
-/

namespace QuantumPhysicsLean.YangMillsMillenniumProblem

open MeasureTheory

variable {𝓗 : Type*} [NormedAddCommGroup 𝓗] [InnerProductSpace ℂ 𝓗] [CompleteSpace 𝓗]

/-- The Hamiltonian `Ham` has a **mass gap** `Δ` if its spectrum meets
`(0, Δ)` nowhere: Jaffe-Witten §4. Formalized for a bounded operator on a
Hilbert space; the physical Hamiltonian is generally unbounded, a
simplification made here. -/
def HasMassGap (Ham : 𝓗 →L[ℂ] 𝓗) (Δ : ℝ) : Prop :=
  0 < Δ ∧ ∀ z ∈ spectrum ℂ Ham, z = 0 ∨ Δ ≤ z.re

/-- The **mass** of a theory with Hamiltonian `Ham`: the supremum of the
`Δ` for which `HasMassGap Ham Δ` holds (Jaffe-Witten §4; the source
additionally requires this supremum to be finite). -/
noncomputable def mass (Ham : 𝓗 →L[ℂ] 𝓗) : ℝ :=
  sSup {Δ : ℝ | HasMassGap Ham Δ}

/-- A **vacuum vector** for the Hamiltonian `Ham`: nonzero, and annihilated
by `Ham` (Jaffe-Witten §3-4: `Ω` is Poincaré-invariant, hence `HΩ = 0`
since `H` generates time translation and `Ω` is time-invariant). -/
def IsVacuum (Ham : 𝓗 →L[ℂ] 𝓗) (vac : 𝓗) : Prop :=
  vac ≠ 0 ∧ Ham vac = 0

/-- `M` is **the mass operator** `M = √(H² − P⃗²)` for Hamiltonian `Ham` and
momentum operators `P`: characterized here by its defining algebraic
relation and positivity, rather than constructed via functional calculus
(Jaffe-Witten §6.2). -/
def IsMassOperator (Ham : 𝓗 →L[ℂ] 𝓗) (P : Fin 3 → 𝓗 →L[ℂ] 𝓗) (M : 𝓗 →L[ℂ] 𝓗) : Prop :=
  IsSelfAdjoint M ∧ (∀ z ∈ spectrum ℂ M, 0 ≤ z.re ∧ z.im = 0) ∧
    M * M = Ham * Ham - ∑ i, P i * P i

/-- **The vacuum is a null vector of the mass operator**, `MΩ = 0`
(Jaffe-Witten §6.2): an immediate consequence of `HΩ = 0` and `PΩ = 0`
(momentum, like the Hamiltonian, annihilates the Poincaré-invariant
vacuum) via the defining relation `M² = H² − P⃗²`. -/
theorem massOperator_vac_eq_zero (Ham : 𝓗 →L[ℂ] 𝓗) (P : Fin 3 → 𝓗 →L[ℂ] 𝓗)
    (M : 𝓗 →L[ℂ] 𝓗) (hM : IsMassOperator Ham P M) (vac : 𝓗)
    (hHvac : Ham vac = 0) (hPvac : ∀ i, P i vac = 0) :
    M (M vac) = 0 := by
  have hsq : (M * M) vac = 0 := by
    rw [hM.2.2]
    simp [hHvac, hPvac]
  simpa [ContinuousLinearMap.mul_apply] using hsq

/-- **The Yang-Mills Existence and Mass Gap problem** (Jaffe-Witten §4, the
boxed statement): a non-trivial quantum field theory exists with a mass
gap. This records the existence-and-mass-gap content of the Millennium
Problem for an abstractly given "gauge group data" `G`; it does **not**
attempt to encode the Yang-Mills Lagrangian, gauge invariance, or the
Wightman/Osterwalder-Schrader axioms beyond a vacuum and a mass gap --
those refinements belong to future work on this node, not to this
statement's proof, which is the open Millennium Problem itself and must
stay `sorry`. -/
theorem yang_mills_existence_and_mass_gap (G : Type*) [Group G] :
    ∃ (𝓗 : Type) (_ : NormedAddCommGroup 𝓗) (_ : InnerProductSpace ℂ 𝓗)
      (_ : CompleteSpace 𝓗) (Ham : 𝓗 →L[ℂ] 𝓗) (vac : 𝓗) (Δ : ℝ),
      IsVacuum Ham vac ∧ HasMassGap Ham Δ := by
  sorry

/-- **Clustering from a mass gap** (Jaffe-Witten §5, eq. (2)). The two-point
function `f x y := ⟨Ω, O(x⃗)O(y⃗)Ω⟩` of a translation-covariant local
operator `O` with vanishing vacuum expectation is, by the Stone/SNAG
correspondence, the Fourier transform of a finite measure `ν` on momentum
space (taken here as a hypothesis, `hf`, rather than derived); the mass
gap removes any mass of `ν` near the origin (`hgap`). The conclusion is
that `f` decays exponentially at any rate `C` below the gap `Δ`, once its
arguments are far enough apart. See the module docstring for exactly what
supporting theory this proof needs and does not yet have in Mathlib. -/
theorem clustering_from_mass_gap
    (f : (Fin 3 → ℝ) → (Fin 3 → ℝ) → ℂ)
    (htrans_inv : ∀ x y z, f (x + z) (y + z) = f x y)
    (ν : Measure (Fin 3 → ℝ)) [IsFiniteMeasure ν]
    (hf : ∀ x y, f x y =
      ∫ p, Complex.exp (Complex.I * (∑ i, (p i : ℂ) * ((x i : ℂ) - (y i : ℂ)))) ∂ν)
    (Δ : ℝ) (hΔ : 0 < Δ) (hgap : ν (Metric.ball 0 Δ) = 0)
    (C : ℝ) (hC0 : 0 < C) (hCΔ : C < Δ) :
    ∃ K : ℝ, 0 < K ∧ ∀ x y : Fin 3 → ℝ, K ≤ ‖x - y‖ → ‖f x y‖ ≤ Real.exp (-C * ‖x - y‖) := by
  sorry

end QuantumPhysicsLean.YangMillsMillenniumProblem
