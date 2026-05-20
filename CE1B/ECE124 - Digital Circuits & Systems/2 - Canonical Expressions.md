
---

> [!info] Synthesis
> ## Circuit Synthesis

<u><strong style="color:#dab1da">Synthesis</strong></u> — circuit implementation given a truth table.

**Procedure (SOP):**
1. For each row where $f = 1$, write a product term (AND of inputs) true **only** for that row
2. OR all product terms together

> [!example] Synthesis Example
> ## Synthesis Example

Given the truth table, find the simplest Boolean expression for $f$ and draw the circuit.

| $x_1$ | $x_2$ | $f$ |
|:-----:|:-----:|:---:|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

> [!success]- Solution (Click to expand)
> **Step 1 — Canonical SOP:**
>
> | $x_1$ | $x_2$ | $f$ | Product term |
> |:-----:|:-----:|:---:|:------------:|
> | 0 | 0 | 1 | $x_1'x_2'$ |
> | 0 | 1 | 1 | $x_1'x_2$ |
> | 1 | 0 | 0 | — |
> | 1 | 1 | 1 | $x_1 x_2$ |
>
> $$f = x_1'x_2' + x_1'x_2 + x_1 x_2$$
>
> **Step 2 — Simplify:**
>
> $$
> \begin{aligned}
> f &= x_1'(x_2' + x_2) + x_1 x_2 = x_1' + x_1 x_2
> \end{aligned}
> $$
>
> Add a duplicate term and factor again:
>
> $$
> \begin{aligned}
> f &= x_1'x_2' + x_1'x_2 + x_1'x_2 + x_1 x_2 \\
> &= x_1'(x_2'+x_2) + x_2(x_1'+x_1) = x_1' + x_2
> \end{aligned}
> $$
>
> **Step 3 — Circuit** ($f = x_1' + x_2$):
>
> <img src="media/synthesis_not_or.svg" alt="NOT-OR synthesis circuit" width="55%">

