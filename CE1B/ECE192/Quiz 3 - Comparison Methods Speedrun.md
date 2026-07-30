> [!abstract] Introduction
> ### What Quiz 3 Actually Tests

Scope: **Comparison Methods Part 1 + Part 2 only** (NPW, AW/AEC, FW, unequal lives, payback, IRR, incremental IRR). Closed book, Quiz-2 formula sheet, TI-36X Pro.

Everything on the quiz collapses into **eight recipes**. Learn the decision rule of each one — the arithmetic is calculator work.

| #   | Trigger words in the question                      | Recipe                                     |
| --- | -------------------------------------------------- | ------------------------------------------ |
| 1   | "is it desirable", "should we invest", one project | NPW $>0$                                   |
| 2   | "which alternative", same life                     | max NPW / max AW                           |
| 3   | "annual", "per year", "equivalent annual cost"     | AW / AEC                                   |
| 4   | "at the end of N years I will have…"               | FW                                         |
| 5   | different service lives                            | repeated lives / study period / AW-forever |
| 6   | "related but not mutually exclusive", "up to two"  | $2^n$ enumeration → max NPW                |
| 7   | "how long to pay for itself"                       | payback period                             |
| 8   | "rate of return", "IRR", MARR comparison           | IRR, then **incremental** IRR              |

---

> [!info] Notation
> ### Variable Naming Key

| Variable in Formula | Likely Exam Names |
| :--- | :--- |
| $P$ | <u><strong style="color:#a0399f">First cost</strong></u>, Initial investment, Purchase price, Upfront cost |
| $S$ | <u><strong style="color:#a0399f">Salvage value</strong></u>, Resale value, Disposal cost (negative), Decommissioning cost (negative) |
| $A$ | <u><strong style="color:#a0399f">Annual net income</strong></u>, Annual savings, Operating and Maintenance (O&M) cost (negative) |
| $N$ | <u><strong style="color:#a0399f">Service life</strong></u>, Useful life, Study period, Duration |
| $i$ / $\text{MARR}$ | <u><strong style="color:#a0399f">Minimum Acceptable Rate of Return</strong></u>, annual interest rate, discount rate, cost of capital |
| $x$ / $i^*$ | <u><strong style="color:#a0399f">Internal Rate of Return (IRR)</strong></u>, Rate of Return (RoR), break-even interest rate |
| $CF_k$ | Net cash flow at year $k$ (Cash Inflows $-$ Cash Outflows) |

---

> [!fact] Recipe 1
> ### NPW — Accept/Reject One Independent Project

**Trigger Words:** "Is it desirable?", "Should we invest?"

**Easiest Path:** Calculate Net Present Worth ($NPW$). If $NPW \ge 0$, the project beats "do nothing" and is accepted. Treat $CF_0$ as negative (the initial investment).

**Calculator Summation:**
$$
NPW = \sum_{k=0}^{N} CF_k(1+i)^{-k}
$$

---

> [!fact] Recipe 2
> ### Mutually Exclusive (Same Service Life)

**Trigger Words:** "Which alternative should we select?" (when lives are equal).

**Easiest Path:** Choose the alternative with the highest $NPW$.

**Calculator Summation:** 
Evaluate the same summation as Recipe 1 for each option:
$$
NPW = \sum_{k=0}^{N} CF_k(1+i)^{-k}
$$

---

> [!fact] Recipe 3
> ### Annual Worth (AW) / Annual Equivalent Cost (AEC)

**Trigger Words:** "Annual equivalent cost", "AW", "per year".

**Easiest Path:** Calculate the $NPW$ of one cycle first (using the summation in Recipe 1), then convert it directly to an annuity using the division form. This is mathematically identical to multiplying by $(A/P, i, N)$ but easier to type in the calculator as a sum:

$$
AW = \frac{NPW}{\sum_{x=1}^{N} (1+i)^{-x}}
$$

**For AEC (cost-only comparisons):** Select the alternative with the smallest magnitude negative value (the least cost). 

---

> [!fact] Recipe 4
> ### Unequal Lives (Repeated Indefinitely)

**Trigger Words:** "Unequal lives", "repeated indefinitely", "replaced indefinitely".

**Easiest Path:** **Do not use the Least Common Multiple (LCM).** When infinite repeatability is assumed, the average annual cost of year 1 is assumed to remain exactly the same for all future years. Simply calculate the $AW$ for exactly **one cycle** of each alternative using their respective, individual service lives ($N_A$ and $N_B$):

