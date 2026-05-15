# MATH119 — Introduction Plots

Each code block saves an SVG to `media/` relative to this file. Run the setup cell first.

---

## Setup

```python
%matplotlib inline
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path

OUT = Path("media")
OUT.mkdir(exist_ok=True)

plt.rcParams.update({
    "font.size": 12,
    "figure.facecolor": "none",
    "axes.facecolor": "none",
    "text.color": "white",
    "axes.labelcolor": "white",
    "axes.edgecolor": "white",
    "xtick.color": "white",
    "ytick.color": "white",
    "grid.color": "white",
    "grid.alpha": 0.2,
    "legend.edgecolor": "white",
    "legend.labelcolor": "white",
})
SAVE = dict(dpi=300, bbox_inches="tight", transparent=True)
```

---

## Function Types

2×2 overview of the four function categories.

```python
from mpl_toolkits.mplot3d import Axes3D

fig = plt.figure(figsize=(9, 7))

# ── R → R  (scalar function) ────────────────────────────────────────────────
ax = fig.add_subplot(2, 2, 1)
x = np.linspace(-2, 2, 200)
ax.plot(x, x**3, color="white", lw=2)
for sp in ("right", "top"):
    ax.spines[sp].set_visible(False)
ax.spines["left"].set_position("zero")
ax.spines["bottom"].set_position("zero")
for sp in ("left", "bottom"):
    ax.spines[sp].set_color("white")
ax.set_xlim(-2.3, 2.3)
ax.set_ylim(-2.3, 2.3)
ax.set_xticks([])
ax.set_yticks([])
ax.text(2.05, -0.2, "$x$", fontsize=10, color="white")
ax.text(0.1, 2.1, "$y$", fontsize=10, color="white")
ax.set_title(r"$\mathbb{R}\to\mathbb{R}$ — scalar function", fontsize=10)
ax.set_facecolor("none")

# ── Rⁿ → R  (scalar field) — 3-D mesh heatmap ──────────────────────────────
ax3d = fig.add_subplot(2, 2, 2, projection="3d")
s = np.linspace(-2, 2, 28)
XS, YS = np.meshgrid(s, s)
ZS = np.exp(-(XS**2 + YS**2) / 2)
ax3d.plot_surface(XS, YS, ZS, cmap="plasma",
                  linewidth=0.3, edgecolors="white", alpha=0.9)
ax3d.xaxis.pane.fill = False
ax3d.yaxis.pane.fill = False
ax3d.zaxis.pane.fill = False
ax3d.xaxis.pane.set_alpha(0)
ax3d.yaxis.pane.set_alpha(0)
ax3d.zaxis.pane.set_alpha(0)
ax3d.tick_params(colors="white", labelsize=6)
ax3d.set_xlabel("$x_1$", fontsize=9, color="white")
ax3d.set_ylabel("$x_2$", fontsize=9, color="white")
ax3d.set_zlabel("$f$",   fontsize=9, color="white")
ax3d.set_title(r"$\mathbb{R}^n\to\mathbb{R}$ — scalar field",
               fontsize=10, color="white")

# ── Rⁿ → Rⁿ  (vector field) — arrows colored by magnitude ──────────────────
ax = fig.add_subplot(2, 2, 3)
gx = gy = np.linspace(-2, 2, 9)
GX, GY = np.meshgrid(gx, gy)
U  = -GY
Vv =  GX * 0.8 + np.sin(GY)      # asymmetric → varying magnitude
M  = np.hypot(U, Vv) + 1e-8
q  = ax.quiver(GX, GY, U / M, Vv / M, M,
               cmap="plasma", scale=13, alpha=0.9)
fig.colorbar(q, ax=ax, label="magnitude", fraction=0.046, pad=0.04)
ax.axhline(0, color="white", lw=0.5)
ax.axvline(0, color="white", lw=0.5)
ax.set_xlabel("$x_1$", fontsize=10)
ax.set_ylabel("$x_2$", fontsize=10, rotation=0, labelpad=8)
ax.set_title(r"$\mathbb{R}^n\to\mathbb{R}^n$ — vector field", fontsize=10)
ax.set_facecolor("none")

# ── R → Rⁿ  (vector function) — parametric dots colored by x ───────────────
ax = fig.add_subplot(2, 2, 4)
t_ = np.linspace(0, 1, 400)
y1_ = np.cos(2 * np.pi * t_)
y2_ = np.sin(2 * np.pi * t_)
sc  = ax.scatter(y1_, y2_, c=t_, cmap="plasma", s=18, alpha=0.85, zorder=2)
cbar = fig.colorbar(sc, ax=ax, fraction=0.046, pad=0.04)
cbar.set_label("$x$  (0 → 1)")
ax.set_aspect("equal")
ax.grid(True)
ax.set_xlabel("$y_1$", fontsize=10)
ax.set_ylabel("$y_2$", fontsize=10, rotation=0, labelpad=8)
ax.set_title(r"$\mathbb{R}\to\mathbb{R}^n$ — vector function", fontsize=10)
ax.set_facecolor("none")

fig.tight_layout(pad=1.8)
fig.savefig(OUT / "function_types.svg", **SAVE)
print("saved function_types.svg")
```

