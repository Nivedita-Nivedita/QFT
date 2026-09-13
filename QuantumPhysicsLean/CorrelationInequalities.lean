/-
Copyright (c) 2026 Nivedita Vij. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Nivedita Vij
-/
import Mathlib

/-!
# Correlation inequalities and the Lee-Yang theorem

Formalization scaffolding for Glimm-Jaffe, *Quantum Physics: A Functional
Integral Point of View*, Chapter 4 (pp. 56-72). See
`blueprint/roadmap/correlation-inequalities/` for the source-grounded
statement of each result; the declarations here are statement-only
(`sorry`-proved) placeholders for that roadmap.
-/

namespace QuantumPhysicsLean.CorrelationInequalities

open MeasureTheory Finset

variable {ι : Type*} [Fintype ι]

/-- A monomial exponent `A`, i.e. `ξ^A := ∏ i, ξ i ^ A i`: Glimm-Jaffe (4.1.2). -/
abbrev Monomial (ι : Type*) := ι →₀ ℕ

/-- `ξ ^ A` for a monomial exponent `A`, Glimm-Jaffe (4.1.2). -/
noncomputable def spinPow (ξ : ι → ℝ) (A : Monomial ι) : ℝ :=
  ∏ i, ξ i ^ A i

/-- A ferromagnetic polynomial Hamiltonian `H(ξ) = -∑_A J_A ξ^A` with all
couplings `J_A ≥ 0`: Glimm-Jaffe (4.1.3). -/
structure FerromagneticHamiltonian (ι : Type*) [Fintype ι] where
  /-- The couplings `J_A`, as a finitely supported function of the monomial. -/
  coupling : Monomial ι →₀ ℝ
  /-- The ferromagnetic condition `0 ≤ J_A`. -/
  nonneg : ∀ A, 0 ≤ coupling A

/-- The Hamiltonian `H(ξ)`, Glimm-Jaffe (4.1.3). -/
noncomputable def FerromagneticHamiltonian.eval (H : FerromagneticHamiltonian ι) (ξ : ι → ℝ) :
    ℝ :=
  - H.coupling.sum fun A c => c * spinPow ξ A

variable (μ : ι → Measure ℝ)

/-- The partition function `Z`, Glimm-Jaffe (4.1.5). -/
noncomputable def partitionFunction (H : FerromagneticHamiltonian ι) : ℝ :=
  ∫ ξ : (ι → ℝ), Real.exp (- H.eval ξ) ∂(Measure.pi μ)

/-- The expectation `⟨F⟩`, Glimm-Jaffe (4.1.6). -/
noncomputable def expectation (H : FerromagneticHamiltonian ι) (F : (ι → ℝ) → ℝ) : ℝ :=
  (partitionFunction μ H)⁻¹ * ∫ ξ : (ι → ℝ), F ξ * Real.exp (- H.eval ξ) ∂(Measure.pi μ)

/-- The duplicate-variable expectation on two independent copies of the
lattice, Glimm-Jaffe (4.1.7)-(4.1.8). -/
noncomputable def duplicateExpectation (H : FerromagneticHamiltonian ι)
    (F : (ι → ℝ) → (ι → ℝ) → ℝ) : ℝ :=
  (partitionFunction μ H ^ 2)⁻¹ *
    ∫ ξ : (ι → ℝ), ∫ χ : (ι → ℝ), F ξ χ * Real.exp (- H.eval ξ - H.eval χ)
      ∂(Measure.pi μ) ∂(Measure.pi μ)

/-- Each single-spin measure `μ i` is symmetric under `x ↦ -x`: the hypothesis
used in the first Griffiths inequality (Glimm-Jaffe Theorem 4.1.1). -/
def SymmetricSpinMeasure (μ : ι → Measure ℝ) : Prop :=
  ∀ i, Measure.map (fun x => -x) (μ i) = μ i

/-- **First Griffiths inequality.** Glimm-Jaffe Theorem 4.1.1, p. 58. -/
theorem first_griffiths_inequality (H : FerromagneticHamiltonian ι)
    (hsymm : SymmetricSpinMeasure μ) (A : Monomial ι) :
    0 ≤ expectation μ H (fun ξ => spinPow ξ A) := by
  sorry

/-- **Second Griffiths inequality.** Glimm-Jaffe Theorem 4.1.3 (via Lemma
4.1.2), p. 58-59. -/
theorem second_griffiths_inequality (H : FerromagneticHamiltonian ι)
    (hsymm : SymmetricSpinMeasure μ) (A B : Monomial ι) :
    0 ≤ expectation μ H (fun ξ => spinPow ξ A * spinPow ξ B) -
      expectation μ H (fun ξ => spinPow ξ A) * expectation μ H (fun ξ => spinPow ξ B) := by
  sorry

