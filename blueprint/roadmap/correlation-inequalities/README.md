# Correlation inequalities and the Lee-Yang theorem

Source: Glimm-Jaffe, Chapter 4, pp. 56-72.

These inequalities compare expectations under Gibbs measures with different
interactions or boundary conditions, and are the main tool used later
(Chapter 17) to locate the `φ⁴` critical point. All of this chapter's results
concern finite lattices and classical (not quantum-field) measures, so they
are within reach of Mathlib's existing probability and order theory.

- [Ferromagnetic lattice Hamiltonians and expectations](ferromagnetic-measures.md)
  set up the shared framework: ferromagnetic Hamiltonians, single-spin
  measures, and duplicate-variable expectations.
- The [first](first-griffiths-inequality.md) and
  [second](second-griffiths-inequality.md) Griffiths inequalities give the
  positivity of moments and pair correlations for ferromagnetic
  interactions.
- As a first application, [monotonicity and the infinite-volume
  limit](infinite-volume-limit.md) shows Ising model correlation functions
  converge as the lattice volume grows.
- The [ξ⁴ inequalities](xi4-inequalities.md) specialize to quartic
  interactions and give the Lebowitz inequalities, with
  [higher-order bounds](higher-order-correlation-bounds.md) following by
  induction.
- The [FKG inequality](fkg-inequality.md) reaches a similar conclusion to the
  second Griffiths inequality under different hypotheses; its finite,
  discrete-lattice form is already in Mathlib.
- The [Lee-Yang theorem](lee-yang-theorem.md) shows the partition function
  has no zeros away from the imaginary axis, which gives
  [analyticity of the free energy](analyticity-of-free-energy.md).
- Finally, the Griffiths/Lebowitz pattern extends to
  [two-component spins](two-component-spin-inequalities.md).
