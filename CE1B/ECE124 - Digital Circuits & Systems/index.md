# ECE 124 — Digital Circuits & Systems — Note Index

## Lecture Notes

### 1 - Introduction.rnote
- **Digital circuits** definition, binary encoding (3-bit, 1-bit)
- **Decimal ↔ binary** conversion
- **Truth tables**: constructing from description
- **Logic gates**: AND, OR, NOT, XOR — symbols, notation, truth tables, circuit representations
- **Four representations** of logic functions: algebraic expression, schematic, truth table, canonical form
- **Boolean algebra rules**: closure, identity, distributive, inverse
- **SOP synthesis from truth table**: identify minterms, write SOP, simplify, draw AND-OR gate circuit

### 1 - Binary Logic.md (Obsidian)
- Binary logic overview and definitions

### 2 - Canonical Expressions.rnote
- **Minterms and maxterms**: definitions, notation (m_i, M_i), enumeration for 3 variables
- **Canonical SOP**: OR the minterms where f = 1, Σm(...) notation
- **Canonical POS**: AND the maxterms where f = 0, ΠM(...) notation
- **SOP ↔ POS conversion**: algebraic expansion with theorem (x+y)(x+y') = x
- **NAND/NOR synthesis**
- **XOR gate**: symbol, truth table
- **XNOR gate**: complement of XOR
- **Buffer**: f = x
- **Tri-state buffer**: truth table with enable input, high-impedance state (Z)

### 2 - Canonical Expressions.md (Obsidian)
- Canonical expression definitions and examples

### 3 - Karnaugh Maps.rnote
- **Gray code** (reflected binary code): 1-bit difference between adjacent entries
- **2-variable K-map**: f(x₁,x₂) = Σm(0,1,2) — grouping and minimal SOP
- **3-variable K-map**: grouping adjacent cells, extracting SOP and POS
- **4-variable K-map**: f(x₁,x₂,x₃,x₄) = Σm(0,1,4,5,11,13,15) — wrap-around adjacency, prime implicants
- **5-variable K-map**: two 4-variable maps (x₅=0 and x₅=1), cross-map groupings
- **Don't-care conditions**: choosing inclusion for further simplification
- **SOP and POS extraction** from K-maps (grouping 1s vs 0s)

### 4 - Multiplexers and Decoders.rnote
- **Multiplexer definition**: selector of inputs, 2-bit mux f = S'W₀ + SW₁
- **Gate-level implementation** of mux (AND-OR with select lines)
- **Shannon's Expansion Theorem**: f = x₁'·f(0,x₂,...) + x₁·f(1,x₂,...) — recursive decomposition for mux-based synthesis
- **Decoder definition**: n inputs, enable switch, only 1 output active
- **2-to-4 decoder**: truth table, gate-level circuit
- **Larger decoders from smaller**: 4-input decoder using five 2-to-4 sub-decoders (hierarchical enable)
- **Boolean function implementation with decoder**: OR together decoder outputs for true minterms
- **Mux from decoder**: tri-state buffers with decoder outputs

### 5 - Basic Sequential Circuits.rnote
- **Combinational vs sequential** circuits: output depends on inputs + current state (memory/feedback)
- **Clock signal**: rising/falling edge, frequency = 1/period
- **SR Latch** (NOR-based): cross-coupled NOR gates, truth table, invalid state (Q=S=1)
- **Gated SR Latch**: enable/clock input, run/latch modes
- **Gated D-Latch**: single data input D, eliminates invalid state, characteristic table
- **Level-sensitive vs edge-triggered**: D-latch (level) vs D flip-flop (edge)
- **Negative-edge triggered D flip-flop**: circuit, characteristic table, symbol
- **Positive-edge triggered D flip-flop**: circuit, characteristic table, symbol
- **T flip-flop** (Toggle): flips present state, characteristic table
- **JK flip-flop**: J=K=1 causes toggle, characteristic table
- **Registers**: bank of flip-flops, parallel register with shared clock, parallel/serial loading
- **Up-counter**: asynchronous (ripple) using T flip-flops, carry logic (product of all lower Q bits)
- **Down-counter**
- **D-based counter** (4-bit): D_i = Q_i ⊕ carry_in, enable + load + clock inputs, parallel loading, block symbol

### Components.md (Obsidian)
- ECE124 component library reference (gates, FFs, muxes, decoders, counters)

---

## Tutorials

### Tutorial1.rnote
- **Problem 2.21**: Design simplest SOP circuit for f(x₁,x₂,x₃) = Σm(1,3,4,6,7). Full algebraic simplification + AND-OR gate circuit diagram.

### Tutorial3.rnote
- **Example 1**: 3-variable K-map, f = Σm(2,4,6) — minimum cost SOP and POS
- **Example 2**: 3-variable K-map with don't-cares d(2,5) — SOP and POS with don't-care exploitation
- **Example 3**: 4-variable K-map from maxterm form f = ΠM(...) converted to minterms — SOP extraction
- **Example 4**: 4-variable K-map with don't-cares — both SOP and POS minimal expressions
- **Example 5**: 5-variable K-map — two stacked 4-variable maps, cross-map groupings, SOP and POS

### Tutorial4.rnote
- **Problem 4.1**: Implement f(w₁,w₂,w₃) = Σm(0,2,3,4,5,7) using a 3-to-8 binary decoder — OR relevant minterm outputs
- **Problem 4.3**: Implement f(w₁,w₂,w₃) = w₁'w₃' + w₂w₃' + w₁'w₂ using a 2-to-1 multiplexer — Shannon expansion on w₁, residue table, circuit diagram
- **Problem 4.5**: Implement f(w₁,w₂,w₃) = Σm(0,2,3,6) using a 2-to-1 multiplexer — Shannon expansion, residue simplification, circuit diagram

---

## Labs

### Lab1/Lab 1.md
- Lab 1 instructions and design

### Lab1/FPGA.md
- FPGA overview for lab work

### Lab1/Truth Table.rnote
- Truth table work for Lab 1
