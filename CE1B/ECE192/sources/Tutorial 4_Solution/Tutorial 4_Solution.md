![](_page_0_Picture_0.jpeg)

# ECE 192: Engineering Economics and Impact on Society Spring 2026

Comparison Methods Part 1 and 2 Tutorial 4 - Solution

July 13th, 2026

# Problem 1

A company is considering purchasing a small hydroelectric facility for \$800,000. The plant is expected to generate a net annual income of \$180,000 for the next 8 years. At the end of the 8 years, the facility must be decommissioned according to environmental regulations, which will cost \$600,000 more than any potential salvage value. Using a 10% annual interest rate, determine whether the project is financially desirable.

## Solution

Given: i = 10% = 0.10, N = 8.

- Initial investment (Year 0): \$800,000 (outflow)
- Annual net income (Years 1–8): \$180,000 (inflow)
- Decommissioning cost (Year 8): \$600,000 (net outflow)

Present worth of an annuity and of a future amount:

$$P = A\left(\frac{(1+i)^N - 1}{i(1+i)^N}\right) \Rightarrow P/A = \frac{(1+i)^N - 1}{i(1+i)^N}, \qquad P/F = \frac{1}{(1+i)^N}.$$

$$P/A(10\%, 8) = \frac{(1+0.10)^8 - 1}{0.10(1+0.10)^8} = \frac{2.1436 - 1}{0.10 \cdot 2.1436} = \frac{1.1436}{0.21436} \approx 5.3349$$

$$P/F(10\%, 8) = \frac{1}{(1+0.10)^8} = \frac{1}{2.1436} \approx 0.4665$$

Now compute the NPW:

$$NPW = -800,000 + (180,000 \cdot 5.3349) - (600,000 \cdot 0.4665)$$
  
= -800,000 + 960,282 - 279,900 = -119,618.

$$NPW = -119,618$$

Since NPW < 0, the project is not financially desirable at a 10% interest rate.

# Problem 2

A piece of land may be purchased for \$610,000 to be strip-mined for the underlying coal. Annual net income will be \$200,000 for 10 years. At the end of the 10 years, the surface of the land will be restored as required by a federal law on strip mining. The reclamation will cost \$1.5 million more than the resale value of the land after it is restored. Using a 10% interest rate, determine whether the project is desirable.

## Solution

Given: i = 10% = 0.10, N = 10.

- Purchase of land (Year 0): \$610,000 (outflow)
- Annual net income (Years 1–10): \$200,000 (inflow)
- Reclamation cost (Year 10): \$1,500,000 net outflow (reclamation exceeds the restored resale value by this amount)

Using the same annuity and single-payment present-worth factors:

$$P/A(10\%, 10) = \frac{(1+0.10)^{10} - 1}{0.10 (1+0.10)^{10}} = \frac{2.5937 - 1}{0.10 \cdot 2.5937} \approx 6.1446$$
$$P/F(10\%, 10) = \frac{1}{(1+0.10)^{10}} = \frac{1}{2.5937} \approx 0.3855$$

Now compute the NPW:

$$NPW = -610,000 + (200,000 \cdot 6.1446) - (1,500,000 \cdot 0.3855)$$
$$= -610,000 + 1,228,920 - 578,250 = +40,670.$$
$$\boxed{NPW \approx +40,670}$$

Since NPW > 0, the project is desirable at a 10% interest rate.

# Problem 3

