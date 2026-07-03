---
tags:
  - ECE124
  - schemdraw
  - circuits
---

> [!info] Circuit Component Library
> Reusable SchemDraw scripts for all standard ECE124 component symbols. Running any section cell regenerates that group's files under `media/components/`. Cells share a kernel — run **Setup** first, then any section in order. Each cell saves both PNG (for inspection) and SVG (black on transparent, for embedding in notes).
>
> Embed a component in any note with:
> `<img src="media/components/and_gate.svg" alt="AND gate" width="8%">`

## Setup

```python
import matplotlib
matplotlib.use('Agg')
import schemdraw
import schemdraw.elements as elm
from schemdraw import logic
from pathlib import Path

OUT = str(Path('media/components')) + '/'
Path('media/components').mkdir(parents=True, exist_ok=True)
print(f"Output → {Path('media/components').resolve()}")
```

---

> [!example] Logic Gates
> AND, OR, NAND, NOR, XOR, XNOR — bare gate shape with 0.5-unit wire stubs, **no labels**, so they compose cleanly into larger circuits.

```python
GATE_SPECS = [
    ('and_gate',  logic.And),
    ('or_gate',   logic.Or),
    ('nand_gate', logic.Nand),
    ('nor_gate',  logic.Nor),
    ('xor_gate',  logic.Xor),
    ('xnor_gate', logic.Xnor),
]

def draw_gate(d, cls):
    d.config(unit=0.5, fontsize=12)
    g = cls(inputs=2)
    logic.Line().left(0.5).at(g.in1)
    logic.Line().left(0.5).at(g.in2)
    logic.Line().right(0.5).at(g.out)

# PNG
schemdraw.use('matplotlib')
for fname, cls in GATE_SPECS:
    with schemdraw.Drawing() as d:
        draw_gate(d, cls)
        d.save(OUT + f'{fname}.png')

# SVG (black strokes, transparent background)
schemdraw.use('svg')
for fname, cls in GATE_SPECS:
    with schemdraw.Drawing(file=OUT + f'{fname}.svg') as d:
        d.config(color='black')
        draw_gate(d, cls)

print("Gates saved:", [s[0] for s in GATE_SPECS])
```

---

> [!example] Latches & Flip-Flops
> All four standard sequential elements. Pin labels (D, >, Q, $\overline{Q}$) are drawn **inside** the box by the IC element. The clock input > sits below the data input on the left; Q is above $\overline{Q}$ on the right — matching the built-in `DFlipFlop` and `JKFlipFlop` convention.
>
> | File | Inputs | Notes |
> | --- | --- | --- |
> | `d_latch` | D, EN | level-sensitive; EN not clocked (no triangle) |
> | `d_flipflop` | D, > | built-in schemdraw element |
> | `t_flipflop` | T, > | custom `elm.Ic` |
> | `jk_flipflop` | J, >, K | built-in schemdraw element |

```python
# IcPin ordering: within a side, first listed pin → bottom, last listed → top.
# So to put D at top / EN at bottom: list [EN, D].
# To put Q at top / Qbar at bottom: list [Qbar, Q].

def draw_d_latch(d):
    d.config(unit=3, fontsize=12)
    elm.Ic(pins=[
        elm.IcPin(name='EN', side='left'),
        elm.IcPin(name='D',  side='left'),
        elm.IcPin(name=r'$\overline{Q}$', side='right', anchorname='QBAR'),
        elm.IcPin(name='Q',  side='right'),
    ], edgepadW=0.5, edgepadH=0.5, pinspacing=1.2)

def draw_dff(d):
    d.config(unit=3, fontsize=12)
    elm.DFlipFlop()

def draw_tff(d):
    d.config(unit=3, fontsize=12)
    elm.Ic(pins=[
        elm.IcPin(name='>',  side='left'),
        elm.IcPin(name='T',  side='left'),
        elm.IcPin(name=r'$\overline{Q}$', side='right', anchorname='QBAR'),
        elm.IcPin(name='Q',  side='right'),
    ], edgepadW=0.5, edgepadH=0.5, pinspacing=1.2)

def draw_jkff(d):
    d.config(unit=3, fontsize=12)
    elm.JKFlipFlop()

FF_SPECS = [
    ('d_latch',     draw_d_latch),
    ('d_flipflop',  draw_dff),
    ('t_flipflop',  draw_tff),
    ('jk_flipflop', draw_jkff),
]

# PNG
schemdraw.use('matplotlib')
for fname, fn in FF_SPECS:
    with schemdraw.Drawing() as d:
        fn(d)
        d.save(OUT + f'{fname}.png')

# SVG
schemdraw.use('svg')
for fname, fn in FF_SPECS:
    with schemdraw.Drawing(file=OUT + f'{fname}.svg') as d:
        d.config(color='black')
        fn(d)

print("Flip-flops saved:", [s[0] for s in FF_SPECS])
```

