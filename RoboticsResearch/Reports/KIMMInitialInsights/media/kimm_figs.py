import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Patch

from pathlib import Path
OUT = str(Path(__file__).resolve().parent) + "/"
C1, C2, C3 = "#2a78d6", "#eb6834", "#1baf7a"
INK, INK2, GRID = "#0b0b0b", "#52514e", "#e4e3df"
plt.rcParams.update({
    "font.family": "DejaVu Sans", "font.size": 8.5, "axes.edgecolor": INK2,
    "axes.labelcolor": INK, "xtick.color": INK2, "ytick.color": INK2,
    "axes.spines.top": False, "axes.spines.right": False, "axes.linewidth": 0.6,
    "pdf.fonttype": 42,
})

def bars(ax, cats, s1, s2, l1, l2, title, ylabel):
    x = np.arange(len(cats)); w = 0.36; gap = 0.02
    b1 = ax.bar(x - w/2 - gap/2, s1, w, color=C1, label=l1, zorder=3)
    b2 = ax.bar(x + w/2 + gap/2, s2, w, color=C2, label=l2, zorder=3)
    for bb in (b1, b2):
        for r in bb:
            v = r.get_height()
            ax.text(r.get_x()+r.get_width()/2, v+1.5, f"{v:.0f}" if v>=10 else f"{v:.1f}", ha="center", va="bottom", fontsize=6.3, color=INK)
    ax.set_xticks(x); ax.set_xticklabels(cats, fontsize=6.5)
    ax.set_ylim(0, 118); ax.set_yticks([0, 25, 50, 75, 100])
    ax.yaxis.grid(True, color=GRID, lw=0.6, zorder=0); ax.set_axisbelow(True)
    ax.set_title(title, loc="left", fontsize=7.6, color=INK, fontweight="bold")
    ax.set_ylabel(ylabel, fontsize=7)
    ax.legend(frameon=False, loc="upper left", bbox_to_anchor=(0, 1.02), fontsize=6.3, ncol=2, handlelength=0.9, columnspacing=0.8)

fig, (a, b) = plt.subplots(1, 2, figsize=(4.7, 2.15), gridspec_kw={"width_ratios": [1, 1.3]})
bars(a, ["MVTec\nAD", "VisA", "Real-\nIAD"], [98.4, 98.7, 98.8], [69.3, 53.2, 42.8],
     "Pixel-AUROC", "Pixel-AP", "(a) Dinomaly: rank vs. precision", "score (%)")
bars(b, ["All\n(best)", "Sheet\nmetal", "Can\n(shiny)", "Base-\nline"],
     [53.8, 71.0, 1.9, 3.7], [51.4, 70.9, 0.8, 3.4],
     "Train lighting", "Mixed lighting", "(b) MVTec AD 2 masks", "SegF1 (%)")
fig.tight_layout(w_pad=0.8)
fig.savefig(OUT + "kimm_heatmap_reliability.pdf", bbox_inches="tight")
fig.savefig(OUT + "kimm_heatmap_reliability.png", dpi=300, bbox_inches="tight")

# ---- Figure 2: feature scale vs sensor noise (log scale, micrometres) ----
fig, ax = plt.subplots(figsize=(2.75, 2.15))
feats = [
    ("Roughness Ra", 0.1, 3.2, False),
    ("Steps (est.)", 1, 50, True),
    ("Micro-burrs", 11, 23, False),
    ("Blanking burrs", 50, 350, False),
    ("Cast burrs", 620, 960, False),
]
sensors = [
    ("Line profiler", 0.4, 0.4),
    ("Zivid 2", 55, 55),
    ("Photoneo S", 50, 100),
    ("RealSense D405", 100, 10000),
]
rows = feats + [None] + sensors
y = 0
labels, ys = [], []
for r in rows:
    if r is None:
        y += 0.6; continue
    if len(r) == 4:
        name, lo, hi, est = r
        ax.barh(y, hi - lo, left=lo, height=0.55, color=C1, alpha=0.45 if est else 1.0,
                hatch="////" if est else None, edgecolor=C1 if est else "none", lw=0, zorder=3)
    else:
        name, lo, hi = r
        if hi > lo:
            ax.plot([lo, hi], [y, y], color=C2, lw=2.0, solid_capstyle="round", zorder=3)
        ax.plot([lo], [y], "o", ms=4.5, color=C2, mec="white", mew=1.0, zorder=4)
        if hi > lo:
            ax.plot([hi], [y], "o", ms=4.5, color=C2, mec="white", mew=1.0, zorder=4)
    labels.append(name); ys.append(y); y += 1
ax.set_yticks(ys); ax.set_yticklabels(labels, fontsize=6.5)
ax.invert_yaxis()
ax.set_xscale("log"); ax.set_xlim(0.05, 20000)
ax.set_xticks([0.1, 1, 10, 100, 1000, 10000])
ax.set_xticklabels(["0.1µm", "1µm", "10µm", "0.1mm", "1mm", "10mm"], fontsize=6)
ax.xaxis.grid(True, color=GRID, lw=0.6, zorder=0); ax.set_axisbelow(True)
ax.axvspan(30, 120, color="#f3f2ee", zorder=1)
ax.text(60, 5.3, "area-3D\nnoise", ha="center", va="center", fontsize=5.6, color=INK2)
pass  # legend explained in caption
ax.set_title("(c) Feature height vs. sensor noise", loc="left", fontsize=7.6, color=INK, fontweight="bold")
fig.tight_layout()
fig.savefig(OUT + "kimm_scale_vs_sensor.pdf", bbox_inches="tight")
fig.savefig(OUT + "kimm_scale_vs_sensor.png", dpi=300, bbox_inches="tight")
print("ok")
