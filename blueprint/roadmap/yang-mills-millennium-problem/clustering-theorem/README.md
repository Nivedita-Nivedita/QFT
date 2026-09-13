# Clustering from a mass gap

Source: Jaffe-Witten, §5 "Comments," eq. (2), in
the problem statement (`docs/yang-mills-existence-and-mass-gap.md`).

If a theory has mass gap `Δ`, then for any local operator
`O(x⃗) = e^{−iP⃗·x⃗} O e^{iP⃗·x⃗}` with `⟨Ω,OΩ⟩ = 0`, and any `0 < C < Δ`,

`|⟨Ω, O(x⃗)O(y⃗)Ω⟩| ≤ exp(−C|x⃗−y⃗|)`

once `|x⃗−y⃗|` is sufficiently large. Unlike the Millennium statement itself,
this is a genuine, self-contained mathematical theorem: a general
consequence of a positive-energy representation of the Poincaré group
having a spectral gap, via a Fourier/Paley-Wiener argument on the spectral
measure of the translation generators. It does not depend on Yang-Mills
specifics, and is the one result in the document proved by the document's
own logic rather than cited from elsewhere.

- [Clustering from a mass gap](clustering.md)

## Depends on

- [Axiomatic quantum field theory](../axiomatic-qft/README.md)
