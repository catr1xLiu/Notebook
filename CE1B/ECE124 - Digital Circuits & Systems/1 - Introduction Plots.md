# ECE124 — Introduction Plots

Logic gate diagrams generated with **SchemDraw**. Each cell saves an SVG to `media/`.

> **Dependency:** `pip install schemdraw matplotlib` (or use the uv environment in `Python Image Processor/`).

---

## Setup

```python
import schemdraw
import schemdraw.elements as elm
from schemdraw import logic as lg
from pathlib import Path

OUT = Path(__file__).parent / "media" if "__file__" in dir() else Path("CE1B/ECE124 - Digital Circuits & Systems/media")
OUT.mkdir(exist_ok=True)

def sd_save(d, name):
    d.save(str(OUT / name), transparent=True, dpi=300)
    print(f"saved {name}")
```

---

## AND Gate

Two-input AND gate: output is 1 only when both inputs are 1.

```python
with schemdraw.Drawing(show=False) as d:
    d.config(unit=3, fontsize=13, color="white")
    lx = d.add(elm.Line().right(1.5).label("$x$", loc="left"))
    gate = d.add(lg.And(inputs=2).anchor("in1").at(lx.end).right())
    d.add(elm.Line().at(lx.start).down(0.75).right(1.5)
         .label("$y$", loc="left").tox(gate.in2.x).toy(gate.in2.y))
    d.add(elm.Line().at(gate.out).right(1.0).label("$x \\cdot y$", loc="right"))
    sd_save(d, "and_gate.svg")
```

---

## OR Gate

Two-input OR gate: output is 1 when at least one input is 1.

```python
with schemdraw.Drawing(show=False) as d:
    d.config(unit=3, fontsize=13, color="white")
    lx = d.add(elm.Line().right(1.5).label("$x$", loc="left"))
    gate = d.add(lg.Or(inputs=2).anchor("in1").at(lx.end).right())
    d.add(elm.Line().at(lx.start).down(0.75).right(1.5)
         .label("$y$", loc="left").tox(gate.in2.x).toy(gate.in2.y))
    d.add(elm.Line().at(gate.out).right(1.0).label("$x + y$", loc="right"))
    sd_save(d, "or_gate.svg")
```

---

## NOT Gate

Inverter: output is the complement of the input.

```python
with schemdraw.Drawing(show=False) as d:
    d.config(unit=3, fontsize=13, color="white")
    d.add(elm.Line().right(1.0).label("$x$", loc="left"))
    gate = d.add(lg.Not().anchor("in1").right())
    d.add(elm.Line().at(gate.out).right(1.0).label("$x'$", loc="right"))
    sd_save(d, "not_gate.svg")
```

---

## Synthesis Circuit — $f = x_1' + x_2$

Simplified circuit after Boolean reduction: NOT gate on $x_1$ feeding into a 2-input OR gate.

```python
with schemdraw.Drawing(show=False) as d:
    d.config(unit=3, fontsize=13, color="white")
    lx1 = d.add(elm.Line().right(1.0).label("$x_1$", loc="left"))
    notg = d.add(lg.Not().anchor("in1").at(lx1.end).right())
    not_out = d.add(elm.Line().at(notg.out).right(0.5))
    org = d.add(lg.Or(inputs=2).anchor("in1").at(not_out.end).right())
    d.add(elm.Line().at(lx1.start).down(0.75).right(0.5)
         .label("$x_2$", loc="left").tox(org.in2.x).toy(org.in2.y))
    d.add(elm.Line().at(org.out).right(1.0).label("$f$", loc="right"))
    sd_save(d, "synthesis_not_or.svg")
```