---

## Level Curves — $f(x,y) = x^2 + y^2$ (circles)

Level sets at $c = 1, 4, 9$ are concentric circles.

```python
x = y = np.linspace(-3.5, 3.5, 400)
X, Y = np.meshgrid(x, y)

fig, ax = plt.subplots(figsize=(4, 4))
cs = ax.contour(X, Y, X**2 + Y**2, levels=[1, 4, 9],
                colors=["#42A5F5", "#FFA726", "#66BB6A"], linewidths=2)
ax.clabel(cs, inline=True, fontsize=10,
          fmt={1: "$c=1$", 4: "$c=4$", 9: "$c=9$"})
ax.axhline(0, color="white", lw=0.7)
ax.axvline(0, color="white", lw=0.7)
ax.set_aspect("equal")
ax.grid(True)
ax.set_xlabel("$x$")
ax.set_ylabel("$y$", rotation=0, labelpad=10)
ax.set_title(r"$f(x,y)=x^2+y^2$")

fig.tight_layout()
fig.savefig(OUT / "level_curves_circles.svg", **SAVE)
print("saved level_curves_circles.svg")
```

---

## Level Curves — $f(x,y) = 4x^2 + y^2$ (ellipses)

Level sets at $c = 1, 4, 9$ are concentric ellipses elongated along $y$.

```python
x = np.linspace(-2.5, 2.5, 400)
y = np.linspace(-3.5, 3.5, 400)
X, Y = np.meshgrid(x, y)

fig, ax = plt.subplots(figsize=(4, 4))
cs = ax.contour(X, Y, 4 * X**2 + Y**2, levels=[1, 4, 9],
                colors=["#42A5F5", "#FFA726", "#66BB6A"], linewidths=2)
ax.clabel(cs, inline=True, fontsize=10,
          fmt={1: "$c=1$", 4: "$c=4$", 9: "$c=9$"})
ax.axhline(0, color="white", lw=0.7)
ax.axvline(0, color="white", lw=0.7)
ax.set_aspect("equal")
ax.grid(True)
ax.set_xlabel("$x$")
ax.set_ylabel("$y$", rotation=0, labelpad=10)
ax.set_title(r"$f(x,y)=4x^2+y^2$")

fig.tight_layout()
fig.savefig(OUT / "level_curves_ellipses.svg", **SAVE)
print("saved level_curves_ellipses.svg")
```

---

## Level Curves — $f(x,y) = x^2 - y^2$ (hyperbolas)

$k > 0$ opens left/right; $k < 0$ opens up/down; $k = 0$ gives the asymptotic diagonals.

```python
from matplotlib.lines import Line2D

x = y = np.linspace(-4, 4, 600)
X, Y = np.meshgrid(x, y)
Z = X**2 - Y**2

fig, ax = plt.subplots(figsize=(5, 4.5))

cs_pos  = ax.contour(X, Y, Z, levels=[1, 4, 9, 16],
                     colors=["#FFA726"], linewidths=2)
ax.clabel(cs_pos, inline=True, fontsize=8,
          fmt={1: "$k=1$", 4: "$k=4$", 9: "$k=9$", 16: "$k=16$"})

cs_zero = ax.contour(X, Y, Z, levels=[0],
                     colors=["white"], linewidths=1.5, linestyles="--")
ax.clabel(cs_zero, inline=True, fontsize=8, fmt={0: "$k=0$"})

cs_neg  = ax.contour(X, Y, Z, levels=[-16, -9, -4, -1],
                     colors=["#42A5F5"], linewidths=2, linestyles="solid")
ax.clabel(cs_neg, inline=True, fontsize=8,
          fmt={-16: "$k=-16$", -9: "$k=-9$", -4: "$k=-4$", -1: "$k=-1$"})

ax.axhline(0, color="white", lw=0.7)
ax.axvline(0, color="white", lw=0.7)
ax.set_xlim(-4, 4)
ax.set_ylim(-4, 4)
ax.set_aspect("equal")
ax.grid(True)
ax.set_xlabel("$x$")
ax.set_ylabel("$y$", rotation=0, labelpad=10)
ax.set_title(r"$f(x,y)=x^2-y^2$")

legend_elements = [
    Line2D([0], [0], color="#FFA726", lw=2, label="$k > 0$ (opens left/right)"),
    Line2D([0], [0], color="white",   lw=1.5, ls="--", label="$k = 0$ (asymptotes)"),
    Line2D([0], [0], color="#42A5F5", lw=2, label="$k < 0$ (opens up/down)"),
]
ax.legend(handles=legend_elements, loc="upper right", fontsize=9)

fig.tight_layout()
fig.savefig(OUT / "level_curves_hyperbolas.svg", **SAVE)
print("saved level_curves_hyperbolas.svg")
```
