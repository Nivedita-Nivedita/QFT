# Gaussian multiplicative chaos

Source: Chatterjee-Witten survey [5], Sections 2.4-2.6 and 3.1-3.3, pp. 12-28.

Builds the Gaussian multiplicative chaos (GMC) measure `M_f(A) := lim_{ε→0}
M_{f,ε}(A)` that gives meaning to `∫_A f(x) e^{2bX(x)} d²x` for the Gaussian
free field `X` of the [previous chapter](../gaussian-free-field/README.md).

Two tools drive the construction: the **near scale invariance** of `X`
(Section 3.1) — `X(y/q)` has the same law as `X(y) + Ω_q` for an independent
Gaussian `Ω_q` of variance `log q` — and **Kahane's inequality** (Section
3.2), which compares expectations of convex functionals of GMC-type
processes with different (but comparably ordered) covariance kernels.
Section 2.4 explains via martingale convergence why `M_{f,ε}(A)` can
degenerate to a trivial (zero) limit even when its moments stay nonzero, if
rare large-deviation events dominate; Section 2.5 handles the simpler
regime `b < 1/√2` by an elementary `L²` martingale argument; Section 2.6
("Where things break down") explains why that argument fails for `b ≥
1/√2`, motivating Kahane's more delicate approach. Section 3.3 shows the
random variables `M_{f,ε}(A)` vanish in the limit whenever `b > 1`, so the
construction is confined to `b < 1`.

Not yet decomposed into formalizable statements.
