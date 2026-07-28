> [!abstract] Introduction
> ## What Quiz 3 Actually Tests

Scope: **Comparison Methods Part 1 + Part 2 only** (NPW, AW/AEC, FW, unequal lives, payback, IRR, incremental IRR). Closed book, Quiz-2 formula sheet, TI-36X Pro.

Everything on the quiz collapses into **eight recipes**. Learn the decision rule of each one — the arithmetic is calculator work.

| # | Trigger words in the question | Recipe |
|---|---|---|
| 1 | "is it desirable", "should we invest", one project | NPW $>0$ |
| 2 | "which alternative", same life | max NPW / max AW |
| 3 | "annual", "per year", "equivalent annual cost" | AW / AEC |
| 4 | "at the end of N years I will have…" | FW |
| 5 | different service lives | repeated lives / study period / AW-forever |
| 6 | "related but not mutually exclusive", "up to two" | $2^n$ enumeration → max NPW |
| 7 | "how long to pay for itself" | payback period |
| 8 | "rate of return", "IRR", MARR comparison | IRR, then **incremental** IRR |

---

> [!info] Setup
> ## Factor Toolkit — Deriving What the Formula Sheet Omits

The sheet gives only $(F/P)$, $(A/P)$, $(A/F)$, the gradients, and $CR$. The three you will actually use most are **not** on it — get them by inversion:

$$
\begin{aligned}
(P/F, i, N) &= \frac{1}{(1+i)^N} = \frac{1}{(F/P,i,N)} \\
(P/A, i, N) &= \frac{(1+i)^N - 1}{i(1+i)^N} = \frac{1}{(A/P,i,N)} \\
(F/A, i, N) &= \frac{(1+i)^N - 1}{i} = \frac{1}{(A/F,i,N)}
\end{aligned}
$$

Useful sanity checks:
- $(A/P, i, N) = (A/F, i, N) + i$ — capital recovery = sinking fund + interest.
- $(P/A, i, \infty) = 1/i$ (capitalized cost of a perpetuity).
- $(P/A)$ places the money **one period before the first payment**. An annuity running years $1 \to N$ discounts to year $0$; an annuity running years $6 \to 10$ discounts to year $5$, then needs $(P/F, i, 5)$.

#### <u>TI-36X Pro Tactics</u>

