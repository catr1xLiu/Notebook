# Skill: Draw Circuit Diagrams with SchemDraw

Use this skill to generate circuit diagrams for ECE124 (Digital Circuits & Systems), ECE140 (Linear Circuits), or any course requiring schematics. Output is SVG embedded in Obsidian notes.

## ⚠️ MANDATORY: Read Documentation Before Drawing

**Before writing any circuit, read the relevant sections of the local documentation:**

```
.claude/refs/schemdraw/usage/placement.rst   ← anchors, tox/toy, hold, move_from
.claude/refs/schemdraw/gallery/logicgate.rst ← half adder, full adder, SR latch, JK FF patterns
.claude/refs/schemdraw/elements/logic.rst    ← gate list, inputnots, Table, Kmap
.claude/refs/schemdraw/usage/styles.rst      ← themes, color, dark mode
```

Do not skip this step. Prior attempts without reading docs produced incorrect wire routing.

---

## Dark Mode (Obsidian)

Obsidian uses dark mode. SVGs must have **white strokes on a transparent background**.

**Do NOT** use the matplotlib backend for final SVGs — it adds a white background rectangle.

Use the SVG backend with `color='white'`:

```python
import matplotlib
matplotlib.use('Agg')          # headless; needed for PNG verification only
import schemdraw
from schemdraw import logic    # use `from schemdraw import logic`, NOT `import schemdraw.logic`

MEDIA = '../CE1B/ECE124 - Digital Circuits & Systems/media/'

def my_circuit(d):
    # ... circuit drawing code ...
    pass

# PNG: matplotlib backend, black strokes — for visual verification only
with schemdraw.Drawing() as d:
    d.config(unit=0.5, fontsize=11)
    my_circuit(d)
    d.save(MEDIA + 'circuit.png')

# SVG: svg backend, white strokes, transparent bg — this goes in Obsidian
schemdraw.use('svg')
with schemdraw.Drawing(file=MEDIA + 'circuit.svg') as d:
    d.config(unit=0.5, fontsize=11, color='white')
    my_circuit(d)
```

After generating, **read the PNG** to verify correctness before declaring done.

---

## Workflow

1. Read the docs listed above.
2. Write the circuit as a function `fn(d)` that accepts a Drawing.
3. Run PNG pass (matplotlib, black) and read the PNG.
4. Fix any errors.
5. Run SVG pass (svg backend, white) once PNG is correct.
6. Embed in the note: `<img src="media/circuit.svg" alt="…" width="65%">`

Run script from the Python Image Processor directory:
```bash
cd "Python Image Processor" && uv run python /tmp/circuit.py
```

---

## Logic Gate Circuits — Critical Rules

### Import
```python
from schemdraw import logic   # NOT `import schemdraw.logic as logic`
```
Use `logic.Line()`, `logic.Wire()`, `logic.Dot()` for all wires in logic diagrams — not `elm.Line()`.

### Gate unit
Use `unit=0.5` for logic gate circuits. Gate separation is `d.unit * 2` (= 1.0).

### Wire shapes (`logic.Wire`)

| Shape | Path |
|-------|------|
| `'-|'` | Horizontal **then** vertical |
| `'|-'` | Vertical **then** horizontal |
| `'n'`  | Vertical-diagonal-vertical (N up) |
| `'N'`  | Vertical-diagonal-vertical (N down) |
| `'c'`  | Horizontal-vertical-horizontal |

### Centering output gates between two input gates

Follow the full adder pattern from `gallery/logicgate.rst`:

```python
# Place gate1 and gate2 separated by d.unit*2
gate1 = logic.And(inputs=2).right()
d.move_from(gate1.in1, dy=-2.5)
gate2 = logic.And(inputs=2).right().anchor('in1')

# Center output gate between gate1 and gate2
d.move_from(gate1.out, dy=-(gate1.out.y - gate2.out.y) / 2)
out_gate = logic.Or(inputs=2).right()

# Connect with vertical wires (gate.out.x ≈ out_gate.in.x)
logic.Line().at(gate1.out).toy(out_gate.in1)
logic.Line().at(gate2.out).toy(out_gate.in2)
```

