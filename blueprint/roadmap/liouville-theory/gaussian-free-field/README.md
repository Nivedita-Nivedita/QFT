# The Gaussian free field and normal-ordered exponential

Source: Chatterjee-Witten survey [5], Sections 2.1-2.3, pp. 6-11.

On the Riemann sphere with the "two glued disks" metric
`ds² = dx dx̄ · (1 if |x| ≤ 1, else 1/|x|⁴)`, the Liouville field decomposes as
`φ = c + X` for a constant zero-mode `c` and a field `X` constrained to have
vanishing average on the unit circle `|x| = 1`. With this constraint, the
reduced action becomes purely quadratic, `I_red(X) = (1/4π)∫ d²x√g ∂ₐX∂ᵃX`,
so `X` is a Gaussian free field of mean zero, with an explicit propagator

`G(x,y) = log(1/|x-y|) + log⁺|x| + log⁺|y|`, `|x|⁺ := max(1,|x|)`.

Section 2.2 reduces the well-definedness of the Liouville correlator formula
to eliminating the linear factors `e^{2αᵢX(xᵢ)}` via a Girsanov-theorem
change of measure; Section 2.3 defines the normal-ordered exponential
interaction `:e^{2bX(x)}:` itself, the multiplicatively renormalized object
whose positivity is the special feature of Liouville theory (see the
survey's Introduction, and the project's [source notes](../../../sources/liouville/README.md)).

Not yet decomposed into formalizable statements.
