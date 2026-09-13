# Quantum Fields and Strings: A Course for Mathematicians

Source: Deligne, Etingof, Freed, Jeffrey, Kazhdan, Morgan, Morrison, Witten
(eds.), *Quantum Fields and Strings: A Course for Mathematicians*, AMS, 1999
(2 vols). See
[sources/quantum-fields-and-strings/README.md](../../sources/quantum-fields-and-strings/README.md).

**Status: scope not yet chosen.** This book spans classical field theory,
supersymmetry, conformal field theory, renormalization, index theory, and
string theory across two volumes and roughly a dozen lecturers — far too
broad to formalize as a whole. No chapter, lecture, or theorem has been
picked as a target yet.

## Plan

Once a target is picked, follow the same process used for the other two
books in this repository:

1. **Obtain the source.** Either a legitimate copy of the AMS volumes, or
   (in the meantime) the specific IAS lecture notes covering the chosen
   topic, converted from DVI/PostScript to a readable form.
2. **Read the target closely** and record exact section/page references and
   precise statements in `blueprint/sources/quantum-fields-and-strings/`,
   the way [`sources/glimm-jaffe.md`](../../sources/glimm-jaffe.md) and
   [`sources/liouville/README.md`](../../sources/liouville/README.md) do for
   the other two books.
3. **Draft a coarse milestone breakdown** here, as chapter subdirectories
   under `quantum-fields-and-strings/`, and check it against what Mathlib
   already has before planning new work.
4. **Get the coarse plan approved** before decomposing further.
5. **Decompose into pull-request-sized Lean statement nodes**, each with a
   `declaration:` frontmatter field and a `## Depends on` section, the way
   `blueprint/roadmap/glimm-jaffe/correlation-inequalities/` does.
6. **Write the Lean statements** (`sorry`-proved first), validate with
   `autoform check`/`audit --lean-root .`, and only then start on proofs.
7. **Validate the full publication sequence** (`check`, `-visualize`,
   `render --require-declarations`, `mkdocs build --strict`) before pushing
   — a wrapped Markdown link once broke this silently; see the repository's
   git history.
