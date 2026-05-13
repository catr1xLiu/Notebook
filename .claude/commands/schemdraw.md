# Skill: Draw Circuit Diagrams with SchemDraw

Use this skill to generate circuit diagrams for ECE124 (Digital Circuits & Systems), ECE140 (Linear Circuits), or any course requiring schematics. Output is SVG, embedded directly in Obsidian notes.

## Workflow

1. **Write a Python script** with the circuit code (save as a temp file, e.g. `/tmp/circuit_name.py`).
2. **Run it** from the repo root:
   ```bash
   cd "Python Image Processor" && uv run python /tmp/circuit_name.py
   ```
3. The script saves `output.svg` to the target `media/` folder.
4. **Embed** in the Obsidian note:
   ```
   <img src="circuit_name.svg" alt="description" width="70%">
   ```
   SVG files embed natively in Obsidian — no conversion needed.

---

## Script Template

```python
import schemdraw
import schemdraw.elements as elm

schemdraw.use('svg')  # headless, no GUI, no matplotlib needed

with schemdraw.Drawing(file='../CE1B/ECE124 - Digital Circuits & Systems/media/circuit_name.svg') as d:
    d.config(unit=3, fontsize=12)
    # ... add elements here ...
```

For **logic gates**, add:
```python
import schemdraw.logic as logic
```
Then use `logic.And()`, `logic.Or()`, etc. (see below).

---

## Element Reference

### Passive (Two-Terminal) — `elm.*`

| Class | Description |
|---|---|
| `Resistor()` | IEEE zigzag resistor |
| `ResistorIEC()` | IEC rectangle resistor |
| `Capacitor()` | Non-polar capacitor |
| `Capacitor2()` | Curved-plate capacitor |
| `CapacitorVar()` | Variable capacitor |
| `Inductor()` | Inductor (loops) |
| `Inductor2()` | Inductor (arcs) |
| `Diode()` | Standard diode |
| `Zener()` | Zener diode |
| `LED()` | LED |
| `Schottky()` | Schottky diode |

### Sources — `elm.*`

| Class | Description |
|---|---|
| `SourceV()` | Voltage source (circle, +/−) |
| `SourceI()` | Current source (circle, arrow) |
| `SourceControlledV()` | Dependent voltage source (diamond) |
| `SourceControlledI()` | Dependent current source (diamond) |
| `Battery()` | Battery |
| `MeterV()` | Voltmeter |
| `MeterI()` | Ammeter |

### Lines & Connections — `elm.*`

| Class | Description |
|---|---|
| `Line()` | Plain wire |
| `Wire('|-')` | L-shaped wire, horizontal then vertical |
| `Wire('-|')` | L-shaped wire, vertical then horizontal |
| `Wire('n')` | N-shaped (zig right-up-right) |
| `Wire('N')` | N-shaped (zig right-down-right) |
| `Dot()` | Junction dot |
| `Ground()` | Ground (earth symbol) |
| `GroundSignal()` | Signal ground |
| `Vdd()` | Vdd power rail |
| `Vss()` | Vss power rail |
| `NoConnect()` | ×-mark (no connection) |
| `Label()` | Floating text label |
| `Gap()` | Open-circuit gap with optional label |

### Logic Gates — `logic.*` (import: `import schemdraw.logic as logic`)

| Class | Description |
|---|---|
| `logic.And(inputs=2)` | AND gate |
| `logic.Nand(inputs=2)` | NAND gate |
| `logic.Or(inputs=2)` | OR gate |
| `logic.Nor(inputs=2)` | NOR gate |
| `logic.Xor(inputs=2)` | XOR gate |
| `logic.Xnor(inputs=2)` | XNOR gate |
| `logic.Not()` | NOT (inverter bubble) |
| `logic.Buf()` | Buffer |

Gate anchors: `.in1`, `.in2`, `.in3`, … `.out`

### Flip-Flops & MSI — `elm.*`

| Class | Description |
|---|---|
| `DFlipFlop()` | D flip-flop |
| `JKFlipFlop()` | JK flip-flop |
| `Multiplexer()` | MUX |
| `Ic()` | Generic IC box |

### Transistors — `elm.*`

| Class | Description |
|---|---|
| `BjtNpn()` | NPN BJT |
| `BjtPnp()` | PNP BJT |
| `NFet()` | N-channel MOSFET |
| `PFet()` | P-channel MOSFET |

BJT anchors: `.base`, `.collector`, `.emitter`  
MOSFET anchors: `.gate`, `.drain`, `.source`

