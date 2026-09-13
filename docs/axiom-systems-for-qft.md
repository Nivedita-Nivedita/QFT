# Axiom systems for quantum field theory: a comparison

Five ways of pinning down what "a quantum field theory" is, as they bear on
this repository's books. Where a system is presented directly in one of
our sources, the axioms below are transcribed from there (with page
references) rather than paraphrased from memory; Segal's axioms are given
per the standard secondary literature, since [the original 1988
paper](https://ncatlab.org/nlab/files/SegalDefinitionCFT.pdf) is only
available to this project as an unOCR'd scan.

## Quick comparison

| | Setting | Basic data | "Vacuum" is... | Where in this repo |
| --- | --- | --- | --- | --- |
| **Wightman** | Minkowski space `R^{1,d-1}` | Operator-valued distributions on a Hilbert space | A distinguished, Poincaré-invariant vector `Ω` | Target axiom set for [Yang-Mills problem](../blueprint/roadmap/yang-mills-millennium-problem/README.md), book 5 |
| **Osterwalder-Schrader (OS)** | Euclidean space `R^d` | A probability measure `dμ` on field configurations `𝓓'(R^d)` | Implicit: uniqueness is a *separate*, optional axiom (OS4/ergodicity) | Underlies [Glimm-Jaffe](../blueprint/roadmap/glimm-jaffe/README.md)'s whole construction, book 1 |
| **Glimm-Jaffe** | Euclidean space `R^d` | Same as OS, with one added axiom | Forced unique by the added axiom (OS4) | [Glimm-Jaffe](../blueprint/roadmap/glimm-jaffe/README.md) Ch. 6.1(i), book 1 |
| **Haag-Kastler (algebraic QFT)** | Minkowski space `R^{1,d-1}` | A net of C*-algebras indexed by bounded regions | Not part of the axioms themselves (a state on the algebra) | Not yet targeted by any book here |
| **Segal** | A category of cobordisms (surfaces, not a fixed background) | A functor to Hilbert spaces | The image of a distinguished cobordism (e.g. the disk) | Target axiom set for [Liouville theory](../blueprint/roadmap/liouville-theory/segals-axioms/README.md), book 2 |

The first four describe a field theory *on a fixed spacetime*; Segal's
describes one *functorially*, assigning data to any surface built from
gluing pieces — a genuinely different kind of axiomatization, suited to
conformal/topological field theory rather than a theory living on one
fixed `R^{1,d-1}` or `R^d`.

## Wightman axioms

Source: A. Wightman (via Streater-Wightman, *PCT, Spin, Statistics and All
That*); stated here as Glimm-Jaffe present them (*Quantum Physics*, 2nd
ed., §6.1(ii), pp. 97-98, axioms **W1-W4**), for the field `φ_M`
reconstructed from a Euclidean field by analytic continuation `t → -it`.

- **W1 (Covariance).** A continuous unitary representation `g ↦ U(g)` of
  the inhomogeneous Lorentz group on the Hilbert space `H`. The generators
  `(H,P⃗)` of the translation subgroup have spectrum in the forward cone
  `p₀² - p⃗² ≥ 0`, `p₀ ≥ 0` (the **spectrum condition** / positive energy).
  A vector `Ω ∈ H` (the vacuum) is invariant under all `U(g)`.
- **W2 (Observables).** Field operators `{φ_M(f) : f ∈ 𝓢(R^d)}` densely
  defined on `H`; `Ω` lies in the domain of any polynomial in the
  `φ_M(f)`'s; the vectors `φ_M(f₁)⋯φ_M(fₙ)Ω` span a dense subspace `𝓓`;
  `φ_M(f)` is covariant, `U(g)*φ_M(f)U(g) = φ_M(f_g)`, and linear in `f`.
- **W3 (Locality).** If `f` and `h` have spacelike-separated supports,
  `φ_M(f)φ_M(h) = φ_M(h)φ_M(f)` on `𝓓`.
- **W4.** `Ω` is the unique vector (up to scalar multiples) in `H`
  invariant under time translations.

The **Wightman functions** `Wₙ = ⟨Ω, φ_M(x₁)⋯φ_M(xₙ)Ω⟩` uniquely determine
the field operators (the **Wightman reconstruction theorem**), so the
axioms can equivalently be stated as growth/analyticity/positivity
properties of the `Wₙ` alone.

## Osterwalder-Schrader (OS) axioms

Source: Osterwalder-Schrader (1973, 1975); stated here as Glimm-Jaffe
present them (§6.1(i), pp. 91-92, axioms **OS0-OS3** — Glimm-Jaffe's own
**OS4** is a genuine addition, kept separate below). These are properties
of the generating functional `S{f} = ∫ e^{iφ(f)} dμ`, the inverse Fourier
transform of a Euclidean-invariant probability measure `dμ` on `𝓓'(R^d)`.

- **OS0 (Analyticity).** `S{f}` is entire analytic in finite linear
  combinations of test functions with complex coefficients (`dμ` decays
  faster than any exponential).
- **OS1 (Regularity).** `|S{f}| ≤ exp(c(‖f‖_{L¹} + ‖f‖_{L^p}^p))` for some
  `1 ≤ p ≤ 2` and constant `c`.
- **OS2 (Euclidean invariance).** `S{f} = S{Ef}` for every Euclidean
  symmetry `E` (translations, rotations, reflections) of `R^d`.
- **OS3 (Reflection positivity).** For `𝒜₊` the algebra of exponentials of
  fields supported in the half-space `t > 0`, and `θ` the time-reflection
  `(x⃗,t) ↦ (x⃗,-t)`: `0 ≤ ⟨θA, A⟩ = ∫ (θA)‾ A dμ` for all `A ∈ 𝒜₊`.

Reflection positivity is the technical heart of the Euclidean approach: it
is exactly what lets one build the physical (Minkowski) Hilbert space `H`
as a completion of `𝒜₊` modulo the null vectors of this inner product —
[**Glimm-Jaffe Proposition 6.1.1**](../blueprint/roadmap/glimm-jaffe/covariance-operators/README.md).

## Glimm-Jaffe axioms

Source: Glimm-Jaffe, *Quantum Physics*, §6.1(i), p. 92, axiom **OS4**,
introduced as "slightly stronger" than the axioms of Osterwalder and
Schrader's original papers.

**Glimm-Jaffe's axioms are OS0-OS3 above, plus:**

- **OS4 (Ergodicity).** The time-translation subgroup `T(t)` acts
  ergodically on the measure space `(𝓓'(R^d), dμ)`:
  `lim_{t→∞} (1/t) ∫₀^t T(s)A(φ)T(s)⁻¹ ds = ∫ A(φ) dμ(φ)` for all
  `A ∈ L¹(dμ)`.

Glimm-Jaffe are explicit about why this extra axiom earns its own name:
**Theorem 6.1.5** states that a measure satisfying OS0-3 always yields a
real-time field satisfying Wightman's W1-3, but **OS4 holds if and only if
W4 does** — i.e. reflection positivity alone does not force a unique
vacuum; ergodicity is exactly the extra ingredient that does. Many
standard constructions (e.g. below a phase transition) satisfy OS0-3 but
not OS4; Glimm-Jaffe give a general decomposition of such a measure into
"pure phase" components, each of which does satisfy the full OS0-4 (and
hence W1-4).

## Haag-Kastler (algebraic QFT) axioms

Source: Haag-Kastler; stated here as Glimm-Jaffe present them (§6.1(ii),
p. 99, axioms **HK1-HK4**), a framework focused on the algebra of
observables rather than on a specific Hilbert space or field operators.

- **HK1.** To each bounded open region `B` of space-time, an associated
  C*-algebra `𝔄(B)` containing the identity; the global algebra
  `⋃_B 𝔄(B)` has a faithful, irreducible representation.
- **HK2 (Isotony).** `B₁ ⊂ B₂ ⟹ 𝔄(B₁) ⊂ 𝔄(B₂)`.
- **HK3 (Locality).** `B₁, B₂` spacelike separated `⟹ 𝔄(B₁)` and `𝔄(B₂)`
  commute.
- **HK4 (Lorentz covariance).** A `*`-automorphism `σ_{(a,Λ)}` of the
  global algebra for each Poincaré transformation `(a,Λ)`, with
  `σ_{(a,Λ)}(𝔄(B)) = 𝔄({a,Λ}B)`, and `(a,Λ) ↦ σ_{(a,Λ)}` a representation
  of the Poincaré group.

This is a genuinely different emphasis from Wightman/OS: there is no fixed
Hilbert space or vacuum vector in the axioms themselves (a physical state
is added afterward, e.g. via the GNS construction), which makes this
framework well suited to questions — superselection sectors, charge
operators — that do not depend on which particular representation of the
algebra one works in.

## Segal axioms

Source: G. Segal, "The Definition of Conformal Field Theory" (1988,
widely circulated preprint; see also
[the nLab page](https://ncatlab.org/nlab/show/conformal+cobordism+category)
for a modern restatement). Given here per the standard secondary
literature rather than transcribed from the (unOCR'd, scanned) original.

A (2D) conformal field theory is a symmetric monoidal functor `Z` from a
category of **conformal cobordisms** to the category of Hilbert spaces:

- To each compact oriented 1-manifold `Σ` (a disjoint union of
  parametrized circles), `Z` assigns a Hilbert space `Z(Σ)`, with
  `Z(∅) = C` and `Z(Σ₁ ⊔ Σ₂) = Z(Σ₁) ⊗ Z(Σ₂)`.
- To each **conformal cobordism** — a Riemann surface `M` with boundary
  parametrized and split into incoming and outgoing circles — `Z` assigns
  a (typically trace-class) linear map `Z(M) : Z(∂_in M) → Z(∂_out M)`.
- **Gluing/composition.** Gluing two cobordisms along a shared boundary
  circle corresponds to composing the associated linear maps.
- **Positivity.** Reversing the orientation of `M` corresponds to taking
  the Hermitian adjoint of `Z(M)`; this is what makes `Z` unitary rather
  than merely a formal assignment.
- **Holomorphic dependence.** `Z(M)` varies holomorphically as the complex
  structure of `M` varies over its moduli.
- The disk maps to a distinguished vector in `Z(S¹)` — the **vacuum**.

Unlike Wightman/OS/Haag-Kastler, there is no fixed ambient spacetime here
at all: the "spacetime" is built up by gluing, so the same formalism
applies to a sphere, a torus, or a higher-genus surface without change.
This is exactly the framework [**book 2**](../blueprint/roadmap/liouville-theory/segals-axioms/README.md)'s
target paper (Guillarmou-Kupiainen-Rhodes-Vargas, "Segal's Axioms and
Bootstrap for Liouville Theory") implements probabilistically for
Liouville CFT.

## How they relate

- **OS ⟹ Wightman** via the **Osterwalder-Schrader reconstruction
  theorem**: OS0-3 gives W1-3 automatically (Glimm-Jaffe Theorem 6.1.5);
  the extra ergodicity axiom (Glimm-Jaffe's OS4) is needed and sufficient
  for the extra uniqueness axiom (W4). This is why constructive QFT
  (book 1's whole approach) works Euclidean-first: proving OS0-4 for a
  measure is usually far more tractable than verifying the Wightman axioms
  directly on Minkowski space.
- **Wightman fields generate a Haag-Kastler net**: taking `𝔄(B)` to be
  (the von Neumann algebra generated by) field operators smeared with test
  functions supported in `B` turns a Wightman theory into an algebraic
  one, though the converse (recovering fields from the net) is more
  subtle.
- **Segal's axioms are not a reformulation of the other four** so much as
  a different question, adapted to theories (like 2D CFT) whose symmetry
  is conformal rather than Poincaré, and whose natural home is a moduli
  space of surfaces rather than one fixed `R^d`. Comparing it to Wightman
  directly only makes sense in the special case where the surfaces
  involved reduce to cylinders (`= R × S¹`), recovering something close to
  the Hamiltonian/Wightman picture on a circle.