- **Irregular cash flows**: type the discounting sum directly, $\Sigma$ over $k$, or just add the terms — 4–5 terms is faster by hand than setting up $\Sigma($.
- **IRR with a uniform series**: use `num-solv` on the closed form, e.g. solve $-55000 + 13000\cdot\frac{(1+x)^8-1}{x(1+x)^8} = 0$ with a guess of $0.1$. This gives the *exact* IRR in seconds — no interpolation needed.
- **IRR with irregular flows**: use the **table** feature on $NPW(x)$, step $x$ by $0.05$ to bracket the sign change, then `num-solv` inside that bracket (a bad seed makes the solver wander).
- Keep **one factor per memory slot** ($(P/A)$ into `A`, $(P/F)$ into `B`) when several alternatives share the same $i$ and $N$ — most multi-part questions reuse the same two factors.

---

> [!fact] Recipe 1
> ## NPW — Independent / Accept-Reject

1. Draw (or mentally list) the cash flow: year 0 first cost, years $1..N$ annuity, year $N$ salvage/decommissioning.
2. Sign convention: **inflow $+$, outflow $-$**. Keep it consistent to the last line.
3. Discount everything to $t = 0$: $NPW(i) = \sum_{k=0}^{N} CF_k (P/F, i, k)$, collapsing any uniform run with $(P/A)$.
4. Decide: **$NPW > 0$ → accept** (it beats "do nothing"); $NPW < 0$ → reject.

> [!example] Example — Tutorial 4, P1
> ## Hydro Facility

$\$800{,}000$ first cost, $\$180{,}000$/yr net income for 8 years, $\$600{,}000$ net decommissioning cost at year 8, $i = 10\%$. Desirable?

> [!success]- Solution (Click to expand)
> $(P/A, 10\%, 8) = 5.3349$, $(P/F, 10\%, 8) = 0.4665$.
> $$NPW = -800{,}000 + 180{,}000(5.3349) - 600{,}000(0.4665) = -\$119{,}618$$
> $NPW < 0$ → **not desirable**. The trap is the year-8 cost: it is a *separate* $(P/F)$ term, not part of the annuity, and it is negative even though it sits where a salvage value usually sits.

---

> [!fact] Recipe 2
> ## AW / AEC — Same Answer, Annual Units

$AW = NPW \times (A/P, i, N)$. PW and AW **always** rank projects identically (for equal lives) — if they disagree, you made an arithmetic error.

Two ways to build it:
- **Convert-then-add**: turn each single amount into an annuity with $(A/P)$ or $(A/F)$, then add the existing annuities.
- **Capital recovery cost** for the first-cost-plus-salvage pair: $$CR(i) = P(A/P,i,N) - S(A/F,i,N) = (P-S)(A/P,i,N) + iS$$ Then $AW = -CR + (\text{annual net benefit})$.

Decision rules:
- Independent: **$AW > 0$ → accept**.
- Mutually exclusive: **largest AW wins**.
- **AEC** (all cash flows are costs, so everything is negative): **least annual cost wins**. Legal only if (i) all alternatives deliver the *same major benefit* and (ii) that benefit clearly outweighs the costs.

---

> [!fact] Recipe 3
> ## FW — Same Logic, Different Reference Point

$$FW(i) = \sum_{k=0}^{N} CF_k (F/P, i, N-k)$$

Exponent is $N-k$: a year-3 flow in a 30-year horizon compounds for 27 years. Accept if $FW > 0$; the ranking is identical to NPW (they differ by the constant $(F/P,i,N)$). Fastest route in practice: compute $NPW$, then $FW = NPW(F/P, i, N)$.

---

> [!fact] Recipe 4
> ## Unequal Service Lives — Pick One of Three Treatments

Comparing PW over different horizons **directly is wrong** — it is the single most common exam trap. Choose:

**(a) Repeated lives** — assume identical repetition. Horizon $=$ LCM of the lives. Re-pay the first cost at the *start* of every cycle:
$$PW_1 = -15{,}000 - 15{,}000(P/F,9\%,10) - 15{,}000(P/F,9\%,20) - 6{,}400(P/A,9\%,30)$$
Note there is **no** repurchase at year 30 (the horizon end), and the O&M annuity runs the full 30 years in one term.

**(b) AW with indefinite repetition — the shortcut.** If cash flows repeat unchanged forever, the AW of one cycle equals the AW of all cycles, so **skip the LCM entirely**:
$$AW_1 = -15{,}000(A/P,9\%,10) - 6{,}400 = -\$8{,}737 \qquad AW_2 = -25{,}000(A/P,9\%,15) - 5{,}625 = -\$8{,}726$$
Same winner as the 30-year PW comparison, three lines instead of ten. **Use this whenever the question says "repeated indefinitely".**

**(c) Study period** — repetition assumption fails. Truncate everyone at $T$ (usually the shortest life) and credit the longer-lived asset with a **salvage value at $T$**:
$$PW_2 = -25{,}000 - 5{,}625(P/A,9\%,10) + 5{,}000(P/F,9\%,10)$$

#### <u>Break-Even Salvage Value</u>

If the salvage at $T$ is unknown, solve for the $S$ that makes the alternatives equal:
1. Set $PW_1 = PW_2$ with $S$ as the unknown in the long-lived alternative.
2. Solve: $-56{,}073 = -25{,}000 - 5{,}625(P/A,9\%,10) + S(P/F,9\%,10) \Rightarrow S = \$11{,}834$.
3. Compare to the realistic reference $S^*$ ($\$5{,}000$ here). **Required $S >$ realistic $S^*$ → that alternative cannot get there → choose the other one.** Here $11{,}834 > 5{,}000$, so **alternative 1 wins**.

---

> [!fact] Recipe 5
> ## Related but Not Mutually Exclusive → Enumerate

1. Number of combinations $= 2^n$ **including do-nothing** ($n$ = number of proposals).
2. Strike out infeasible sets: budget/resource limits ("at most two"), and **contingency** (B needs A ⇒ delete every set with B but no A).
3. For each surviving set, **add first costs and add annual savings**.
4. Sort by increasing first cost (needed anyway if you continue with incremental IRR).
5. Compute NPW of each; **largest NPW wins**; do-nothing ($NPW = 0$) is always on the table.

> [!example] Example — Tutorial 4, P3
> ## Kool Karavans

A: $\$40$k / $\$20$k-yr. B: $\$110$k / $\$30$k-yr. C: $\$130$k / $\$45$k-yr. $N = 4$, MARR $= 12\%$, at most two proposals.

> [!success]- Solution (Click to expand)
> $2^3 = 8$ combos, minus A+B+C (violates "at most two") $= 7$ alternatives. $(P/A,12\%,4) = 3.0373$.
>
> | Alt | First cost | Annual saving | NPW |
> |---|---|---|---|
> | Do nothing | 0 | 0 | 0 |
> | A | 40,000 | 20,000 | $+20{,}747$ |
> | B | 110,000 | 30,000 | $-18{,}880$ |
> | C | 130,000 | 45,000 | $+6{,}681$ |
> | A+B | 150,000 | 50,000 | $+1{,}867$ |
> | **A+C** | **170,000** | **65,000** | $\mathbf{+27{,}428}$ |
> | B+C | 240,000 | 75,000 | $-12{,}199$ |
>
> **Choose A+C.** Note B alone loses money yet A+B is still positive — you must evaluate *sets*, never individual proposals.

---

> [!fact] Recipe 6
> ## Payback Period

- **Constant savings**: $\text{Payback} = \dfrac{\text{First cost}}{\text{Annual net savings}}$. "Net" means revenue **minus** O&M: $15{,}000/(10{,}000-6{,}400) = 4.16$ yr.
- **Non-constant savings**: subtract each year's savings from the first cost until it hits zero; interpolate within the final year for the fraction.
- **Discounted payback**: cumulate $\dfrac{\text{Savings}_k}{(1+i)^k}$ until the running total reaches the first cost. Always **longer** than plain payback.
- **Shortest payback wins.**

MC bait — the drawbacks: ignores the **time value of money** (plain version), ignores **cash flows after payback** / the service life, and **discriminates against long-term projects**. Advantages: trivial to compute, rewards quick capital recovery.

---

> [!fact] Recipe 7
> ## IRR of a Single Project

$i^*$ is the rate making $NPW = 0$ (present worth of receipts $=$ present worth of disbursements) — the **break-even** rate.

1. **Uniform series shortcut**: $-P + A(P/A, i^*, N) = 0 \Rightarrow (P/A, i^*, N) = \dfrac{P}{A}$. Solve for $i^*$ with `num-solv`.
2. **One period only**: solve algebraically, $-P + F/(1+i^*) = 0$.
3. **Irregular**: bracket by trial, then interpolate linearly between two rates: $$i^* \approx i_1 + (i_2 - i_1)\frac{NPW(i_1)}{NPW(i_1) - NPW(i_2)}$$
4. **Decision (independent projects): accept if $i^* > \text{MARR}$**, reject if $i^* < \text{MARR}$.

Assumptions behind that rule: single IRR, equal lives, no budget constraints.

---

> [!fact] Recipe 8
> ## Mutually Exclusive IRR — Incremental Analysis

**The highest IRR does NOT win.** IRR is a *relative* measure; NPW/AW/FW are *absolute*. A small project can have a huge IRR and tiny profit.

Procedure:
1. Rank alternatives by **increasing first cost**; include do-nothing.
2. Current best $=$ cheapest alternative whose own IRR $\ge$ MARR (if do-nothing is allowed, screen each alternative this way first).
3. Challenger $=$ next one up. Form the increment (challenger $-$ current best): $\Delta P$, $\Delta A$, $\Delta S$.
4. Solve $-\Delta P + \Delta A(P/A, i^*_\Delta, N) = 0$ for the **incremental IRR**.
5. $i^*_\Delta \ge \text{MARR}$ → challenger becomes current best; otherwise **discard the challenger** (do *not* discard the current best).
6. Repeat with the next challenger. Last one standing wins.

Equivalent statements worth recognizing on MC: $i^*_\Delta > \text{MARR} \iff PW(\text{B}-\text{A}) > 0 \iff PW_B > PW_A$.

> [!example] Example — Tutorial 4, P5
> ## Two Printing Presses

Standard: $\$55$k, saves $\$13$k/yr. High-capacity: $\$80$k, saves $\$17.5$k/yr. $N = 8$, MARR $= 12\%$.

> [!success]- Solution (Click to expand)
> Own IRRs: $(P/A,i^*,8) = 55/13 = 4.2308 \Rightarrow i^*_1 = 16.8\%$; $(P/A,i^*,8) = 80/17.5 = 4.5714 \Rightarrow i^*_2 = 14.4\%$. Both beat MARR, so both beat do-nothing — but that settles nothing.
>
> Increment (high $-$ standard): $\Delta P = 25{,}000$, $\Delta A = 4{,}500$.
> $$(P/A, i^*_\Delta, 8) = \frac{25{,}000}{4{,}500} = 5.5556 \Rightarrow i^*_\Delta = 8.9\% < 12\%$$
> The extra $\$25$k does not earn the MARR → **select the standard press**. (Here NPW agrees, because $PW(\Delta) < 0$.)

---

> [!hint] MC Bank
> ## Concept Questions They Can Ask Without Any Arithmetic

- **Project types**: *Independent* — costs/benefits of each unaffected by the other. *Mutually exclusive* — cannot or should not do both. *Related but not mutually exclusive* — one's costs/benefits depend on whether the other is chosen; convert to mutually exclusive sets.
- **Contingent**: B requires A. **Resource constraint**: cap on how many run at once.
- **MARR**: minimum return a firm will accept; also read as the **cost of capital** / the rate needed to attract investors. It is the discount rate used in PW/AW/FW.
- **"Internal"** in IRR: $i^*$ depends only on the project's own cash flows — inflation, risk, and external rates are excluded.
- **Reinvestment assumptions**: PW/AW/FW assume cash is reinvested at the **MARR**; IRR assumes reinvestment at the **IRR** itself.
- **$NPW(i \to \infty) = -P$** (all future terms vanish); **$NPW(0)$** $=$ the undiscounted sum of the cash flows. $NPW$ is decreasing in $i$ for a conventional project, crossing zero at $i^*$.
- **Standing assumptions of all comparison methods**: costs/benefits measurable in money; cash flows deterministic; no inflation; funds sufficient for all projects; no taxes; every project has a $t = 0$ cash flow.
- PW, AW, and FW **always agree** on ranking (equal lives). IRR **can disagree** with them unless incremental analysis is used.

---

> [!hint] Final Check
> ## 60-Second Pre-Submit Sweep

1. Did I use **net** annual cash flow (revenue $-$ O&M), not gross?
2. Are the **lives equal**? If not — did I state repeated-lives, AW-forever, or study period?
3. Is the year-$N$ lump a salvage $(+)$ or a decommissioning cost $(-)$?
4. Did I discount the annuity to the right year (one period before its first payment)?
5. Mutually exclusive with IRR → did I do the **increment**, not the biggest $i^*$?
6. Cost-only comparison → **least** AEC wins (most positive, i.e. smallest magnitude negative).
7. "Up to $k$ projects" / contingency → did I delete the infeasible combinations before ranking?
8. Is the answer's sign and magnitude plausible (payback in years, IRR in percent, PW in dollars)?