Kool Karavans is considering three investment proposals, which can be treated as related but not mutually exclusive investments. The company can only invest UP TO two of these proposals. Each of them is characterized by an initial cost, annual savings over four years, and no salvage value, as illustrated in Table [1.](#page-1-0)

<span id="page-1-0"></span>Table 1: Investment proposals for Kool Karavans.

| Proposal | First Cost (\$) | Annual Savings (\$) |
|----------|-----------------|---------------------|
| A        | 40,000          | 20,000              |
| B        | 110,000         | 30,000              |
| C        | 130,000         | 45,000              |

## Part (a): Mutually exclusive combinations

Because the proposals are related but not mutually exclusive, they are converted into a set of mutually exclusive alternatives by listing every feasible combination together with the do-nothing option. With n = 3 proposals there are 2<sup>n</sup> = 8 possible combinations, but the restriction of investing in at most two proposals eliminates the triple combination A + B + C, leaving 7 alternatives.

When two proposals are executed together, their first costs are added and their annual savings are added (the hint). Ordering the alternatives by increasing net first cost gives Table [2.](#page-2-0)

Table 2: All feasible mutually exclusive alternatives (at most two proposals), in increasing order of first cost.

<span id="page-2-0"></span>

| Project | Proposal   | Net First Cost (\$) | Net Annual Saving (\$) |
|---------|------------|---------------------|------------------------|
| 1       | Do nothing | 0                   | 0                      |
| 2       | A          | 40,000              | 20,000                 |
| 3       | B          | 110,000             | 30,000                 |
| 4       | C          | 130,000             | 45,000                 |
| 5       | A+B        | 150,000             | 50,000                 |
| 6       | A+C        | 170,000             | 65,000                 |
| 7       | B+C        | 240,000             | 75,000                 |

## Part (b): Selection at MARR = 12%

Each alternative is a first cost at Year 0 followed by a uniform annual saving for N = 4 years with no salvage value, so the net present worth is

$$NPW = - (Net First Cost) + (Net Annual Saving) (P/A, 12\%, 4).$$

The annuity present-worth factor is

$$(P/A, 12\%, 4) = \frac{(1+0.12)^4 - 1}{0.12(1+0.12)^4} = \frac{1.5735 - 1}{0.12 \cdot 1.5735} = \frac{0.5735}{0.18882} \approx 3.0373.$$

Applying this factor to every alternative (values rounded to the nearest dollar):

Table 3: Net present worth of each alternative at MARR = 12%.

| Project | Proposal   | Net First Cost (\$) | Net Annual Saving (\$) | NPW (\$) |
|---------|------------|---------------------|------------------------|----------|
| 1       | Do nothing | 0                   | 0                      | 0        |
| 2       | A          | 40,000              | 20,000                 | +20,747  |
| 3       | B          | 110,000             | 30,000                 | −18,880  |
| 4       | C          | 130,000             | 45,000                 | +6,681   |
| 5       | A+B        | 150,000             | 50,000                 | +1,867   |
| 6       | A+C        | 170,000             | 65,000                 | +27,428  |
| 7       | B+C        | 240,000             | 75,000                 | −12,199  |

A sample calculation for the winning alternative (A+C):

$$\begin{aligned} \text{NPW}_{A+C} &= -170,000 + 65,000 \, (P/A,12\%,4) \\ &= -170,000 + 65,000 \, (3.0373) \approx -170,000 + 197,428 = +27,428. \end{aligned}$$

Decision. The alternatives with negative NPW (B and B+C) are rejected outright. Among the remaining options, the alternative with the largest NPW is chosen, since the goal is to maximize profit while respecting the "at most two proposals" constraint. That alternative is A+C:

Invest in proposals A and C 
$$\,$$
 (Project 6),  $\,$  NPW  $\approx +\$27{,}428$ 

# Problem 4

A manufacturing company must choose between two mutually exclusive machines to automate a packaging line. Machine A can be built in-house for a first cost of \$30,000, has an annual O&M cost of \$8,000, and a service life of 5 years. Machine B can be purchased off-the-shelf for \$45,000, has an annual O&M cost of \$6,000, and a service life of 10 years. The MARR is 10%.

## Part (a): Annual worth, repeated indefinitely

Because the two machines have different service lives (5 and 10 years), they cannot be compared directly by present worth. Assuming each can be repeated indefinitely with unchanged cash flows, the annual costs do not depend on how many cycles are considered, so the least common multiple of the lives is not required and the annual worth (AW) of each can be compared directly.

The capital recovery factors are

$$(A/P, 10\%, 5) = \frac{0.10 (1.10)^5}{(1.10)^5 - 1} \approx 0.2638, \qquad (A/P, 10\%, 10) = \frac{0.10 (1.10)^{10}}{(1.10)^{10} - 1} \approx 0.1627.$$

Machine A.

$$AW_A = -30,000 (A/P, 10\%, 5) - 8,000$$
  
= -30,000 (0.2638) - 8,000 = -7,914 - 8,000 = -15,914.

Machine B.

$$\begin{aligned} \mathrm{AW}_B &= -45,000 \left( A/P, 10\%, 10 \right) - 6,000 \\ &= -45,000 \left( 0.1627 \right) - 6,000 = -7,324 - 6,000 = -13,324. \end{aligned}$$

Since these are costs, the preferred alternative is the one with the least (most positive) annual cost:

$$AW_A = -\$15,914/yr$$
,  $AW_B = -\$13,324/yr \Rightarrow$  select Machine B

### Part (b): Study period

If the machines will not be repeated, use a study period equal to the shorter life, N = 5 years, and credit Machine B with an estimated salvage value of \$20,000 at the end of year 5. The relevant factors are

$$(P/A, 10\%, 5) = \frac{(1.10)^5 - 1}{0.10 (1.10)^5} \approx 3.7908, \qquad (P/F, 10\%, 5) = \frac{1}{(1.10)^5} \approx 0.6209.$$

Machine A.

$$PW_A = -30,000 - 8,000 (P/A, 10\%, 5)$$
  
= -30,000 - 8,000 (3.7908) = -30,000 - 30,326 = -60,326.

Machine B.

$$\begin{aligned} \mathrm{PW}_{B} &= -45,000 - 6,000 \, (P/A,10\%,5) + 20,000 \, (P/F,10\%,5) \\ &= -45,000 - 6,000 \, (3.7908) + 20,000 \, (0.6209) \\ &= -45,000 - 22,745 + 12,418 = -55,326. \end{aligned}$$
 
$$\begin{aligned} \mathrm{PW}_{A} &= -\$60,326, \quad \mathrm{PW}_{B} = -\$55,326 \ \Rightarrow \ \mathrm{select \ Machine \ B} \end{aligned}$$

Both the repeated-lives (AW) and the study-period analyses point to Machine B.

# Problem 5

A print shop is evaluating two mutually exclusive presses, each with a service life of 8 years. The standard press costs \$55,000 and yields annual net savings of \$13,000; the high-capacity press costs \$80,000 and yields annual net savings of \$17,500. The MARR is 12%.

### Solution

Step 1 — IRR of each alternative. The IRR is the rate i ∗ that makes the net present worth zero. For a first cost followed by a uniform annual saving over N = 8 years,

$$- (\text{First Cost}) + (\text{Annual Saving}) (P/A, i^*, 8) = 0 \implies (P/A, i^*, 8) = \frac{\text{First Cost}}{\text{Annual Saving}}.$$

Standard press:

$$(P/A, i^*, 8) = \frac{55,000}{13,000} = 4.2308.$$

Interpolating between (P/A, 16%, 8) = 4.3436 and (P/A, 18%, 8) = 4.0776 gives i ∗ <sup>1</sup> ≈ 16.8%. High-capacity press:

$$(P/A, i^*, 8) = \frac{80,000}{17,500} = 4.5714.$$

Interpolating between (P/A, 14%, 8) = 4.6389 and (P/A, 16%, 8) = 4.3436 gives i ∗ <sup>2</sup> ≈ 14.4%.

Both IRRs exceed the MARR of 12%, so each press is preferable to doing nothing. However, because the presses are mutually exclusive, the one with the higher individual IRR is not automatically the best choice; the incremental investment must be examined.

#### Step 2 — Incremental analysis (high-capacity − standard).

$$\Delta First\ Cost = 80,000 - 55,000 = 25,000, \\ \Delta Annual\ Saving = 17,500 - 13,000 = 4,500.$$

The IRR of the extra \$25,000 invested satisfies

$$-25,000 + 4,500 (P/A, i^*, 8) = 0 \implies (P/A, i^*, 8) = \frac{25,000}{4,500} = 5.5556.$$

Interpolating between (P/A, 8%, 8) = 5.7466 and (P/A, 10%, 8) = 5.3349 gives

$$i_{\Delta}^* \approx 8.9\%.$$

Decision. Since the incremental IRR (8.9%) is less than the MARR (12%), the additional \$25,000 required by the high-capacity press does not earn the required return and is rejected.

Select the standard press

Although the high-capacity press saves more each year, the extra capital is not justified at a 12% MARR — illustrating why the alternative with the highest individual IRR (here, the standard press) is preferred unless the incremental IRR beats the MARR.