### Shared inputs — stem + junction pattern

When an input branches to two gates (e.g. x3 → AND1.in2 directly AND → NOT → AND2.in2), use the **vertical stem + center junction** pattern from the full adder. Do NOT route `Wire('|-')` from a deep anchor back up — this creates a large ugly loop.

```python
# NOT for the shared input, placed left of the lower gate's input
d.move_from(gate2.in2, dx=-1.5)
not_gate = logic.Not().right().anchor('out')
logic.Line().right().at(not_gate.out).tox(gate2.in2)

# Stem: vertical line from upper gate input DOWN to NOT level
stem = logic.Line().down().at(gate1.in2).toy(not_gate.in1)

# Branch: dot + horizontal label at the center of the stem
with d.hold():
    logic.Dot().at(stem.center)
    logic.Line().left().at(stem.center).tox(not_input_ref).label('$x$', 'left')

# Connect stem bottom to NOT input horizontally
logic.Line().left().at(stem.end).tox(not_gate.in1)
```

### Input wires

Draw input wires FROM gate anchors going left:
```python
logic.Line().left(d.unit * 2).at(gate.in1).idot().label('A', 'left')  # with junction
logic.Line().left().at(gate.in1).tox(ref_anchor).label('B', 'left')   # align with another input
```

Use `.idot()` (dot at start = at the gate) when the same input fans to multiple places.

### `tox` / `toy` auto-direction

`logic.Line().at(A).toy(B)` and `logic.Line().at(A).tox(B)` automatically set direction — no need to specify `.up()` / `.right()` etc. when using these.

---

## Gate Reference

```python
from schemdraw import logic

logic.And(inputs=2)          # AND gate; anchors: in1, in2, out
logic.Nand(inputs=2)         # NAND gate
logic.Or(inputs=2)           # OR gate
logic.Nor(inputs=2)          # NOR gate
logic.Xor(inputs=2)          # XOR gate
logic.Xnor(inputs=2)         # XNOR gate
logic.Not()                  # NOT gate (2-terminal, extends leads)
logic.Buf()                  # Buffer

# Pre-inverted inputs (active-low bubbles on gate inputs)
logic.Nand(inputs=3, inputnots=[1])   # bubble on in1 only
```

Gates with >2 inputs: `logic.Nand(inputs=4)` — back of gate auto-extends.

---

## Analog Element Reference — `elm.*`

```python
import schemdraw.elements as elm

elm.Resistor()       elm.Capacitor()       elm.Inductor()
elm.Diode()          elm.Zener()           elm.LED()
elm.SourceV()        elm.SourceI()         elm.Battery()
elm.BjtNpn()         elm.NFet()            elm.Opamp()
elm.Line()           elm.Wire('|-')        elm.Dot()
elm.Ground()         elm.Gap()
```

Analog circuits: use `unit=3`, `fontsize=12`. Logic circuits: `unit=0.5`, `fontsize=11`.

---

## Placement API

| Method | Effect |
|--------|--------|
| `.right()` / `.left()` / `.up()` / `.down()` | Set direction |
| `.at(anchor)` | Start at anchor |
| `.anchor('name')` | Attach named anchor to current position |
| `.tox(anchor)` | Extend to anchor's x (auto-sets direction) |
| `.toy(anchor)` | Extend to anchor's y (auto-sets direction) |
| `.dot()` / `.idot()` | Junction dot at end / start |
| `.hold()` | Place without moving cursor |
| `d.move_from(anchor, dx=, dy=)` | Move cursor relative to anchor |
| `d.hold()` context manager | Save/restore cursor position |

---

## Labels

