---
Course: ECE108
Date: 2026-07-29
Student: Yiran Liu (21184901)
jupyter:
  jupytext:
    cell_metadata_filter: -all
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.19.5
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

> [!example] **Question 1**
> 

Let $n,m \in\mathbb{Z}^+$, i.e., be finite positive integers. Denote $n$-bit strings as $\{0,1\}^n$ and $m$-bit strings as $\{0,1\}^m$. E.g., $\{0,1\}^2 = \{00, 01, 10, 11\}$.

a. How many distinct functions exist with domain $\{0,1\}^n$ and codomain $\{0,1\}^m$?

*Hint*: think of each function encoded as a table with one entry per member of the domain.

b. How many of those functions are bijective?

> [!success]- Solution

a. Let $F$ denote all functions with form $f_i: \set{0,1}^n \rightarrow \set{0,1}^m, \ f_i(x_j)=y_{ij}$

$\forall x_j \in\set{0,1}^n$ there are  $2^m$ possible $y_{ij} \in {0,1}^m$. And there are a total $2^n$ number of $x_j$ we need to assign values to. Therefore:

$$ |F| = (2^m)^{2^n}$$

b. $B \subseteq F$ denote the bijective functions. We need to analyze three cases:

- If $n \lt m$. Obviously $\left| \text{range}(f) \right| \leq 2^n \lt \left|\set{0,1}^m\right| \implies \text{range}(f) \neq \text{codomain}(f)$. So $f$ is never **surjective**
- If $n > m$. There can only be $2^m$ distinct $f(x)$ . While we need $2^n$ distinct $f(x)$ to ensure $(x_1 \neq x_2) \implies (f(x_1)\neq f(x_2))$. So $f$ is never **injective**
- If $n=m$. It becomes an ordered selection of $2^n$ *distinct* (no replacement) $f(x)$ for each $x \in \set{0,1}^n$. There are $P(2^n, 2^n)$ ways to do so. 

Therefore, we conclude that:

$$\begin{aligned} |B| = \begin{cases} 
0 \quad & (n \neq m) \\
(2^n)! \quad & (n = m)
\end{cases}\end{aligned}$$

---

> [!example] **Question 2**
> 

A car dealer has 30 cars in stock. Of these, 20 have immobilizers, 8 have A/C's, and 25 have fuel-injection; 20 have at least two of these features, and 6 have all three.

a. How many cars have at least one of the features?
b. How many have none?
c. How many have exactly one?

> [!success]- Solution

