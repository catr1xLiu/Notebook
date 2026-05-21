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

Two-level NOT-AND-OR implementation. $x_3$ is shared: goes directly to the first AND and through NOT to the second.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    and1 = logic.And(inputs=2).right()
    d.move_from(and1.in1, dy=-4.5)
    and2 = logic.And(inputs=2).right().anchor('in1')
    d.move_from(and1.out, dy=-(and1.out.y - and2.out.y) / 2)
    or_g = logic.Or(inputs=2).right()
    logic.Line().at(and1.out).toy(or_g.in1)
    logic.Line().at(and2.out).toy(or_g.in2)
    logic.Line().right(0.5).at(or_g.out).label('$f$', 'right')
    # x2' via NOT -> and1.in1
    d.move_from(and1.in1, dx=-1.5)
    not2 = logic.Not().right().anchor('out')
    logic.Line().right().at(not2.out).tox(and1.in1)
    logic.Line().left(0.5).at(not2.in1).label('$x_2$', 'left')
    # x3' via NOT -> and2.in2
    d.move_from(and2.in2, dx=-1.5)
    not3 = logic.Not().right().anchor('out')
    logic.Line().right().at(not3.out).tox(and2.in2)
    # shared x3: stem with junction at centre
    x3_stem = logic.Line().down().at(and1.in2).toy(not3.in1)
    with d.hold():
        logic.Dot().at(x3_stem.center)
        logic.Line().left().at(x3_stem.center).tox(not2.in1).label('$x_3$', 'left')
    logic.Line().left().at(x3_stem.end).tox(not3.in1)
    # x1 direct -> and2.in1
    logic.Line().left().at(and2.in1).tox(not2.in1).label('$x_1$', 'left')
    sd_save(d, 'sop_specific.svg')
```

---

## Specific NAND — $f = x_2'x_3 + x_1 x_3'$

NAND-NAND equivalent: AND gates replaced by NAND, OR gate replaced by NAND. NOT gates remain.

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11, color='white')
    nand1 = logic.Nand(inputs=2).right()
    d.move_from(nand1.in1, dy=-4.5)
    nand2 = logic.Nand(inputs=2).right().anchor('in1')
    d.move_from(nand1.out, dy=-(nand1.out.y - nand2.out.y) / 2)
    nand3 = logic.Nand(inputs=2).right()
    logic.Line().at(nand1.out).toy(nand3.in1)
    logic.Line().at(nand2.out).toy(nand3.in2)
    logic.Line().right(0.5).at(nand3.out).label('$f$', 'right')
    d.move_from(nand1.in1, dx=-1.5)
    not2 = logic.Not().right().anchor('out')
    logic.Line().right().at(not2.out).tox(nand1.in1)
    logic.Line().left(0.5).at(not2.in1).label('$x_2$', 'left')
    d.move_from(nand2.in2, dx=-1.5)
    not3 = logic.Not().right().anchor('out')
    logic.Line().right().at(not3.out).tox(nand2.in2)
    x3_stem = logic.Line().down().at(nand1.in2).toy(not3.in1)
    with d.hold():
        logic.Dot().at(x3_stem.center)
        logic.Line().left().at(x3_stem.center).tox(not2.in1).label('$x_3$', 'left')
    logic.Line().left().at(x3_stem.end).tox(not3.in1)
    logic.Line().left().at(nand2.in1).tox(not2.in1).label('$x_1$', 'left')
    sd_save(d, 'nand_specific.svg')
```