```python
elm.Resistor().label('$R_1$')                    # top (default)
elm.Resistor().label('$100\,\Omega$', loc='bot') # bottom
logic.Line().at(gate.in1).left().label('A', 'left')  # on wire end
```

---

## Verified Examples

### Full Adder (from official docs — use as layout reference)

```python
with schemdraw.Drawing() as d:
    d.config(unit=0.5)
    X1 = logic.Xor()
    A = logic.Line().left(d.unit*2).at(X1.in1).idot().label('A', 'left')
    B = logic.Line().left().at(X1.in2).dot()
    logic.Line().left().label('B', 'left')
    logic.Line().right().at(X1.out).idot()
    X2 = logic.Xor().anchor('in1')
    C = logic.Line().down(d.unit*2).at(X2.in2)
    with d.hold():
        logic.Dot().at(C.center)
        logic.Line().tox(A.end).label('C$_{in}$', 'left')
    A1 = logic.And().right().anchor('in1')
    logic.Wire('-|').at(A1.in2).to(X1.out)
    d.move_from(A1.in2, dy=-d.unit*2)
    A2 = logic.And().right().anchor('in1')
    logic.Wire('-|').at(A2.in1).to(A.start)
    logic.Wire('-|').at(A2.in2).to(B.end)
    d.move_from(A1.out, dy=-(A1.out.y-A2.out.y)/2)
    O1 = logic.Or().right().label('C$_{out}$', 'right')
    logic.Line().at(A1.out).toy(O1.in1)
    logic.Line().at(A2.out).toy(O1.in2)
    logic.Line().at(X2.out).tox(O1.out).label('S', 'right')
```

### SOP Circuit with Shared Input (verified working)

```python
def sop(d):
    """f = x2'x3 + x1x3'"""
    and1 = logic.And(inputs=2).right()
    d.move_from(and1.in1, dy=-2.5)
    and2 = logic.And(inputs=2).right().anchor('in1')
    d.move_from(and1.out, dy=-(and1.out.y - and2.out.y) / 2)
    or_g = logic.Or(inputs=2).right()
    logic.Line().at(and1.out).toy(or_g.in1)
    logic.Line().at(and2.out).toy(or_g.in2)
    logic.Line().right(0.5).at(or_g.out).label('$f$', 'right')

    d.move_from(and1.in1, dx=-1.5)
    not2 = logic.Not().right().anchor('out')
    logic.Line().right().at(not2.out).tox(and1.in1)
    logic.Line().left(0.5).at(not2.in1).label('$x_2$', 'left')

    d.move_from(and2.in2, dx=-1.5)
    not3 = logic.Not().right().anchor('out')
    logic.Line().right().at(not3.out).tox(and2.in2)

    # Stem + center junction for shared x3 input
    x3_stem = logic.Line().down().at(and1.in2).toy(not3.in1)
    with d.hold():
        logic.Dot().at(x3_stem.center)
        logic.Line().left().at(x3_stem.center).tox(not2.in1).label('$x_3$', 'left')
    logic.Line().left().at(x3_stem.end).tox(not3.in1)

    logic.Line().left().at(and2.in1).tox(not2.in1).label('$x_1$', 'left')
```

### Voltage Divider (ECE140)

```python
import schemdraw
import schemdraw.elements as elm

with schemdraw.Drawing(file='../media/voltage_divider.svg') as d:
    d.config(unit=3, fontsize=12, color='white')  # white for dark mode
    V1 = elm.SourceV().up().label('$V_s$')
    elm.Line().right()
    R1 = elm.Resistor().down().label('$R_1$').dot()
    with d.hold():
        elm.Line().right(d.unit * 0.5)
        elm.Gap().down().label(['$+$', '$V_{out}$', '$-$'])
        elm.Line().left(d.unit * 0.5)
    R2 = elm.Resistor().down().label('$R_2$')
    elm.Line().left().tox(V1.start)
    elm.Line().up().toy(V1.start)
```