Let $S$ denote the set of cars in stock, $I$ denote cars with immobilizers, $A$ denote cars with A/C, $F$ denote cars with fuel-injection. 
$$ |S| = 30 \quad |I| = 20 \quad |A|=8 \quad |F|=25$$
Let $L_3$ denote cars with 3 features,  $L_2$ denote cars with at least 2 features, $L_1$ denote cars cars with at least 1 feature. We know:
$$ L_3 \subseteq L_2 \quad |L_3| = 6 \quad |L_2| = 20$$
We define
$$f(\text{M}) = \sum_{c \in M} \text{\# of Features for car c} = \text{\# of Total Features}$$
We compute:
$$\begin{aligned} 
f(S) =& \ |I| + |A| + |F| = 53 \\ 
f(L_3) = & \ |L_3| \times 3 = 18 \\
f(L_2) = & \ f(L_3) + f(L_2 \setminus L_3) = 18 + (|L_2| - |L_3|) \times 2 = 46 \\ \\
f(L_1) =& \ f(L_2) + f(L_1 \setminus L_2)= 46 +  (|L_1|-|L_2|) \times 1 = f(S)
\end{aligned} $$
Solve for $(|L_1| - |L_2|) = 7 \implies |L_1| = 27 \implies |S \setminus L_1| = 3$. We conclude:
- (a) 27 cars have at least one of the features
- (b) 3 cars have none of the features
- (c) 7 cars have exactly one of the features

---

> [!example] **Question 3**
> 

Which is more likely: getting at least one $6$ when one rolls a fair die $6$ times, or getting at least two $6$'s when one rolls the die $12$ times?

> [!success]- Solution

- Let $S_t=\set{1,2,3,4,5,6}^t$ denote the sample space of rolling a die $t$ times:
- Let $A_1 \subseteq S_6$ denote the event that at least one 6 is rolled when rolling the die 6 times;
- Let $B_1, B_2 \subseteq S_{12}$ denote the event that at least one and two 6 is rolled when rolling the die 12 times, respectively. Obviously $B_2 \subset B_1$. 

$$ \begin{aligned} 
\Pr(A_1) =& \ 1-\Pr(\overline{A_1}) = 1-\frac{|\overline{A_1}|}{|S_6|} = 1 - \frac{(6-1)^6}{6^6} = \boxed{0.6651...} \\
\Pr(B_2) =& \ \Pr(B_2|B_1) \times \Pr(B_1) + \Pr(B_2|\overline{B_1}) \times \Pr(\overline{B_1}) \\
=&\ (1-\Pr(\overline{B_2}|B_1)) \times \Pr(B_1) + 0 \times \Pr(\overline{B_1}) \\
=&\ (1-\frac{\Pr(\overline{B_2} \cap B_1)}{\Pr(B_1)}) \times \Pr(\overline{B_1}) \\
=&\ \Pr(B_1) - \Pr(\overline{B_2} \cap B_1)
\end{aligned}$$
Where $\Pr(\overline{B_2}\cap B_1)$ is equal to the probability of **exactly one** 6 being rolled in 12 rolls. Let $E_1$ denote this event and write:
$$\Pr(E_1) = \frac{|E_1|}{|S_{12}|} = \frac{12 \text{\tiny{(positions to place the 6-roll)}} \times (6-1)^{11} \text{\tiny{(possible outcomes of the other 11 roll)}}}{6^{12}} = \frac{12 \times 5^{11}}{6^{12}}$$
$$\Pr(B_1) = 1-\Pr(\overline{B_1}) = 1-\frac{|\overline{B_1}|}{|S_{12}|} = 1-\frac{5^{12}}{6^{12}}$$
$$ \Pr(B_2)= (1-\frac{5^{12}}{6^{12}}) - \frac{12 \times 5^{11}}{6^{12}} = \boxed{0.6187...}$$
Therefore, $A_1$ is slightly more likely to happen. 

---

> [!example] **Question 4**
> 

You have \$5 and your friend has \$3. You want to try and win all their money, and they yours. You agree on the following game. You repeatedly toss a fair coin, and for each win, the loser gives the winner \$1. For example, if you repeatedly call $H$ (heads), and the coin happens to land $THTTT$, then you will have given your friend all your money. The game ends when one of you goes bankrupt, i.e., has \$0.

What is the probability that you bankrupt your friend within $10$ tosses of the coin?

> [!success]- Solution

I don't think this problem can be solved using combinations, since if either me or my friend go bankrupt during one of the round, it terminates the sequence. I will use python to make a simple **dynamic programming** code to solve it

```python
MY_MONEY_INIT = 5
FRIEND_MONEY_INIT = 3
NUM_TOSSES = 10

max_money = MY_MONEY_INIT + FRIEND_MONEY_INIT

# Probablity at each possible states
possible_states: list[list[float]] = [
    [0.0] * (max_money + 1) for toss in range(0, NUM_TOSSES + 1)
]

# Initial state is known
possible_states[0][MY_MONEY_INIT] = 1.0

probablity = 0.0

for toss in range(1, NUM_TOSSES + 1):
    for my_money in range(0, max_money + 1):
        win_to_this_state_prob = (
            0.5 * possible_states[toss - 1][my_money - 1] 
            if my_money > 1 
            else 0.0
        )
        loss_to_this_state_prob = (
            0.5 * possible_states[toss - 1][my_money + 1]
            if my_money < max_money - 1
            else 0.0
        )
        possible_states[toss][my_money] = (
            win_to_this_state_prob + loss_to_this_state_prob
        )
    print("Winning at toss", toss, " prob ", possible_states[toss][max_money])
    probablity += possible_states[toss][max_money]

print(probablity)

```

---

> [!example] **Question 5**
> 

A *hash table* works as follows. We allocate a table of $m$ slots. All the items we intend to store in the table are drawn from a large set $U$ of items. We adopt a function $f\!:U\to\{0,\ldots,m-1\}$ which maps an item to a slot. Suppose we seek to store $n$ items from $U$ in a hash table of $m$ slots.

a. Suppose $f$ maps every item in $U$ with equal probability to one of the $m$ slots. What is the probability, given two distinct items $i_1,i_2 \in U$, that $f(i_1) = f(i_2)$?
b. Prove that if $|U| > nm$, then no matter what $f$ is, there exist $n$ items in $U$ all of which are mapped by $f$ to the same slot.

> [!success]- Solution

a. Since the probability distribution is even, we can pick $\forall k\in \set{0, ..., m-1}$ so that:
$$\quad \Pr(f(i_1)=f(i_2)) = \Pr(f(i_1)=k) = \frac{1}{m}$$

b. We prove this by defining a relation $H\subseteq U^2$ as:
$$ H = \{(x,y) \in U^2 \mid f(x)=f(y) \} $$
Notice that this relation is:
- **reflexive:**  since $f(x)=f(x)$
- **symmetric:** since $f(x)=f(y) \implies f(y)=f(x)$
- **transitive:** since $(f(x)=f(y)) \land (f(y)=f(z)) \implies (f(x)=f(z))$
$H$ is an **equivalence** and we can therefore construct equivalent classes:
$$\mathbb{E} = \set{[x_1]_H, [x_2]_H, ...}$$
And
$$ \text{range}(f) \subseteq \text{codomain}(f) \implies |\text{range}(f)| \leq m \implies |\mathbb{E}| \leq m$$
Using the two properties of equivalent sets: 
$$i\neq j \implies [x_i]_H \cap [x_j]_H = \emptyset \quad \land \quad \bigcup_{1 \leq i \leq |\mathbb{E}|} [x_i]_H = U $$
We can write:
$$ |U| = \sum_{i=1}^{|\mathbb{E}|} |[x_i]_H| > nm \quad \text{where } |\mathbb{E}| \leq m $$
If $\forall i: |[x_i]_H| \leq n$, then $|U|\leq nm$, which contradicts the given condition. Therefore, it is obvious that **at least one** of the equivalence group have size $> n$. 

---

> [!example] **Question 6**
> 

Suppose $\Pr\{B\}\not= 0$. Prove: $\Pr\{A\mid B\} + \Pr\{\overline{A}\mid B\} = 1$.

> [!success]- Solution

Assume sample space $S$, we know $A, B \subseteq S$ 
$$\begin{aligned}
\Pr(A\mid B) + \Pr(\overline{A} \mid B) =& \ \frac{\Pr(A \cap B)}{\Pr(B)} + \frac{\Pr(\overline{A} \cap B)}{\Pr(B)} \\
=&\ \frac{\Pr((A\cap B) \cup (\overline{A} \cap B))}{\Pr(B)} \\
=&\ \frac{\Pr((A \cup \overline{A}) \cap B)}{\Pr(B)} \\
=&\ \frac{\Pr(S \cap B)}{\Pr(B)} \\
=&\ \frac{\Pr(B)}{\Pr(B)} \\
=&\ \boxed{1} \quad (\Pr(B) \neq 0)
\end{aligned}$$

---

> [!example] **Question 7**
> 

A prison warden has randomly picked one prisoner among three to go free. The other two will be executed. The guard knows which one will go free but is forbidden to give any prisoner information regarding his status. Let us call the prisoners $X, Y, \text{ and } Z$. Prisoner $X$ asks the guard privately which of $Y$ or $Z$ will be executed, arguing that since he already knows that at least one of them must die, the guard won't be revealing any information about his own status. The guard tells $X$ that $Y$ is to be executed. Prisoner $X$ feels happier now, since he figures that either he or prisoner $Z$ will go free, which means that his probability of going free is now $1/2$. Is he right, or are his chances still $1/3$? Assume that if both $Y$ and $Z$ are to be executed, the warden uniformly picks one of those names to tell $X$.

> [!success]- Solution

Let $R_X, R_Y, R_Z$ denote the event that each prison is **released**, let $T_Y, T_Z$ be the event that the prison warden picked that prison to **tell** me ($X$) . These events are mutually exclusive 
($R_X \cap R_Y = \emptyset, T_Y \cap T_Z = \emptyset$) and so on.  Our sample space is:
$$ S = \set{R_X, R_Y, R_Z} \times \set{T_Y, T_Z} $$
We can compute:
$$\begin{aligned} 
\Pr(R_X \mid T_Y) &= \frac{\Pr(R_X \cap T_Y)}{\Pr(T_Y)} \\
&= \frac{\Pr(R_x)\Pr(T_Y \mid R_x)}{\Pr(R_x)\Pr(T_Y \mid R_x) + \Pr(R_Y)\Pr(T_Y\mid R_Y) + \Pr(R_Z)\Pr(T_Y\mid R_Z)} \\
&= \frac{\frac{1}{3} \times \frac{1}{2}}{\frac{1}{3} \times \frac{1}{2} + \frac{1}{3} \times 0 + \frac{1}{3} \times 1} \\
&= \frac{1}{6} / \frac{3}{6} = 1/3
\end{aligned}$$

Therefore, his chance is still $1/3$.

> **Notes to myself:**

---

> [!example] **Question 8**
> 

A carnival game consists of three dice in a cage. A player can bet a dollar on any of the numbers 1 through 6. The cage is shaken, and the payoff is as follows. If the player's number doesn't appear on any of the dice, she loses her dollar. Otherwise, if her number appears on exactly $k$ of the three dice, for $k = 1, 2, 3$, she keeps her dollar and wins $k$ more dollars. What is her expected gain from playing the carnival game once?

> [!success]- Solution

Let $\set{P, N}^3$ denote the
We compute the probability of each **mutually exclusive** cases:
- For $k=3$ all three dies must show my number:
$$ \Pr(k=3) = \frac{1}{6} \times \frac{1}{6} \times \frac{1}{6} = \frac{1}{216} $$
- For $k=2$, we can choose two dies from three dies that show my number:
$$ \Pr(k=2) = \frac{1}{6} \times \frac{1}{6} \times \frac{5}{6} \times \binom{2}{3} = \frac{15}{216}$$
- For $k=1$ we can choose one die from three dies that show my number:
$$ \Pr(k=1) = \frac{1}{6} \times \frac{5}{6} \times \frac{5}{6} \times \binom{1}{3}= \frac{75}{216}$$
- For $k=0$ all three dies must not show my number:
$$ \Pr(k=0) = \frac{5}{6} \times \frac{5}{6} \times \frac{5}{6} = \frac{125}{216} $$
Denote the earning at each event as:
$$i \in \set{0,1,2,3}: \quad X(k=i) $$
Compute:
$$\begin{aligned} 
E[X] &= \sum_{i=0}^{3} X(k=i) \times \Pr(k=i) \\
&= 3 \times \frac{1}{216} + 2 \times \frac{15}{216} + 1 \times \frac{75}{216} + (-1) \times \frac{125}{216} \\
&= \boxed{-\frac{17}{216}}
\end{aligned}$$

---

> [!example] **Question 9**
> 

Consider the randomized algorithm for finding the median of an odd number, $n$, of distinct integers that is at the end of the textbook. Suppose we adopt the following seemingly better version instead. We assume that our original input set of integers is $A$.

```
1:  S ← ∅
2:  while true:
3:      uniformly pick some i ∈ A \ S
4:      check if i is the median of A
5:      if yes, return i
6:      otherwise, S ← S ∪ {i}
```

That is, unlike the algorithm in the textbook, we keep track of failed trials in the set $S$, and exclude them from future choices. Thus, we are guaranteed to return the median in at most $n$ trials.

What is the expected number of trials, i.e., number of iterations of the **while** loop, with the above algorithm?

> [!success]- Solution

Assume that the program continues to pick $i$ after the median is found, then the sequence of $i$s that we picked is an *ordered, non-replacing selection* (or **arrangement**) of $A$.  
$$ \text{\# of Arrangments } = P(n,n) = n!$$
The probability that median is selected at the $x$-th iteration of the while loop is: 
$$ \Pr(\text{At}_x) = \frac{(n-1)! \text{\small{ (ways to arrange the other items)}}}{n! \text{\small{ (ways to arrange the entire sequence)}}} = \frac{1}{n} $$
Compute expected $x$:
$$\begin{aligned} 
E[X] &= \sum_{x=1}^{n} x \cdot \Pr (\text{At}_x) \\
&= \frac{1}{n} \sum_{x=1}^n x \\
&= \frac{(1+n)n}{2n} \\
&= \frac{1+n}{2}
\end{aligned} $$