### Opamp — `elm.*`

```python
op = elm.Opamp()
# anchors: .in1 (−), .in2 (+), .out, .vs, .vd
```

---

## Placement API

All placement methods **chain** on the element:

| Method | Effect |
|---|---|
| `.right()` / `.left()` / `.up()` / `.down()` | Set drawing direction |
| `.length(n)` | Override element length (default = `d.unit`) |
| `.at(anchor)` | Start element at a specific anchor point |
| `.anchor('name')` | Which of this element's anchors attaches to the current drawing position |
| `.tox(anchor)` | Extend to the x-coordinate of `anchor` |
| `.toy(anchor)` | Extend to the y-coordinate of `anchor` |
| `.endpoints(p1, p2)` | Force exact start and end points |
| `.flip()` | Mirror across the element axis |
| `.reverse()` | Swap start and end (reverses current direction) |
| `.dot()` | Add a junction dot at the end |
| `.idot()` | Add a junction dot at the start |
| `.hold()` | Place element but don't advance drawing position |

**Save and restore position:**
```python
with d.hold():
    # draw a branch; position restores after the block
    elm.Line().down()
    elm.Ground()
```

**Manual move:**
```python
d.move_from(element.anchor_name, dx=0, dy=-1)
```

---

## Labels

```python
elm.Resistor().label('R1')                        # above (default)
elm.Resistor().label('100Ω', loc='bot')            # below
elm.Capacitor().label('$1\,\mu F$', loc='right')  # right, with LaTeX
elm.Line().label(['+', '$V_o$', '−'], loc='bot')  # evenly-spaced along wire
```

`loc` options: `'top'` (default), `'bot'`, `'left'`, `'right'`, `'center'`, or anchor name.  
LaTeX math: wrap in `$...$`.

---

## Complete Examples

### Voltage Divider (ECE140)

```python
import schemdraw
import schemdraw.elements as elm

schemdraw.use('svg')

with schemdraw.Drawing(file='../CE1B/ECE140 - Linear Circuits/media/voltage_divider.svg') as d:
    d.config(unit=3, fontsize=12)
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

### S-R Latch (ECE124)

```python
import schemdraw
import schemdraw.elements as elm
import schemdraw.logic as logic

schemdraw.use('svg')

with schemdraw.Drawing(file='../CE1B/ECE124 - Digital Circuits & Systems/media/sr_latch.svg') as d:
    d.config(unit=0.5, fontsize=11)
    g1 = logic.Nor()
    d.move_from(g1.in1, dy=-2.5)
    g2 = logic.Nor().anchor('in1')
    g1out = elm.Line().right(.25).at(g1.out)
    elm.Wire('N', k=.5).at(g2.in1).to(g1out.end).dot()
    g2out = elm.Line().right(.25).at(g2.out)
    elm.Wire('N', k=.5).at(g1.in2).to(g2out.end).dot()
    elm.Line().at(g1.in1).left(.5).label('R', 'left')
    elm.Line().at(g2.in2).left(.5).label('S', 'left')
    elm.Line().at(g1.out).right(.75).label('Q', 'right')
    elm.Line().at(g2.out).right(.75).label(r'$\overline{Q}$', 'right')
```

### Half Adder (ECE124)

```python
import schemdraw
import schemdraw.elements as elm
import schemdraw.logic as logic

schemdraw.use('svg')

with schemdraw.Drawing(file='../CE1B/ECE124 - Digital Circuits & Systems/media/half_adder.svg') as d:
    d.config(unit=0.5)
    S = logic.Xor().label('S', 'right')
    elm.Line().left(d.unit * 2).at(S.in1).idot().label('A', 'left')
    B = elm.Line().left().at(S.in2).dot()
    elm.Line().left().label('B', 'left')
    elm.Line().down(d.unit * 3).at(S.in1)
    C = logic.And().right().anchor('in1').label('C', 'right')
    elm.Wire('|-').at(B.end).to(C.in2)
```

---

## Tips

- `d.config(unit=N)` — default element length; use `unit=0.5` for compact logic diagrams, `unit=3` for spacious analog circuits.
- SVG output scales losslessly — use `width="80%"` for wide diagrams, `"50%"` for small ones.
- For multi-output nodes: place the first branch with `.dot()`, then use `.at(node.end)` or `d.hold()` for branches.
- `d.unit` accesses the current unit value inside the `with` block (e.g., `elm.Line().right(d.unit * 2)`).
- Always run with `schemdraw.use('svg')` — avoids matplotlib GUI pop-up in headless terminal.
