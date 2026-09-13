# Sources: rigorous Liouville theory

The probabilistic construction of Liouville conformal field theory (LCFT),
culminating in Segal's axioms and the conformal bootstrap. Four research
papers by David, Guillarmou, Kupiainen, Rhodes, and Vargas (in varying
combinations), plus a pedagogical survey.

## [1] Liouville Quantum Gravity on the Riemann Sphere

F. David, A. Kupiainen, R. Rhodes, V. Vargas. Commun. Math. Phys. 342 (2016)
869-907. arXiv:[1410.7318](https://arxiv.org/abs/1410.7318).

Rigorous construction of 2D Liouville quantum field theory on the Riemann
sphere via Gaussian multiplicative chaos (GMC), building on Polyakov's 1981
path-integral proposal. Establishes conformal covariance under the
`PSL(2,C)` action, the Seiberg bounds, KPZ scaling, the KPZ formula, and the
Weyl anomaly formula.

## [2] Integrability of Liouville Theory: Proof of the DOZZ Formula

A. Kupiainen, R. Rhodes, V. Vargas. Ann. Math. 191 (2020) 81.
arXiv:[1707.08785](https://arxiv.org/abs/1707.08785).

Proves the DOZZ (Dorn-Otto-Zamolodchikov-Zamolodchikov) formula: an explicit
closed form for the three-point structure constants of Liouville CFT. The
first rigorous integrability result for GMC measures from a purely
probabilistic viewpoint.

## [3] Conformal Bootstrap in Liouville Theory

C. Guillarmou, A. Kupiainen, R. Rhodes, V. Vargas. arXiv:[2005.11530](https://arxiv.org/abs/2005.11530).

First mathematical proof of the conformal bootstrap hypothesis for Liouville
theory: correlation functions are reconstructed from Virasoro conformal
blocks and the DOZZ structure constants. Constructs Virasoro highest-weight
modules via spectral analysis of a self-adjoint operator; holds for the full
parameter range `γ ∈ (0,2)`.

## [4] Segal's Axioms and Bootstrap for Liouville Theory

C. Guillarmou, A. Kupiainen, R. Rhodes, V. Vargas. arXiv:[2112.14859](https://arxiv.org/abs/2112.14859).

The target result: a probabilistic implementation of Segal's 1987 functorial
axioms for CFT, within Liouville theory. Expresses LCFT correlation
functions as multiple integrals, over the theory's spectrum, of Virasoro
conformal blocks weighted by an integration measure built from the DOZZ
structure constants.

## [5] Liouville Theory: An Introduction to Rigorous Approaches (survey)

S. Chatterjee, E. Witten. arXiv:[2404.02001](https://arxiv.org/abs/2404.02001).
Local copy: `~/Projects/autoform/liouville-papers/chatterjee-witten-survey.pdf`.

A gentler, physicist-oriented introduction to the GMC-based construction
behind papers [1]-[2], used here to scope the earliest roadmap milestones.
Section structure (42 pages):

- **1. Introduction** (p. 1) — the Liouville action, positivity of the
  normal-ordered exponential interaction, and why this makes a probabilistic
  approach possible.
- **2. Liouville Theory Correlators: Overview** (p. 6)
  - 2.1 The Gaussian Free Field (6)
  - 2.2 Preliminary Steps (7)
  - 2.3 Normal Ordered Interaction (10)
  - 2.4 Martingales (12)
  - 2.5 L² Convergence for `b < 1/√2` (16)
  - 2.6 Where Things Break Down (18)
  - 2.7 Comparison to the DOZZ Formula (23)
- **3. Liouville Theory Correlators: Detailed Arguments** (p. 24)
  - 3.1 Near Scale Invariance (25)
  - 3.2 Kahane's Inequality (26)
  - 3.3 Triviality For `b > 1` (28)
  - 3.4 Moments (29)
  - 3.5 Convergent Integrals of Singular Functions (31)
  - 3.6 Divergent Integrals of Singular Functions (35)
  - 3.7 Construction of Liouville Measure for all `b < 1` (36)

## Prerequisite chain (not yet scoped in detail)

The survey's Sections 2-3 give the foundational construction (Gaussian free
field, normal-ordered exponential, Gaussian multiplicative chaos via
Kahane's inequality, the Liouville measure itself) that paper [1] uses to
define correlation functions on the sphere. Paper [2] then proves the DOZZ
formula for the resulting three-point function; papers [3]-[4] build the
full conformal bootstrap and Segal's axioms on top of that integrability
result. None of papers [1]-[4] have been read in the same page-by-page
detail as the survey yet; the roadmap's later milestones are citations only,
pending that pass.