/-- The Ising model: each spin takes values `±1`, i.e. each single-spin
measure is `(δ_{-1} + δ_1) / 2`. Glimm-Jaffe p. 60. -/
def IsIsingMeasure (μ : ι → Measure ℝ) : Prop :=
  ∀ i, μ i = (2⁻¹ : ENNReal) • Measure.dirac (-1 : ℝ) + (2⁻¹ : ENNReal) • Measure.dirac (1 : ℝ)

/-- **Monotonicity and the infinite-volume limit.** Correlation functions of
a ferromagnetic Hamiltonian are monotone increasing in each coupling, and for
the Ising model are bounded by `1` and converge as the volume grows.
Glimm-Jaffe Propositions 4.2.1-4.2.2 and Theorem 4.2.3, p. 59-60.

This is stated here for the couplings-monotonicity half only; the
infinite-volume limit itself needs a family of Hamiltonians indexed by an
increasing sequence of finite volumes, which is deferred to a later
refinement of this node. -/
theorem griffiths_monotone_in_coupling (H : FerromagneticHamiltonian ι)
    (hsymm : SymmetricSpinMeasure μ) (A B : Monomial ι) (hB : H.coupling B ≠ 0 → True) :
    0 ≤ expectation μ H (fun ξ => spinPow ξ B * spinPow ξ A) -
      expectation μ H (fun ξ => spinPow ξ A) * expectation μ H (fun ξ => spinPow ξ B) := by
  sorry

