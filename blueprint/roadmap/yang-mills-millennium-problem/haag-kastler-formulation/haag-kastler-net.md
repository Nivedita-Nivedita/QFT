---
declaration: structure
origin: cited
statement: formalized
lean: QuantumPhysicsLean.YangMillsMillenniumProblem.HaagKastlerNet
---

# The Haag-Kastler net

`HaagKastlerNet Region G Aalg`: to each element of a poset `Region` of
space-time regions, a `*`-subalgebra of an ambient C*-algebra `Aalg`
(HK1); the assignment is monotone (`isotone`, HK2); algebras of
regions related by a given `spacelike` relation commute (`locality`,
HK3); and a group `G` (standing for the Poincaré group) acts on `Aalg` by
`*`-automorphisms `sigma`, compatibly with its action on `Region`
(`covariant`, HK4): `sigma g` carries the algebra of `B` onto that of
`g • B`.

This is a faithful, direct formalization of HK1-HK4 exactly as
Glimm-Jaffe state them (no simplification was needed here, unlike the
Wightman-picture chapter, which works with bounded operators as a
simplification of the physically unbounded Hamiltonian).

## Depends on

- (none: this is the chapter's foundational definition)

## Sources

- [Yang-Mills problem statement](../../../sources/yang-mills-millennium-problem/README.md), via Glimm-Jaffe §6.1(ii), p. 99, axioms HK1-HK4.
