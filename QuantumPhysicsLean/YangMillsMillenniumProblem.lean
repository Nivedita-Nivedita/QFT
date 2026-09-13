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
open scoped InnerProductSpace

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

/-- **The spectral condition** (positivity of the energy): `Ham` is
self-adjoint (so it is a genuine observable, and its kernel and range are
orthogonal complements) and its spectrum is real and non-negative. This is
part of the Wightman axiom system (Streater-Wightman, or W1's spectral
clause) and of Haag-Kastler's HK-picture axioms alike (Haag, *Local
Quantum Physics*, §II.5.1); it is strictly weaker than having a mass gap
-- a massless (but still positive-energy) theory satisfies it too. -/
def SatisfiesSpectralCondition (Ham : 𝓗 →L[ℂ] 𝓗) : Prop :=
  IsSelfAdjoint Ham ∧ ∀ z ∈ spectrum ℂ Ham, 0 ≤ z.re ∧ z.im = 0

/-- **The vacuum is orthogonal to the range of the Hamiltonian.** Since a
self-adjoint operator is normal, its kernel and range are orthogonal
complements (`IsStarNormal.orthogonal_range`); the vacuum lies in `ker Ham`
by definition (`IsVacuum`), so it is orthogonal to every vector of the form
`Ham w` -- no state obtained by acting with the Hamiltonian has any overlap
with the vacuum. This is a genuine (if elementary) structural consequence
of the spectral condition, not a restatement of it, and it holds regardless
of whether the theory has a mass gap. -/
theorem vacuum_orthogonal_range (Ham : 𝓗 →L[ℂ] 𝓗) (hspec : SatisfiesSpectralCondition Ham)
    (vac : 𝓗) (hvac : IsVacuum Ham vac) (w : 𝓗) :
    ⟪Ham w, vac⟫_ℂ = 0 := by
  have hnormal : IsStarNormal Ham := hspec.1.isStarNormal
  have hmem : vac ∈ Ham.rangeᗮ := by
    rw [ContinuousLinearMap.IsStarNormal.orthogonal_range hnormal]
    simpa using hvac.2
  exact (Submodule.mem_orthogonal _ _).mp hmem (Ham w) ⟨w, rfl⟩

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

/-!
## The algebraic (Haag-Kastler) picture

Everything above states the problem in the Wightman/Hilbert-space picture,
matching the boxed statement in Jaffe-Witten §4 directly. The Haag-Kastler
axioms (Glimm-Jaffe §6.1(ii), HK1-HK4; see `docs/axiom-systems-for-qft.md`)
give a genuinely different, algebra-first formulation of "a quantum field
theory," and restating existence-and-mass-gap in that language is a real
extension beyond what the source document itself writes down.
-/

variable {Region G Aalg : Type*} [Preorder Region] [Group G] [MulAction G Region]
  [CStarAlgebra Aalg]

/-- A **Haag-Kastler net** of local observable algebras: to each region, a
`*`-subalgebra of an ambient C*-algebra `Aalg` (HK1); the assignment is
monotone (HK2, isotony) and the algebras of spacelike-separated regions
commute (HK3, locality); a group `G` (standing for the Poincaré group)
acts on both regions and `Aalg` by `*`-automorphisms compatibly with the
net (HK4, covariance). -/
structure HaagKastlerNet (Region G Aalg : Type*) [Preorder Region] [Group G]
    [MulAction G Region] [CStarAlgebra Aalg] where
  /-- HK1: the local algebra of each region. -/
  alg : Region → StarSubalgebra ℂ Aalg
  /-- HK2 (Isotony). -/
  isotone : Monotone alg
  /-- The spacelike-separation relation on regions. -/
  spacelike : Region → Region → Prop
  /-- HK3 (Locality). -/
  locality : ∀ B₁ B₂, spacelike B₁ B₂ →
    ∀ a ∈ alg B₁, ∀ b ∈ alg B₂, a * b = b * a
  /-- The `*`-automorphism of `Aalg` implementing each group element. -/
  sigma : G → (Aalg ≃⋆ₐ[ℂ] Aalg)
  sigma_one : sigma 1 = StarAlgEquiv.refl ℂ Aalg
  sigma_mul : ∀ g h, sigma (g * h) = (sigma h).trans (sigma g)
  /-- HK4 (Covariance): `σ_g` carries the algebra of `B` onto that of `g • B`. -/
  covariant : ∀ (g : G) (B : Region) (a : Aalg), a ∈ (alg B : Set Aalg) ↔
    sigma g a ∈ (alg (g • B) : Set Aalg)

variable {timeMap : ℝ →* G}

