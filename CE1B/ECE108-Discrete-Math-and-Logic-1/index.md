# ECE 108 — Discrete Math & Logic 1 — Note Index

## Lecture Notes

### 1 - Introduction.rnote
- **Discrete vs continuous** mathematics
- **Motivating proof**: given x < y in ℝ, prove ∃z with x < z < y (midpoint z = (x+y)/2)
- **Huffman coding** example: encoding "hello" into a binary prefix tree
- **Propositional logic**: atomic vs compound propositions
- **Logical connectives**: conjunction (AND), disjunction (OR), negation (NOT), implication (⇒), biconditional (⇔)
- **Truth tables** for all connectives; implication truth table analysis (P=1,Q=0 is the only False case)
- **Common claims proved by truth table**:
  - (P ⇒ Q) ⟺ (¬P ∨ Q)
  - (P ⇒ Q) ⟺ (¬Q ⇒ ¬P) — contrapositive vs converse terminology
  - (P ⇒ Q) ⇒ ((P ∨ r) ⇒ (Q ∨ r))
- **Quantifiers**: universal (∀) and existential (∃)

### 2 - Proof Techniques.rnote
- **Proof by contradiction** (2 examples):
  1. If a, b, c are positive integers, at least one of a−b, b−c, c−a is even
  2. Partial sum equality implies index equality (∑1..x = ∑1..y ⇒ x = y)
- **Proof by contrapositive**: same claim #2 reproved via contrapositive (¬(x=y) ⇒ sums differ), case analysis on x > y and x < y
- **Proof by induction**: digit sum divisibility by 3 — if digsum(n) mod 3 = 0 then n mod 3 = 0. Three cases for carry propagation when incrementing by 3. Base cases n = 1, 2, 3.

### 3.1 - Sets.md
- **Empty placeholder** — no content written

### 3.2- Powersets.md
- **Powerset definition**: 𝒫(A) = set of all subsets of A
- **Size of powersets**: |𝒫(A)| = 2^n proof via binary string representation of subsets
- Other headers ("Basic Property", "Claims") are blank stubs

### 3.3 - Functions.md
- **Function definition**: relation F ∈ A × B where every a ∈ A appears as first component of exactly one pair
- **Domain, codomain, range** with Excalidraw diagram
- **Special relationships**: injection, surjection, bijection (with Excalidraw diagram)
- **Inverse of surjection** is a bijection on the range

### 3.3 - Exercise.md
- **Problem 1 — Prove bijection**: f: (ℤ⁺ × ℤ⁺) → ℤ⁺, f(x,y) = x + (x+y)(x+y+1)/2. Injection by case analysis on sum ordering. Surjection by induction (shift x,y to get f = y+1). Uses Python code to tabulate values.
- **Problem 2 — Set intersection empty iff unequal**: Prove a ≠ b ⟺ {(a−1)²+1,...,a²} ∩ {(b−1)²+1,...,b²} = ∅. Forward by WLOG + squaring inequality. Converse by a² ≠ b².
- **Problem 3 — Set difference associativity**: Prove (A∖B)∖C = A∖(B∪C) by element-chasing through logical equivalences.

### 3.4 - Cardinality of sets.md
- **Finite set definition**: ∃n ∈ ℕ, injection f: S → ℕ_n
- **Proof ℕ is infinite** by contradiction (construct m+1 outside range of bijection to ℕ_n)
- **Countable set definition**: ∃ injection f: S → ℕ
- **Proof (0,1) is uncountable**: Cantor's diagonal argument — construct x ∈ (0,1) differing from every r_i at digit i (use 4/5 digit swap)

---

## Assignments

### Assignment 1.rnote
- **Q1**: Identify propositions vs non-propositions
- **Q2**: Evaluate compound propositions given a, b are true (AND, implication, biconditional)
- **Q3**: Truth table proof — (X∧Y)∧(¬X∨¬Y) vs (X∧¬Y)∨(¬X∧Y), showing non-equivalence
- **Q4**: Prove n⁴ + n is even for all n ∈ ℕ — case analysis (even/odd)
- **Q5**: Prove 2ⁿ < n! for n ≥ 4 — induction
- **Q6**: Prove |r+3| > 2 for all r ∈ ℝ — case analysis on sign of r+3
- **Q7**: Prove no n, m ∈ ℕ with n² − m² = 1 — contradiction via (n+m)(n−m) = 1
- **Q8**: Pigeonhole principle proof — n pigeons in m holes ⇒ ∃ hole with ≥ ⌈n/m⌉ pigeons

### Assignment2.rnote
- **Q1 (statement only)**: Prove 7ⁿ − 2ⁿ is divisible by 5 for every n ∈ ℤ⁺
- **Q4**: Set absorption identity A ∩ (A ∪ B) = A ∪ (A ∩ B) = A — proved algebraically (distributive law) and by element-chasing (membership argument, 4 cases)

---

## Tutorials

### Tutorial2.rnote
- **⚠️ MISLABELED**: This file contains MATH 119 content (tangent planes, chain rule, parametric curves), NOT ECE 108 content. See MATH119 index for details.

---

## Excalidraw Drawings

### drawings/1 - Introduction Drawing.md
- Propositional logic diagrams

### drawings/1.2 - Haffman Example.md
- Huffman coding tree example

### drawings/3.3 - Function Mappings.md
- Domain, codomain, range visual mapping diagram

### drawings/3.3 - Special Functions.md
- Injection, surjection, bijection visual diagrams

### drawings/3.4 - Cardinality.md
- Cardinality concepts visual diagram