---

> [!example] Multiplexers
> 2:1, 4:1, and 8:1 multiplexers as **trapezoid** shapes (`elm.Multiplexer`). No labels — bare stubs only, like the gates. Data inputs on the left ('L'), select lines on the top ('T'), output on the right ('R'). `edgepadH=-0.5` tightens the 2:1; larger values add padding for the bigger muxes.

```python
def draw_mux_2to1(d):
    d.config(unit=3, fontsize=11)
    elm.Multiplexer(pins=[
        elm.IcPin(name='',  side='L'),   # data inputs (no label)
        elm.IcPin(name='',  side='L'),
        elm.IcPin(name='S', side='T'),   # select (labeled)
        elm.IcPin(name='',  side='R'),   # output (no label)
    ], edgepadH=-0.5, edgepadW=0.5)

def draw_mux_4to1(d):
    d.config(unit=3, fontsize=11)
    elm.Multiplexer(pins=[
        elm.IcPin(name='',   side='L'),  # data inputs (×4, no label)
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='S0', side='T'),  # selects (labeled)
        elm.IcPin(name='S1', side='T'),
        elm.IcPin(name='',   side='R'),  # output (no label)
    ], edgepadH=0.5, edgepadW=0.5)

def draw_mux_8to1(d):
    d.config(unit=3, fontsize=10)
    elm.Multiplexer(pins=[
        elm.IcPin(name='',   side='L'),  # data inputs (×8, no label)
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='',   side='L'),
        elm.IcPin(name='S0', side='T'),  # selects (labeled)
        elm.IcPin(name='S1', side='T'),
        elm.IcPin(name='S2', side='T'),
        elm.IcPin(name='',   side='R'),  # output (no label)
    ], edgepadH=0.5, edgepadW=0.5)

MUX_SPECS = [
    ('mux_2to1', draw_mux_2to1),
    ('mux_4to1', draw_mux_4to1),
    ('mux_8to1', draw_mux_8to1),
]

# PNG
schemdraw.use('matplotlib')
for fname, fn in MUX_SPECS:
    with schemdraw.Drawing() as d:
        fn(d)
        d.save(OUT + f'{fname}.png')

# SVG
schemdraw.use('svg')
for fname, fn in MUX_SPECS:
    with schemdraw.Drawing(file=OUT + f'{fname}.svg') as d:
        d.config(color='black')
        fn(d)

print("Muxes saved:", [s[0] for s in MUX_SPECS])
```

---

> [!example] Decoders
> 2-to-4 and 3-to-8 decoders. Address inputs ($A_0$–$A_2$) and enable (EN) on the left (A0 at top, EN at bottom); active-high outputs ($Y_0$–$Y_7$) on the right (Y0 at top). The box height is set by the output side (more pins), so the input pins are spaced evenly over the full height.