$$
AW = \frac{NPW \text{ (over individual life } N \text{)}}{\sum_{x=1}^{N} (1+i)^{-x}}
$$

Select the option with the highest (most positive / least negative) $AW$.

---

> [!fact] Recipe 5
> ### Unequal Lives (Study Period)

**Trigger Words:** "Repeated-lives assumption does not hold", "study period of $T$ years".

**Why standard AW fails here:** You cannot compare standard full-life $AW$ values when infinite repeatability does not hold. Truncating a project early changes its annual capital recovery profile because the initial purchase price is amortized over fewer years than the machine was designed for.

**Easiest Path:** Set a fixed horizon $T$ (usually the shorter service life). Force both projects to terminate at year $T$. 
1. Evaluate $NPW$ strictly over $T$ years.
2. For the longer-lived option, credit an estimated <u><strong style="color:#a0399f">Salvage Value</strong></u> ($S$) at Year $T$. This represents "selling" the asset early at its remaining market value to make the comparison fair.

**Calculator Summation:**
$$
PW = \left[ \sum_{k=0}^{T} CF_k(1+i)^{-k} \right] + S(1+i)^{-T}
$$
*(Note: $S$ is added as a positive cash inflow at year $T$)*

---

> [!fact] Recipe 6
> ### Related but Not Mutually Exclusive Projects

**Trigger Words:** "Related but not mutually exclusive", "up to $Y$ proposals", "budget limit".

**Easiest Path:** 
1. List all $2^n$ combinations (including "Do Nothing").
2. Cross out infeasible combinations (e.g., combinations exceeding the project limit, or where Project B is included without its prerequisite Project A).
3. For each valid combination, sum the first costs ($P_{\text{total}}$) and sum the annual savings ($A_{\text{total}}$).
4. Calculate the $NPW$ for each valid set:
   $$NPW = -P_{\text{total}} + \sum_{k=1}^{N} A_{\text{total}}(1+i)^{-k}$$
5. Select the combination with the largest $NPW$.

---

> [!fact] Recipe 7
> ### Payback Period

**Trigger Words:** "How long to pay for itself", "payback period".

**Easiest Path:**
- **Simple Payback** (constant savings, no time value of money): 
  $$ \text{Payback} = \frac{P}{A} $$
- **Discounted Payback** (MARR is considered): Accumulate discounted savings year by year until the sum matches or exceeds the initial cost $P$. Find the smallest year $U$ where:
  $$ \sum_{k=1}^{U} \frac{A_k}{(1+i)^k} \ge P $$

---

> [!fact] Recipe 8
> ### Mutually Exclusive Project IRR (Incremental Analysis)

**Trigger Words:** "Internal Rate of Return method", "IRR", "which press/machine to select".

**Why standard IRR fails here:** The highest individual IRR does **not** automatically win. A cheap project might have a huge percentage return but yield very few absolute dollars. You must evaluate if the *extra capital* spent on the more expensive option earns its keep.

**Easiest Path (Step-by-Step):**
1. **Sort:** Order your alternatives by increasing first cost $P$. The cheaper option is the <u><strong style="color:#a0399f">Defender</strong></u>. The more expensive option is the <u><strong style="color:#a0399f">Challenger</strong></u>.
2. **Find Increments:** Calculate the exact difference in upfront costs and annual benefits:
   $$ \Delta P = P_{\text{Challenger}} - P_{\text{Defender}} $$
   $$ \Delta A = A_{\text{Challenger}} - A_{\text{Defender}} $$
3. **Solve for $i^*_\Delta$:** Use your TI-36X Pro's `num-solv` function to find the interest rate $x$ that makes the present worth of this incremental cash flow equal $0$. 
   *To avoid the calculator's index variable conflict (where `sum` and `num-solv` both try to use `x`), use the **closed-form equation** (Workaround B):*
   $$ -\Delta P + \Delta A \left[ \frac{(1+x)^N - 1}{x(1+x)^N} \right] = 0 $$
4. **Decision Rule:** Compare the calculated incremental IRR ($x$) to the corporate $\text{MARR}$:
   - If $x \ge \text{MARR}$: The extra investment is justified. **Choose the Challenger**.
   - If $x < \text{MARR}$: The extra investment does not earn the required return. **Choose the Defender**.

