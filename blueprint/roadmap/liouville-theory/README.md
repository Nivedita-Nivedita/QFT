# Liouville theory roadmap

Formalizing the probabilistic construction of Liouville conformal field
theory (LCFT), targeting Segal's axioms and the conformal bootstrap: David,
Guillarmou, Kupiainen, Rhodes, and Vargas's papers [1]-[4], read through the
Chatterjee-Witten survey [5]. See
[sources/liouville/README.md](../../sources/liouville/README.md) for exact
citations and section ranges.

This is a coarse milestone plan scoped from the survey only; papers [1]-[4]
have not yet been read in the same detail, so their milestones are citations
pending a closer pass. Nothing here is decomposed into pull-request-sized
statements yet.

## Chapters

1. [The Gaussian free field and normal-ordered exponential](gaussian-free-field/README.md)
   — the underlying free field and its (multiplicative) renormalized
   exponential interaction.
2. [Gaussian multiplicative chaos](gaussian-multiplicative-chaos/README.md) —
   Kahane's inequality and the construction of the GMC / Liouville measure
   for coupling `b < 1`.
3. [Moments and singular integrals](moments-and-singular-integrals/README.md)
   — convergence and divergence of the correlator integrals, and the
   `b < 1/√2` region where a simpler `L²` argument suffices.
4. [Liouville correlators on the sphere](liouville-correlators-on-the-sphere/README.md)
   — paper [1]: rigorous correlation functions on the Riemann sphere,
   conformal covariance, Seiberg bounds, KPZ scaling.
5. [The DOZZ formula](dozz-formula/README.md) — paper [2]: the three-point
   structure constants of Liouville CFT, proved via GMC integrability.
6. [Conformal bootstrap](conformal-bootstrap/README.md) — paper [3]:
   reconstructing correlators from Virasoro conformal blocks and the DOZZ
   structure constants, for the full range `γ ∈ (0,2)`.
7. [Segal's axioms](segals-axioms/README.md) — paper [4], the target: a
   probabilistic implementation of Segal's functorial CFT axioms for LCFT.
