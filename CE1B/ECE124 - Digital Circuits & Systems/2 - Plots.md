---
jupyter:
  jupytext:
    cell_metadata_filter: -all
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.19.2
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# ECE124 — Canonical Expressions Plots

Logic gate diagrams for section 2 (NAND/NOR synthesis) generated with **SchemDraw**.

---

## Setup

```python
import schemdraw
from schemdraw import logic
from pathlib import Path

schemdraw.use('svg')

OUT = Path("media")

def sd_save(d, name):
    d.save(str(OUT / name))
    print(f"saved {name}")
```

---

## NAND and NOR Gate Symbols

NAND (top): output $(xy)'$. NOR (bottom): output $(x+y)'$.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    nand = logic.Nand(inputs=2).right()
    logic.Line().left(0.5).at(nand.in1).label('$x$', 'left')
    logic.Line().left(0.5).at(nand.in2).label('$y$', 'left')
    logic.Line().right(0.75).at(nand.out).label("$(xy)'$", 'right')
    d.move_from(nand.in1, dy=-2.5)
    nor = logic.Nor(inputs=2).right().anchor('in1')
    logic.Line().left(0.5).at(nor.in1).label('$x$', 'left')
    logic.Line().left(0.5).at(nor.in2).label('$y$', 'left')
    logic.Line().right(0.75).at(nor.out).label("$(x+y)'$", 'right')
    sd_save(d, 'nand_nor_symbols.svg')
```

---

## De Morgan — NAND Row

NAND$(x_1, x_2)$ ≡ OR with both inputs inverted: $(x_1 x_2)' = x_1' + x_2'$.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    nand = logic.Nand(inputs=2).right()
    logic.Line().left(0.5).at(nand.in1).label('$x_1$', 'left')
    logic.Line().left(0.5).at(nand.in2).label('$x_2$', 'left')
    logic.Line().right(2.0).at(nand.out).label('≡', 'center')
    d.move_from(nand.out, dx=2.0)
    or_inv = logic.Or(inputs=2, inputnots=[1, 2]).right()
    logic.Line().right(0.5).at(or_inv.out)
    sd_save(d, 'demorgan_nand.svg')
```

---

## De Morgan — NOR Row

NOR$(x_1, x_2)$ ≡ AND with both inputs inverted: $(x_1 + x_2)' = x_1' x_2'$.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    nor = logic.Nor(inputs=2).right()
    logic.Line().left(0.5).at(nor.in1).label('$x_1$', 'left')
    logic.Line().left(0.5).at(nor.in2).label('$x_2$', 'left')
    logic.Line().right(2.0).at(nor.out).label('≡', 'center')
    d.move_from(nor.out, dx=2.0)
    and_inv = logic.And(inputs=2, inputnots=[1, 2]).right()
    logic.Line().right(0.5).at(and_inv.out)
    sd_save(d, 'demorgan_nor.svg')
```

---

## Generic AND-OR (SOP)

Two-level SOP: AND$(x_1, x_2)$ and AND$(x_3, x_4, x_5)$ feeding an OR gate.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    and_top = logic.And(inputs=2).right()
    logic.Line().left(0.5).at(and_top.in1).label('$x_1$', 'left')
    logic.Line().left(0.5).at(and_top.in2).label('$x_2$', 'left')
    d.move_from(and_top.in1, dy=-4.0)
    and_bot = logic.And(inputs=3).right().anchor('in1')
    logic.Line().left(0.5).at(and_bot.in1).label('$x_3$', 'left')
    logic.Line().left(0.5).at(and_bot.in2).label('$x_4$', 'left')
    logic.Line().left(0.5).at(and_bot.in3).label('$x_5$', 'left')
    d.move_from(and_top.out, dy=-(and_top.out.y - and_bot.out.y) / 2)
    or_out = logic.Or(inputs=2).right()
    logic.Line().at(and_top.out).toy(or_out.in1)
    logic.Line().at(and_bot.out).toy(or_out.in2)
    logic.Line().right(0.5).at(or_out.out)
    sd_save(d, 'sop_generic.svg')
```

---

## Generic NAND-NAND

NAND-NAND equivalent: same structure, all AND and OR replaced by NAND.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    nand_top = logic.Nand(inputs=2).right()
    logic.Line().left(0.5).at(nand_top.in1).label('$x_1$', 'left')
    logic.Line().left(0.5).at(nand_top.in2).label('$x_2$', 'left')
    d.move_from(nand_top.in1, dy=-4.0)
    nand_bot = logic.Nand(inputs=3).right().anchor('in1')
    logic.Line().left(0.5).at(nand_bot.in1).label('$x_3$', 'left')
    logic.Line().left(0.5).at(nand_bot.in2).label('$x_4$', 'left')
    logic.Line().left(0.5).at(nand_bot.in3).label('$x_5$', 'left')
    d.move_from(nand_top.out, dy=-(nand_top.out.y - nand_bot.out.y) / 2)
    nand_out = logic.Nand(inputs=2).right()
    logic.Line().at(nand_top.out).toy(nand_out.in1)
    logic.Line().at(nand_bot.out).toy(nand_out.in2)
    logic.Line().right(0.5).at(nand_out.out)
    sd_save(d, 'nand_generic.svg')
```

---

## Specific SOP — $f = x_2'x_3 + x_1 x_3'$

Two-level NOT-AND-OR implementation. Use `inputnots=[i]` to mark inverted inputs as bubbles on the AND gate, so the shared $x_3$ wire becomes a single clean vertical stem from $g_1.in_2$ to $g_2.in_2$ — no separate NOT bodies that collide with the input wires.

```python
def build(d, GateMid, GateOut):
    g1 = GateMid(inputs=2, inputnots=[1]).right()  # bubble on in1 → x2'
    d.move_from(g1.in1, dy=-3.0)
    g2 = GateMid(inputs=2, inputnots=[2]).right().anchor('in1')  # bubble on in2 → x3'
    d.move_from(g1.out, dy=-(g1.out.y - g2.out.y) / 2)
    g_out = GateOut(inputs=2).right()
    logic.Line().at(g1.out).toy(g_out.in1)
    logic.Line().at(g2.out).toy(g_out.in2)
    logic.Line().right(0.5).at(g_out.out).label('$f$', 'right')
    rail_x = g1.in1.x - 2.5
    logic.Line().at(g1.in1).tox(rail_x).label('$x_2$', 'left')
    stem = logic.Line().at(g1.in2).toy(g2.in2)
    with d.hold():
        logic.Dot().at(stem.center)
        logic.Line().at(stem.center).tox(rail_x).label('$x_3$', 'left')
    logic.Line().at(g2.in1).tox(rail_x).label('$x_1$', 'left')

with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    build(d, logic.And, logic.Or)
    sd_save(d, 'sop_specific.svg')
```

---

## Specific NAND — $f = x_2'x_3 + x_1 x_3'$

Same layout as SOP with AND → NAND and OR → NAND. The bubbles on $g_1.in_1$ and $g_2.in_2$ still represent the $x_2'$ and $x_3'$ inversions; the bubbles on the NAND outputs are the NAND inversions.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    build(d, logic.Nand, logic.Nand)
    sd_save(d, 'nand_specific.svg')
```
