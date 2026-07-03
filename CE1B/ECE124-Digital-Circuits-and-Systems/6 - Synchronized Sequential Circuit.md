
---

> [!abstract] Introduction
> ## Synchronous Sequential Circuits

A <u><strong style="color:#dab1da">synchronous sequential circuit</strong></u> (a.k.a. <u><strong style="color:#dab1da">finite state machine (FSM)</strong></u>) combines combinational logic with flip-flops: $f(W) = [Z, S]$, where $W$ is the input, $S$ feeds the flip-flops to update the state $Q$, and $Z$ is the output. All state changes happen on the clock edge.

![[6.1 - SSC Overview|100%]]

> [!quote] Definition
> ## Moore vs. Mealy Machines

A <u><strong style="color:#f0965a">Moore machine</strong></u> — output depends on the current state $Q$ **only**. Output changes synchronously with the clock.

A <u><strong style="color:#7bbce0">Mealy machine</strong></u> — output depends on the current state $Q$ **and** the input $W$. Output can change asynchronously, any time $W$ changes.

![[6.2 - More vs Mealy Machine|100%]]

---

> [!example] Example Machine
> ## Two-Consecutive-Ones Detector

Design a circuit with input $W$ and output $Z$, changing on the positive clock edge, such that:

$$Z(t) = 1 \text{ if } W(t-1) = W(t-2) = 1, \text{ otherwise } Z(t) = 0$$

> [!quote] Definition
> ## State Diagrams

A <u><strong style="color:#dab1da">state diagram</strong></u> describes circuit behavior as nodes (states) and directed arcs (transitions labeled by the input that causes them). Number of arcs leaving a node $= 2^n$ for $n$ inputs.

For the detector above: state $A$ (no $1$s seen yet) $\to$ $B$ (one $1$) $\to$ $C$ (two $1$s, $z=1$), with any $w=0$ resetting back to $A$.

![[6.3 - More Machine State Diagram|100%]]

---

> [!info] State Table → Circuit
> ## State Tables and Circuit Synthesis

A <u><strong style="color:#dab1da">state table</strong></u> (transition table) is the tabular form of a state diagram. Expanding the present/next state columns into flip-flop bits ($y_1y_0$) gives an assignable table with **don't-cares** for the unused code (here $10$).

Reading next-state and output columns as truth tables in $w, y_1, y_0$ and minimizing gives:

$$(y_1, y_0)_{(t+1)} = (w \cdot y_0,\; w), \qquad Z = y_1 \cdot y_0$$

which is realized directly with two D flip-flops (D input = next-state expression).

![[6.4 - More Machine Example|90%]]

---

> [!example] Mealy Machine Example
> ## Same Detector, Mealy Version

Shifting the output one cycle earlier ($Z$ depends on $w$ and the current state directly) collapses the machine to **two** states: $A$ ($z=0$) and $B$ (last input was $1$, $z=1$ while $w=1$).

$$Y = w, \qquad z = w \cdot y$$

Only **one** flip-flop is needed — output labels sit on the arcs, not the nodes, since $z$ depends on the input too.

![[6.5 - Mealy Machine Example|100%]]

> [!hint] Mealy ↔ Moore
> Adding a D flip-flop after a Mealy machine's output register turns it into the equivalent Moore machine (delays $z$ by one clock cycle).

---

> [!fact] State Minimization
> ## Equivalent States

A circuit with $n$ states needs at least $\lceil \log_2 n \rceil$ flip-flops, so fewer states means fewer flip-flops. Two states are <u><strong style="color:#dab1da">equivalent</strong></u> (can be merged) if, for every input:

1. they produce the **same output**, and
2. they go to the **same** (or an equivalent) **next state**.

**Partitioning procedure:**
1. Partition states by output produced.
2. Within each partition, check next states for every input. If states in a partition transition to *different* partitions, split them apart.
3. Repeat until no partition splits further — remaining groups within a partition are equivalent.

> [!example] Partitioning Example
> ## Reducing a 7-State Machine

| Present | $w=0$ | $w=1$ | $z$ |
|:---:|:---:|:---:|:---:|
| A | B | C | 1 |
| B | D | F | 1 |
| C | F | E | 0 |
| D | B | G | 1 |
| E | F | C | 0 |
| F | E | D | 0 |
| G | F | G | 0 |

> [!success]- Solution (Click to expand)
> **Partition by output:** $(ABD)(CEFG)$
>
> **Check next states within each group:**
> - $(ABD)$: $w=0 \to (BDB)$ ✓same group, $w=1 \to (CFG)$ ✓same group → no split
> - $(CEFG)$: $w=0 \to (FFEF)$ ✓, $w=1 \to (ECDG)$ ✗ ($D \notin CEFG$) → split into $(CEG)(F)$
>
> **Re-check $(CEG)$:** $w=0 \to (FFF)$ ✓, $w=1 \to (ECG)$ ✓ → no further split
>
> **Re-check $(ABD)$ against new partitions:** $w=1 \to (CFG)$ still splits $C$ from $F$ → split into $(AD)(B)$
>
> **Result:** $A \equiv D$, and $C \equiv E \equiv G$. Merging (replace $D\to A$, $E,G \to C$) reduces 7 states to 4:
>
> | Present | $w=0$ | $w=1$ | $z$ |
> |:---:|:---:|:---:|:---:|
> | A | B | C | 1 |
> | B | A | F | 1 |
> | C | F | C | 0 |
> | F | C | A | 0 |

---

> [!hint] Design Steps Summary
> ## Design Procedure

1. Get circuit specification.
2. Draw state diagram (pick a start state, follow the spec).
3. Convert to state table.
4. Minimize states (partitioning).
5. Choose number of state variables / FF type.
6. Derive next-state and output logic (excitation tables for T/JK — see [[5 - Basic Sequential Circuits]]).
7. Implement the circuit.
