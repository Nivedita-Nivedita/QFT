# QFT roadmap

This project formalizes multiple books and papers in mathematical quantum
field theory. Each is its own book below, with its own sources and coarse
milestone chapters.

## Books

1. [Glimm-Jaffe: Quantum Physics](glimm-jaffe/README.md) — J. Glimm and
   A. Jaffe, *Quantum Physics: A Functional Integral Point of View* (2nd
   ed.), targeting Chapter 17, "The φ⁴ Critical Point."
2. [Liouville theory](liouville-theory/README.md) — the David-Guillarmou-Kupiainen-Rhodes-Vargas
   papers on the probabilistic construction of Liouville CFT, targeting
   Segal's axioms and the conformal bootstrap.
3. [Quantum Fields and Strings: A Course for Mathematicians](quantum-fields-and-strings/README.md)
   — the two-volume AMS course (Deligne, Etingof, Freed, Jeffrey, Kazhdan,
   Morgan, Morrison, Witten, eds.). Scope not yet chosen.
4. [Gauge theory and four-manifolds: reference library](gauge-theory-references/README.md)
   — eight standard textbooks (Hamilton; Sontz; Frankel; Naber; Donaldson-Kronheimer;
   Freed-Uhlenbeck; Scorpan) catalogued for later use. No formalization
   target chosen.
5. [Yang-Mills Existence and Mass Gap](yang-mills-millennium-problem/README.md)
   — the self-contained mathematical content of Jaffe and Witten's Clay
   Millennium Problem statement itself: the axiomatic definitions, the
   conjecture (formalized, necessarily unproved), and the one theorem the
   document proves outright (mass gap implies clustering).
6. [Formalization of QFT](formalization-of-qft/README.md) — Douglas,
   Hoback, Mei, and Nissim's Lean 4 formalization of the free `d = 4`
   Euclidean QFT and its Glimm-Jaffe/OS axioms (already complete,
   Apache-2.0, zero `sorry`/zero extra axioms, in `mrdouglasny/OSforGFF`);
   read and cross-linked from book 1, no action taken yet.

More books and papers are added here over time; each gets its own chapter
directory under `roadmap/`, its own `sources/` notes, and its own rows in
`coverage/README.md`, following the pattern above.