```python
def draw_dec_2to4(d):
    d.config(unit=3, fontsize=11)
    elm.Ic(pins=[
        elm.IcPin(name='EN', side='left'),   # bottom
        elm.IcPin(name='A1', side='left'),
        elm.IcPin(name='A0', side='left'),   # top
        elm.IcPin(name='Y3', side='right'),  # bottom
        elm.IcPin(name='Y2', side='right'),
        elm.IcPin(name='Y1', side='right'),
        elm.IcPin(name='Y0', side='right'),  # top
    ], edgepadW=0.5, edgepadH=0.5, pinspacing=1.0)

def draw_dec_3to8(d):
    d.config(unit=3, fontsize=10)
    elm.Ic(pins=[
        elm.IcPin(name='EN', side='left'),   # bottom
        elm.IcPin(name='A2', side='left'),
        elm.IcPin(name='A1', side='left'),
        elm.IcPin(name='A0', side='left'),   # top
        elm.IcPin(name='Y7', side='right'),  # bottom
        elm.IcPin(name='Y6', side='right'),
        elm.IcPin(name='Y5', side='right'),
        elm.IcPin(name='Y4', side='right'),
        elm.IcPin(name='Y3', side='right'),
        elm.IcPin(name='Y2', side='right'),
        elm.IcPin(name='Y1', side='right'),
        elm.IcPin(name='Y0', side='right'),  # top
    ], edgepadW=0.5, edgepadH=0.3, pinspacing=0.8)

DEC_SPECS = [
    ('decoder_2to4', draw_dec_2to4),
    ('decoder_3to8', draw_dec_3to8),
]

# PNG
schemdraw.use('matplotlib')
for fname, fn in DEC_SPECS:
    with schemdraw.Drawing() as d:
        fn(d)
        d.save(OUT + f'{fname}.png')

# SVG
schemdraw.use('svg')
for fname, fn in DEC_SPECS:
    with schemdraw.Drawing(file=OUT + f'{fname}.svg') as d:
        d.config(color='black')
        fn(d)

print("Decoders saved:", [s[0] for s in DEC_SPECS])
```

---

> [!example] D-Based Counters / Registers
> 3-bit and 4-bit register/counter blocks. The `slot='X/Y'` parameter on `IcPin` positions each pin at slot X out of Y total slots — slots without a pin have no stub, so $Q$ outputs align exactly with their matching $D$ inputs with no phantom stubs on the Enable / Load / Clock rows.

```python
def draw_counter_3bit(d):
    # 6 slots total: slot 1 = bottom (Clock), slot 6 = top (Enable)
    d.config(unit=3, fontsize=12)
    elm.Ic(pins=[
        elm.IcPin(name='Clock',  side='L', slot='1/6'),
        elm.IcPin(name='Load',   side='L', slot='2/6'),
        elm.IcPin(name='$D_2$',  side='L', slot='3/6'),
        elm.IcPin(name='$D_1$',  side='L', slot='4/6'),
        elm.IcPin(name='$D_0$',  side='L', slot='5/6'),
        elm.IcPin(name='Enable', side='L', slot='6/6'),
        elm.IcPin(name='$Q_2$',  side='R', slot='3/6'),  # aligns with D2
        elm.IcPin(name='$Q_1$',  side='R', slot='4/6'),  # aligns with D1
        elm.IcPin(name='$Q_0$',  side='R', slot='5/6'),  # aligns with D0
    ], edgepadW=0.5, edgepadH=0.5, pinspacing=1.0)

def draw_counter_4bit(d):
    # 7 slots total
    d.config(unit=3, fontsize=12)
    elm.Ic(pins=[
        elm.IcPin(name='Clock',  side='L', slot='1/7'),
        elm.IcPin(name='Load',   side='L', slot='2/7'),
        elm.IcPin(name='$D_3$',  side='L', slot='3/7'),
        elm.IcPin(name='$D_2$',  side='L', slot='4/7'),
        elm.IcPin(name='$D_1$',  side='L', slot='5/7'),
        elm.IcPin(name='$D_0$',  side='L', slot='6/7'),
        elm.IcPin(name='Enable', side='L', slot='7/7'),
        elm.IcPin(name='$Q_3$',  side='R', slot='3/7'),  # aligns with D3
        elm.IcPin(name='$Q_2$',  side='R', slot='4/7'),  # aligns with D2
        elm.IcPin(name='$Q_1$',  side='R', slot='5/7'),  # aligns with D1
        elm.IcPin(name='$Q_0$',  side='R', slot='6/7'),  # aligns with D0
    ], edgepadW=0.5, edgepadH=0.5, pinspacing=1.0)

CTR_SPECS = [
    ('counter_3bit', draw_counter_3bit),
    ('counter_4bit', draw_counter_4bit),
]

# PNG
schemdraw.use('matplotlib')
for fname, fn in CTR_SPECS:
    with schemdraw.Drawing() as d:
        fn(d)
        d.save(OUT + f'{fname}.png')

# SVG
schemdraw.use('svg')
for fname, fn in CTR_SPECS:
    with schemdraw.Drawing(file=OUT + f'{fname}.svg') as d:
        d.config(color='black')
        fn(d)

print("Counters saved:", [s[0] for s in CTR_SPECS])
```
