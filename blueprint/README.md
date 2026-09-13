# QFT: mathematical quantum field theory, formalized

A multi-book Lean 4 / Mathlib formalization project, growing over time as
books and papers are added. Each book gets its own chapter tree under
`roadmap/`, its own citation notes under `sources/`, and its own rows in
`coverage/README.md`; see [roadmap/README.md](roadmap/README.md) for the
current list. As of this writing:

1. **Glimm-Jaffe: Quantum Physics** — targets Chapter 17, "The φ⁴ Critical
   Point," of J. Glimm and A. Jaffe, *Quantum Physics: A Functional Integral
   Point of View*, 2nd ed. (Springer, 1987), pp. 339-355; see
   [sources/glimm-jaffe.md](sources/glimm-jaffe.md). Chapter 4 (correlation
   inequalities) has statement-level Lean formalizations.
2. **Liouville theory** — targets Segal's axioms and the conformal
   bootstrap for Liouville CFT, from the
   David-Guillarmou-Kupiainen-Rhodes-Vargas papers; see
   [sources/liouville/](sources/liouville/). Coarse milestones only so far.
3. **Quantum Fields and Strings: A Course for Mathematicians** — the
   two-volume AMS course; see
   [sources/quantum-fields-and-strings/](sources/quantum-fields-and-strings/).
   Scope not yet chosen.
4. **Gauge theory and four-manifolds** — a reference library of eight
   textbooks; see
   [sources/gauge-theory-references/](sources/gauge-theory-references/).
   No formalization target chosen.
5. **Yang-Mills Existence and Mass Gap** — the self-contained mathematical
   content of Jaffe and Witten's Clay Millennium Problem statement itself;
   see [sources/yang-mills-millennium-problem/](sources/yang-mills-millennium-problem/).
   Definitions fully proved; the conjecture and its one stated theorem are
   precisely formalized but necessarily `sorry`.

- [Roadmap](roadmap/README.md) — the book: chapters, statements, and their
  dependencies.
- [Coverage](coverage/README.md) — what counts as done, and what is out of
  scope.

<!-- Reference material goes in sources/. It is vault material rather than a
     chapter, so the site does not publish it: a statement's "## Sources" list
     links to the file in the repository instead. -->
