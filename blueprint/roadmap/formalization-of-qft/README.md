# Formalization of QFT (Douglas, Hoback, Mei, Nissim)

Source: Douglas, Hoback, Mei, Nissim, "Formalization of QFT" (2026),
formalizing the free `d = 4` Euclidean QFT and its Glimm-Jaffe/OS axioms
in Lean 4. See
[sources/formalization-of-qft/README.md](../../sources/formalization-of-qft/README.md)
for the paper, the `mrdouglasny/OSforGFF` repository it accompanies, and
why it bears directly on this project's own [book 1](../glimm-jaffe/README.md).

**Status: cloned and independently verified, not yet acted on.** Unlike
this project's other placeholder books, the formalization described here
already exists, complete and public. The code is now vendored into this
repository as a git submodule at `references/OSforGFF`, and its "zero
`sorry`, zero extra axioms" claim has been checked directly (not just
quoted from its README) by grepping the actual source rather than trusting
its own `AXIOM_AUDIT.md` alone — see
[sources/formalization-of-qft/README.md](../../sources/formalization-of-qft/README.md)
for what was checked. There is no gap for this project to fill by re-doing
that work. What remains is a genuine decision, not yet made:

1. **Study it as a methodology reference** for this project's own
   still-coarse [covariance-operators](../glimm-jaffe/covariance-operators/README.md)
   and [function-space-quantization](../glimm-jaffe/function-space-quantization/README.md)
   chapters, without taking a code dependency.
2. **Depend on `OSforGFF` directly** (as a Lake dependency, matching
   license) for the free-field/covariance-operator foundation, so book 1's
   own work starts from the interacting (`φ⁴`) case rather than
   re-proving the free case.
3. **Pursue the same next step the paper's authors identify**: they name
   `P(φ)₂` (constructed in Glimm-Jaffe among other sources) as the natural
   next target, and report the first author has already made progress on
   it — directly overlapping with book 1's own prerequisite chain toward
   Chapter 17. Coordinating rather than duplicating that effort would be
   worth doing before book 1's function-space-quantization chapter is
   decomposed further.

No chapter breakdown is drafted here until one of these is chosen.
