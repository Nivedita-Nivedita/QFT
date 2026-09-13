# Source: Formalization of QFT

Michael R. Douglas, Sarah Hoback, Anna Mei, Ron Nissim.
"Formalization of QFT." March 2026. arXiv:[2603.15770](https://arxiv.org/pdf/2603.15770).
Local copy: `~/Projects/autoform/new-paper/paper.pdf`.

A formalization, in Lean 4, of the construction of the free massive
bosonic `d = 4` Euclidean quantum field theory, following Glimm and
Jaffe's treatment (the same book as this project's [book 1](../glimm-jaffe.md)),
and a proof that it satisfies the Glimm-Jaffe/Osterwalder-Schrader axioms
(OS0-OS4) — the same axiom set catalogued in
[docs/axiom-systems-for-qft.md](../../../docs/axiom-systems-for-qft.md).
The project is explicitly framed as a proof of concept for AI-assisted
formalization in mathematical physics, with a detailed methods section on
using Claude Code, GPT Codex, and Gemini as coding assistants.

## The code: `mrdouglasny/OSforGFF`

Public GitHub repository, Apache License 2.0:
[github.com/mrdouglasny/OSforGFF](https://github.com/mrdouglasny/OSforGFF).
Cloned into this repository as a git submodule at `references/OSforGFF`,
pinned to the commit checked out there.

**Independently verified** (not just quoting the repo's own README): a
direct `grep -rn "sorry\|admit\|^axiom \|native_decide\|unsafe \|extern "`
over every `.lean` file outside `Legacy/` turns up zero real hits (the
handful of matches are the words "admit"/"sorry" inside prose/comments,
e.g. in `Guardrails.lean`'s own docstring explaining what it guards
against) and a real line count of ~25,827. The repository also carries its
own build-time enforcement of this (`OSforGFF/Guardrails.lean`, checked
via `#guard_msgs` on every `lake build`) and a source-level script
(`scripts/check-guardrails.sh`) — see `AXIOM_AUDIT.md` in the submodule.
Note it pins `lean-toolchain` to `leanprover/lean4:v4.33.0-rc1` (a release
candidate), one point release behind this project's `v4.33.1`.

- Constructs the massive Gaussian Free Field as a probability measure on
  tempered distributions (via the Minlos theorem) and proves it satisfies
  all five OS axioms, generically for spacetime dimension `d ≥ 2`, with
  closed-form covariance instances for `d = 2, 3, 4, 5`.
- ~25,500 lines of Lean across 52 core files, organized in seven layers:
  general mathematics extensions, spacetime/test functions, Schwinger
  functionals, covariance operators, the GFF measure, the OS axioms
  themselves, and dimension-specific instances.
- **Zero `sorry`, zero extra axioms** as of the paper's writing: the
  original release assumed Minlos' theorem, the nuclear property of
  Schwartz space, and Goursat's theorem; all three have since been proved
  (or avoided) by the authors and Lean community contributors, so the
  result now rests only on Lean and Mathlib.
- Depends on three other axiom-free Lean libraries: `bochner`,
  `gaussian-field`, and
  [`RemyDegenne/kolmogorov_extension4`](https://github.com/RemyDegenne/kolmogorov_extension4)
  (imported for the proof of Minlos' theorem).

## Direct relevance to this project

This is, as far as the paper's authors are aware, the first formalization
of constructive QFT, and it covers exactly the free-field / covariance
operator content that this project's
[covariance-operators](../../roadmap/glimm-jaffe/covariance-operators/README.md)
and
[function-space-quantization](../../roadmap/glimm-jaffe/function-space-quantization/README.md)
chapters (still coarse, unstarted) are about — for `d = 4` specifically,
the dimension book 1 ultimately needs.

The paper's own "Going forward" section (§6) names `P(φ)₂` — the
two-dimensional boson with a polynomial interaction, constructed in
Glimm-Jaffe [38] among other sources — as the natural next target, and
reports that the first author has already made progress on it. This is
precisely book 1's own prerequisite chain toward Chapter 17. Reading this
paper closely, and potentially building on `OSforGFF` (same permissive
license as this repository) rather than reformalizing the free field from
scratch, is worth real consideration before further work on book 1's
covariance-operators or function-space-quantization chapters.

## Status

Read, not yet formalized or depended upon by this repository. No target
chapter chosen yet; see
[roadmap/formalization-of-qft/README.md](../../roadmap/formalization-of-qft/README.md).