/-- A **covariant representation** of a Haag-Kastler net on a Hilbert
space `𝓗`: a `*`-homomorphism of the ambient algebra into bounded
operators, unitaries implementing the group action, a vacuum vector, and a
Hamiltonian generating time translation among those unitaries via the
ordinary (bounded-operator) exponential series `NormedSpace.exp`. Unlike
`clustering_from_mass_gap`, this does not need Stone's theorem: `Ham` is
given data whose relationship to `unitaries ∘ timeMap` is asserted, not
derived from continuity of an abstract one-parameter group. -/
structure HaagKastlerNet.CovariantRep (net : HaagKastlerNet Region G Aalg)
    (timeMap : ℝ →* G) (𝓗 : Type*) [NormedAddCommGroup 𝓗] [InnerProductSpace ℂ 𝓗]
    [CompleteSpace 𝓗] where
  π : Aalg →⋆ₐ[ℂ] (𝓗 →L[ℂ] 𝓗)
  Ham : 𝓗 →L[ℂ] 𝓗
  vac : 𝓗
  vacuum : IsVacuum Ham vac
  unitaries : G → (𝓗 →L[ℂ] 𝓗)
  unitary_covariant : ∀ g a, π (net.sigma g a) = unitaries g * π a * star (unitaries g)
  time_generated : ∀ t : ℝ, unitaries (timeMap t) = NormedSpace.exp (((t : ℂ) * Complex.I) • Ham)

/-- A Haag-Kastler net **has a mass gap** `Δ` (for a chosen time-translation
subgroup `timeMap`) if it admits a covariant representation whose
Hamiltonian has a mass gap of `Δ` in the sense already defined for the
Wightman picture. -/
def HaagKastlerNet.HasMassGap (net : HaagKastlerNet Region G Aalg)
    (timeMap : ℝ →* G) (Δ : ℝ) : Prop :=
  ∃ (𝓗 : Type) (_ : NormedAddCommGroup 𝓗) (_ : InnerProductSpace ℂ 𝓗) (_ : CompleteSpace 𝓗)
    (rep : net.CovariantRep timeMap 𝓗), YangMillsMillenniumProblem.HasMassGap rep.Ham Δ

/-- A covariant representation **satisfies the spectral condition** if its
Hamiltonian does, in the sense already defined for the Wightman picture. -/
def HaagKastlerNet.CovariantRep.SatisfiesSpectralCondition
    (net : HaagKastlerNet Region G Aalg) (rep : net.CovariantRep timeMap 𝓗) : Prop :=
  YangMillsMillenniumProblem.SatisfiesSpectralCondition rep.Ham

/-- **The vacuum of a covariant representation is orthogonal to the range of
its Hamiltonian**, given the spectral condition: the Haag-Kastler-picture
instance of `vacuum_orthogonal_range` above. -/
theorem HaagKastlerNet.CovariantRep.vacuum_orthogonal_range
    (net : HaagKastlerNet Region G Aalg) (rep : net.CovariantRep timeMap 𝓗)
    (hspec : rep.SatisfiesSpectralCondition) (w : 𝓗) :
    ⟪rep.Ham w, rep.vac⟫_ℂ = 0 :=
  YangMillsMillenniumProblem.vacuum_orthogonal_range rep.Ham hspec rep.vac rep.vacuum w

/-- The vacuum **is cyclic** for the local algebra of region `B`: acting on
it with that algebra's representatives produces a dense subspace of `𝓗`.
This is one of the two standard vacuum-structure axioms in algebraic QFT
(Haag, *Local Quantum Physics*, §III.3); it is what the Reeh-Schlieder
theorem establishes for every non-empty open region in the concrete
Wightman setting, but it is recorded here only as a definition -- no proof
is attempted, since Reeh-Schlieder's actual argument (analytic continuation
of vacuum expectation values) is well beyond what this net-level
formalization currently has the tools to reach. -/
def HaagKastlerNet.CovariantRep.IsCyclicVacuumFor
    (net : HaagKastlerNet Region G Aalg) (rep : net.CovariantRep timeMap 𝓗) (B : Region) : Prop :=
  Dense ((Submodule.span ℂ ((fun a => rep.π a rep.vac) '' (net.alg B : Set Aalg))) : Set 𝓗)

/-- The vacuum **is separating** for the local algebra of region `B`: no
nonzero element of that algebra annihilates it. The second of the two
standard vacuum-structure axioms (Haag, *Local Quantum Physics*, §III.3),
recorded here as a definition for the same reason as `IsCyclicVacuumFor`. -/
def HaagKastlerNet.CovariantRep.IsSeparatingVacuumFor
    (net : HaagKastlerNet Region G Aalg) (rep : net.CovariantRep timeMap 𝓗) (B : Region) : Prop :=
  ∀ a ∈ net.alg B, rep.π a rep.vac = 0 → a = 0

/-- **The Yang-Mills Existence and Mass Gap problem, in the Haag-Kastler
picture**: the algebraic counterpart of `yang_mills_existence_and_mass_gap`
above. Necessarily `sorry`, for the same reason: this is the open
Millennium Problem restated, not a proof attempt. -/
theorem yang_mills_existence_and_mass_gap_AQFT (G : Type*) [Group G] :
    ∃ (Region Aalg : Type) (_ : Preorder Region) (_ : CStarAlgebra Aalg)
      (_ : MulAction G Region) (net : HaagKastlerNet Region G Aalg)
      (timeMap : ℝ →* G) (Δ : ℝ), net.HasMassGap timeMap Δ := by
  sorry

end QuantumPhysicsLean.YangMillsMillenniumProblem
