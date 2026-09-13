# Source: the Clay Millennium Problem statement

A. Jaffe and E. Witten, "Quantum Yang-Mills Theory," Clay Mathematics
Institute Millennium Prize Problem description. See
[`docs/yang-mills-existence-and-mass-gap.md`](../../../docs/yang-mills-existence-and-mass-gap.md)
for the full converted text.

Most of this document is exposition and citation to other papers (already
represented by this project's other books, where applicable). The
self-contained mathematical content is:

1. **Wightman QFT axioms** (§3) — Hilbert space `H` carrying a positive-energy
   unitary representation of the Poincaré group, a vacuum vector `Ω` unique
   up to phase, local field operators, causal commutativity.
2. **Mass gap** (§4) — a QFT has mass gap `Δ` if the spectrum of the
   Hamiltonian `H` meets `(0,Δ)` nowhere, for some `Δ > 0`; the mass `m` is
   the supremum of such `Δ`, required finite.
3. **The mass operator** `M = √(H² − P⃗²) ≥ 0`, with `MΩ = 0` (§6.2).
4. **The Millennium Problem statement** (§4, boxed) — the actual conjecture:
   for any compact simple gauge group `G`, a non-trivial quantum Yang-Mills
   theory exists on `R⁴` and has a mass gap `Δ > 0`, with axiomatic
   properties at least as strong as [45, 35] (Wightman;
   Osterwalder-Schrader).
5. **Clustering from a mass gap** (§5, eq. 2) — the one self-contained,
   provable theorem in the document: if a QFT has mass gap `Δ`, then for any
   local operator `O(x⃗) = e^{−iP⃗·x⃗}Oe^{iP⃗·x⃗}` with `⟨Ω,OΩ⟩ = 0` and any
   `0 < C < Δ`, `|⟨Ω, O(x⃗)O(y⃗)Ω⟩| ≤ exp(−C|x⃗−y⃗|)` once `|x⃗−y⃗|` is large
   enough. This is a general fact about positive-energy representations of
   the Poincaré group with a spectral gap, independent of the Yang-Mills
   specifics.
6. **Gaussian reflection positivity criterion** (§6.2) — for the Gaussian
   measure with covariance `C`, reflection positivity is equivalent to
   positivity of the operator `ΘC`, restricted to `L²(R^d_+) ⊂ L²(R^d)`
   (`Θ : t ↦ −t` the time-reflection operator). This connects directly to
   [Glimm-Jaffe's covariance operators chapter](../glimm-jaffe.md); a future
   refinement of `blueprint/roadmap/glimm-jaffe/covariance-operators/`
   should absorb it rather than duplicating it here.
7. **Free field as a Gaussian measure** (§6.2) — the Gaussian measure `dμ`
   with mean zero and covariance `C = (−Δ+m₀²)⁻¹` is the free, mass-`m₀`
   field; definitional, also connects to the covariance-operators chapter.

Items 6-7 are cross-referenced rather than given their own chapter here, to
avoid duplicating the Glimm-Jaffe book's coverage. This book's chapters are
1-2-3 (setup), 4 (the conjecture itself, necessarily unproved by us), and 5
(the one genuinely provable theorem).
