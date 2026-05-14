# MATH119 — Introduction Plots

Each code block saves an SVG to `media/` relative to this file. Run the setup cell first.

---

## Setup

```python
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path

OUT = Path(__file__).parent / "media" if "__file__" in dir() else Path("CE1B/MATH119 - Calculus 2 for Engineering/media")
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
fig, axes = plt.subplots(2, 2, figsize=(7.5, 6))

# R → R  (scalar function)
ax = axes[0, 0]
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

# Rⁿ → R  (scalar field)
ax = axes[0, 1]
rng = np.random.default_rng(42)
pts = rng.uniform(-2, 2, (60, 2))
vals = np.exp(-(pts[:, 0]**2 + pts[:, 1]**2) / 2)
ax.scatter(pts[:, 0], pts[:, 1], c=vals, cmap="coolwarm", s=50, marker="x", linewidths=2)
ax.axhline(0, color="white", lw=0.5)
ax.axvline(0, color="white", lw=0.5)
ax.set_xlabel("$x_1$", fontsize=10)
ax.set_ylabel("$x_2$", fontsize=10, rotation=0, labelpad=8)
ax.set_title(r"$\mathbb{R}^n\to\mathbb{R}$ — scalar field", fontsize=10)

# Rⁿ → Rⁿ  (vector field)
ax = axes[1, 0]
gx = gy = np.linspace(-2, 2, 8)
GX, GY = np.meshgrid(gx, gy)
U, Vv = -GY, GX
N = np.hypot(U, Vv) + 1e-8
ax.quiver(GX, GY, U / N, Vv / N, color="white", alpha=0.85, scale=12)
ax.axhline(0, color="white", lw=0.5)
ax.axvline(0, color="white", lw=0.5)
ax.set_xlabel("$x_1$", fontsize=10)
ax.set_ylabel("$x_2$", fontsize=10, rotation=0, labelpad=8)
ax.set_title(r"$\mathbb{R}^n\to\mathbb{R}^n$ — vector field", fontsize=10)

# R → Rⁿ  (vector function)
ax = axes[1, 1]
t_ = np.linspace(0, 4 * np.pi, 300)
ax.plot(np.cos(t_), np.sin(t_), color="white", lw=2)
ax.set_aspect("equal")
ax.grid(True)
ax.set_xlabel("$y_1$", fontsize=10)
ax.set_ylabel("$y_2$", fontsize=10, rotation=0, labelpad=8)
ax.set_title(r"$\mathbb{R}\to\mathbb{R}^n$ — vector function", fontsize=10)
ax.text(0.58, 0.75, r"$f(x) \Rightarrow (y_1, y_2, y_3)$",
        transform=ax.transAxes, fontsize=9, color="white")

fig.tight_layout(pad=1.5)
fig.savefig(OUT / "function_types.svg", **SAVE)
plt.close()
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
plt.close()
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
plt.close()
print("saved level_curves_ellipses.svg")
```
