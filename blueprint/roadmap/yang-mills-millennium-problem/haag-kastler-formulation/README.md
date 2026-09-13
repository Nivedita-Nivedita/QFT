# The Haag-Kastler (algebraic) formulation

Source: Haag-Kastler axioms HK1-HK4, as stated by Glimm-Jaffe (§6.1(ii),
p. 99; see also `docs/axiom-systems-for-qft.md`). Unlike the [Wightman-picture statement](../millennium-statement/README.md)
of the Millennium Problem, this chapter is not a direct transcription of
anything in the Jaffe-Witten problem statement — it is a genuine extension
of this project, restating existence-and-mass-gap in the algebraic
picture rather than the Hilbert-space-of-fields picture.

The axioms HK1-HK4 themselves, as a Lean structure: a monotone (isotony),
local (commuting for spacelike-separated regions), covariant assignment of
a `*`-subalgebra of an ambient C*-algebra to each space-time region.

- [Haag-Kastler net](haag-kastler-net.md)

A representation of the net on a Hilbert space, with a Hamiltonian
generating the represented time-translation unitaries via the ordinary
(bounded-operator) exponential series; the net has a mass gap if some such
representation's Hamiltonian does, reusing the mass-gap definition already
given for the Wightman picture.

- [Covariant representations and mass gap](covariant-representation.md)

The AQFT-picture restatement of the boxed conjecture. `sorry`-terminated
for the same reason its Wightman-picture counterpart is: it is the open
problem, not a proof attempt.

- [The Millennium Problem, algebraically](millennium-statement-aqft.md)

## Depends on

- [Axiomatic quantum field theory](../axiomatic-qft/README.md)