/-- **Ising model correlations are bounded by 1.** Glimm-Jaffe Proposition
4.2.2, p. 59. -/
theorem ising_correlation_le_one (H : FerromagneticHamiltonian ι)
    (hIsing : IsIsingMeasure μ) (A : Monomial ι) :
    |expectation μ H (fun ξ => spinPow ξ A)| ≤ 1 := by
  classical
  -- Each single-spin measure is a genuine probability measure.
  haveI hprob : ∀ i, IsProbabilityMeasure (μ i) := by
    intro i
    rw [hIsing i]
    refine ⟨?_⟩
    simp [Measure.add_apply, Measure.smul_apply, Measure.dirac_apply']
    exact ENNReal.inv_two_add_inv_two
  haveI : IsProbabilityMeasure (Measure.pi μ) := inferInstance
  -- Each coordinate is `±1` almost everywhere.
  have hcoord : ∀ i, ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ), ξ i = -1 ∨ ξ i = 1 := by
    intro i
    have hae : ∀ᵐ y : ℝ ∂(μ i), y = -1 ∨ y = 1 := by
      rw [hIsing i]
      have : ((2⁻¹ : ENNReal) • Measure.dirac (-1 : ℝ) +
          (2⁻¹ : ENNReal) • Measure.dirac (1 : ℝ)) {y : ℝ | y = -1 ∨ y = 1}ᶜ = 0 := by
        simp [Measure.add_apply, Measure.smul_apply, Measure.dirac_apply']
      simpa [ae_iff] using this
    exact (MeasureTheory.measurePreserving_eval μ i).quasiMeasurePreserving.tendsto_ae hae
  have hall : ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ), ∀ i, ξ i = -1 ∨ ξ i = 1 :=
    (Filter.eventually_all).2 hcoord
  have hspin_le : ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ), ∀ B : Monomial ι, |spinPow ξ B| ≤ 1 := by
    filter_upwards [hall] with ξ hξ B
    have : ∀ i ∈ Finset.univ, |ξ i ^ B i| = 1 := by
      intro i _
      rcases hξ i with h | h <;> simp [h, abs_pow]
    calc |spinPow ξ B| = |∏ i, ξ i ^ B i| := rfl
      _ = ∏ i, |ξ i ^ B i| := by rw [Finset.abs_prod]
      _ = ∏ _i ∈ Finset.univ, (1 : ℝ) := Finset.prod_congr rfl this
      _ = 1 := by simp
      _ ≤ 1 := le_refl 1
  have hbound : ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ), |spinPow ξ A| ≤ 1 :=
    hspin_le.mono fun ξ h => h A
  -- `H.eval` is uniformly bounded on the Ising support.
  set C : ℝ := ∑ B ∈ H.coupling.support, |H.coupling B| with hCdef
  have hHeval : ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ), |H.eval ξ| ≤ C := by
    filter_upwards [hspin_le] with ξ hξ
    have heq : H.eval ξ = -(∑ B ∈ H.coupling.support, H.coupling B * spinPow ξ B) := by
      simp [FerromagneticHamiltonian.eval, Finsupp.sum]
    rw [heq, abs_neg]
    calc |∑ B ∈ H.coupling.support, H.coupling B * spinPow ξ B|
        ≤ ∑ B ∈ H.coupling.support, |H.coupling B * spinPow ξ B| :=
          Finset.abs_sum_le_sum_abs _ _
      _ = ∑ B ∈ H.coupling.support, |H.coupling B| * |spinPow ξ B| := by
            simp [abs_mul]
      _ ≤ ∑ B ∈ H.coupling.support, |H.coupling B| * 1 := by
            refine Finset.sum_le_sum fun B _ => ?_
            exact mul_le_mul_of_nonneg_left (hξ B) (abs_nonneg _)
      _ = C := by simp [hCdef]
  -- `H.eval`, and hence the Gibbs density, are continuous in `ξ`.
  have hcont_eval : Continuous (fun ξ : (ι → ℝ) => H.eval ξ) := by
    have : (fun ξ : (ι → ℝ) => H.eval ξ) =
        fun ξ => -(∑ B ∈ H.coupling.support, H.coupling B * spinPow ξ B) := by
      funext ξ; simp [FerromagneticHamiltonian.eval, Finsupp.sum]
    rw [this]
    simp only [spinPow]
    fun_prop
  have hcont_gibbs : Continuous (fun ξ : (ι → ℝ) => Real.exp (- H.eval ξ)) := by
    exact Real.continuous_exp.comp hcont_eval.neg
  have hae_gibbs : AEStronglyMeasurable (fun ξ : (ι → ℝ) => Real.exp (- H.eval ξ))
      (Measure.pi μ) := hcont_gibbs.aestronglyMeasurable
  have hgibbs_bound : ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ),
      ‖Real.exp (- H.eval ξ)‖ ≤ Real.exp C := by
    filter_upwards [hHeval] with ξ hξ
    rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    have h1 : -C ≤ H.eval ξ := (abs_le.1 hξ).1
    exact Real.exp_le_exp.2 (by linarith)
  have hZ_integrable : Integrable (fun ξ : (ι → ℝ) => Real.exp (- H.eval ξ)) (Measure.pi μ) :=
    Integrable.mono' (integrable_const (Real.exp C)) hae_gibbs hgibbs_bound
  have hsupp : Function.support (fun ξ : (ι → ℝ) => Real.exp (- H.eval ξ)) = Set.univ := by
    ext ξ; simp [Function.mem_support, (Real.exp_pos (- H.eval ξ)).ne']
  have hZpos : 0 < partitionFunction μ H := by
    rw [partitionFunction,
      integral_pos_iff_support_of_nonneg (fun ξ => (Real.exp_pos _).le) hZ_integrable, hsupp]
    simpa using measure_ne_zero_iff.2 (Set.univ_nonempty) |>.bot_lt
  -- Assemble the bound: `|⟨spinPow · A⟩| = Z⁻¹ |I| ≤ 1` since `|I| ≤ Z`.
  rw [expectation, abs_mul, abs_inv, abs_of_pos hZpos]
  rw [inv_mul_le_iff₀ hZpos, mul_one]
  have hnum_le : ∀ᵐ ξ : (ι → ℝ) ∂(Measure.pi μ),
      ‖spinPow ξ A * Real.exp (- H.eval ξ)‖ ≤ Real.exp (- H.eval ξ) := by
    filter_upwards [hbound] with ξ hξ
    rw [norm_mul, Real.norm_eq_abs (Real.exp _), abs_of_pos (Real.exp_pos _)]
    calc |spinPow ξ A| * Real.exp (- H.eval ξ) ≤ 1 * Real.exp (- H.eval ξ) :=
          mul_le_mul_of_nonneg_right hξ (Real.exp_pos _).le
      _ = Real.exp (- H.eval ξ) := one_mul _
  calc |∫ ξ : (ι → ℝ), spinPow ξ A * Real.exp (- H.eval ξ) ∂(Measure.pi μ)|
      ≤ ∫ ξ : (ι → ℝ), Real.exp (- H.eval ξ) ∂(Measure.pi μ) :=
        norm_integral_le_of_norm_le hZ_integrable hnum_le
    _ = partitionFunction μ H := rfl

/-- A quartic single-spin measure `dμ_i = e^{-P_i(ξ_i)} dξ_i` with
`P_i(x) = λ_i x^4 + σ_i x^2`, `0 < λ_i`, Glimm-Jaffe (4.3.1). -/
structure QuarticSpinMeasure (ι : Type*) [Fintype ι] where
  /-- The quartic coefficient `λ_i`. -/
  lam : ι → ℝ
  /-- The quadratic coefficient `σ_i`. -/
  sigma : ι → ℝ
  /-- `λ_i > 0`. -/
  lam_pos : ∀ i, 0 < lam i

/-- The measure associated to a `QuarticSpinMeasure`, Glimm-Jaffe (4.3.1). -/
noncomputable def QuarticSpinMeasure.toMeasure (P : QuarticSpinMeasure ι) : ι → Measure ℝ :=
  fun i => Measure.map (fun x => x) ((volume : Measure ℝ).withDensity
    (fun x => ENNReal.ofReal (Real.exp (- (P.lam i * x ^ 4 + P.sigma i * x ^ 2)))))

/-- **The Lebowitz inequality**, a twofold specialization of the fourfold
`ξ⁴` inequality. Glimm-Jaffe Theorem 4.3.1 and Corollary 4.3.2, p. 60-62. -/
theorem lebowitz_inequality (P : QuarticSpinMeasure ι)
    (H : FerromagneticHamiltonian ι) (A B : Monomial ι) :
    0 ≤ expectation (P.toMeasure) H (fun ξ => spinPow ξ A * spinPow ξ B) -
      expectation (P.toMeasure) H (fun ξ => spinPow ξ A) *
        expectation (P.toMeasure) H (fun ξ => spinPow ξ B) := by
  sorry

/-- **Triple correlation bound**, used later for the critical exponent
estimates of Chapter 17. Glimm-Jaffe Corollary 4.3.4, p. 63. -/
theorem triple_correlation_nonpos (P : QuarticSpinMeasure ι)
    (H : FerromagneticHamiltonian ι) (i j k : ι) :
    expectation (P.toMeasure) H (fun ξ => ξ i * ξ j * ξ k) -
        expectation (P.toMeasure) H (fun ξ => ξ i) *
          expectation (P.toMeasure) H (fun ξ => ξ j * ξ k) -
        expectation (P.toMeasure) H (fun ξ => ξ j) *
          expectation (P.toMeasure) H (fun ξ => ξ i * ξ k) -
        expectation (P.toMeasure) H (fun ξ => ξ k) *
          expectation (P.toMeasure) H (fun ξ => ξ i * ξ j) +
        2 * expectation (P.toMeasure) H (fun ξ => ξ i) *
          expectation (P.toMeasure) H (fun ξ => ξ j) *
          expectation (P.toMeasure) H (fun ξ => ξ k)
      ≤ 0 := by
  sorry

/-- A function `F : (ι → ℝ) → ℝ` is monotone with respect to the coordinate
order on `ι → ℝ`: the hypothesis of the FKG inequality, Glimm-Jaffe p. 64. -/
def CoordinateMonotone (F : (ι → ℝ) → ℝ) : Prop :=
  Monotone F

/-- **The FKG inequality.** Glimm-Jaffe Theorem 4.4.1, p. 65. The finite,
discrete-lattice form of this inequality is already in Mathlib as
`Finset.fkg` (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean`), derived
from the Ahlswede-Daykin four functions theorem; bridging it to this
continuous-measure setting is the remaining proof obligation here. -/
theorem fkg_inequality (H : FerromagneticHamiltonian ι) (F G : (ι → ℝ) → ℝ)
    (hF : CoordinateMonotone F) (hG : CoordinateMonotone G) :
    expectation μ H F * expectation μ H G ≤ expectation μ H (fun ξ => F ξ * G ξ) := by
  sorry

/-- **The Lee-Yang theorem.** For a quartic ferromagnetic Hamiltonian with an
external field `h`, the partition function has no zero away from the
imaginary axis: Glimm-Jaffe Theorem 4.5.1', p. 66-67. The external field is
modeled here as an extra linear coupling added to `H`, and non-vanishing is
stated for the complexified partition function evaluated at a field with
`|Im h| ≤ Re h` pointwise. -/
theorem lee_yang_theorem (P : QuarticSpinMeasure ι) (J : ι → ι → ℝ)
    (hJ : ∀ i j, 0 ≤ J i j) (h : ι → ℂ) (hh : ∀ i, |(h i).im| ≤ (h i).re) :
    ∃ Z : ℂ, Z ≠ 0 ∧
      Z = ∫ ξ : (ι → ℝ), Complex.exp
        (∑ i, ∑ j, (J i j : ℂ) * ξ i * ξ j + ∑ i, h i * ξ i -
          ∑ i, ((P.lam i : ℂ) * (ξ i : ℂ) ^ 4 + (P.sigma i : ℂ) * (ξ i : ℂ) ^ 2))
        ∂(Measure.pi P.toMeasure) := by
  sorry

-- Analyticity of the free energy (Glimm-Jaffe Proposition 4.6.1, Theorem
-- 4.6.2, p. 69-70) and the two-component spin inequalities (Theorem 4.7.1,
-- Corollary 4.7.2, p. 71-72) are not yet formalized here. The former needs a
-- sequence of finite-volume Hamiltonians and their infinite-volume limit
-- (see `griffiths_monotone_in_coupling` above); the latter needs the
-- `expectation`/`partitionFunction` framework generalized from `ι → ℝ` to a
-- vector-valued spin space. See the corresponding roadmap articles.

end QuantumPhysicsLean.CorrelationInequalities
