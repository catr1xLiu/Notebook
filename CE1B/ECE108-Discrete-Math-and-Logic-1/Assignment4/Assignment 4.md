---
Course: ECE108
Date: 2026-07-03
Student: Yiran Liu (21184901)
---

> [!example] **Question 1**
> 

At this point in the course, you should be able to intuit proofs related to algorithms. Consider the following (algorithmic) problem: given as inputs: (i) an array $A[0,\ldots,n-1]$ that is sorted non-decreasing, (ii) a start and end index, where we assume $0\le \mathit{start} \le \mathit{end}\le n-1$, and, (iii) an $\mathit{item}$, the following is an algorithm that purports to output $\text{true}$ if the $\mathit{item}$ is in $A[\mathit{start}, \ldots, \mathit{end}]$, and $\text{false}$ otherwise.

```
BinSearch(A[0,...,n-1], item, start, end)
1:  lo ← start
2:  hi ← end
3:  while lo ≤ hi:
4:      mid ← ⌊(lo + hi) / 2⌋
5:      if A[mid] == item:
6:          return true
7:      else if A[mid] < item:
8:          lo ← mid + 1
9:      else:
10:         hi ← mid - 1
11: return false
```

For example, suppose our input array $A[0,\ldots,4]$ is: $4, 5, 5, 62, 81$, $\mathit{start} = 1, \mathit{end} = 3$ and $\mathit{item} = 56$. Then the correct output is $\text{false}$ because $81$ is not in $A[1,\ldots,3]$. If we run **BinSearch** with those inputs it first sets $\mathit{lo}$ to $1$ and $\mathit{hi}$ to $3$. It enters the **while** loop, and computes $\mathit{mid} = \lfloor\frac{1+3}{2}\rfloor = 2$. As $A[2] = 5 < \mathit{item} = 56$, it sets the new value of $\mathit{lo} = 3$. It enters the **while** loop again, and now, $\mathit{mid}$ is computed as $3$, and $A[3] = 62 > \mathit{item} = 56$. So it sets the new value of $\mathit{hi}$ to $2$. Now, as $\mathit{lo} > \mathit{hi}$, we exit the **while** loop and return $\text{false}$ correctly.

That was an example only. We want to address things in general. We want to ensure that if the algorithm returns $\text{true}$ on some inputs, then indeed $\mathit{item}$ is in the input array $A[0,\ldots,n-1]$. Towards this, prove the following:

> In a run of the algorithm with valid inputs, at any moment immediately after we compute a $\mathit{mid}$ value in Line (4), it is true that $\mathit{start} \le \mathit{lo} \le \mathit{mid}\le \mathit{hi}\le \mathit{end}$.

Notes:
- Hint: induction on the iteration number of the **while** loop. For the step, suppose the values of $\mathit{lo}, \mathit{hi}, \mathit{mid}$ in two successive iterations are $\mathit{lo}_1, \mathit{hi}_1, \mathit{mid}_1$ and $\mathit{lo}_2, \mathit{hi}_2, \mathit{mid}_2$ respectively. From the induction assumption, we know that $\mathit{start}\le \mathit{lo}_1 \le\mathit{mid}_1 \le \mathit{hi}_1 \le\mathit{end}$. Now, you need to prove that $\mathit{start}\le \mathit{lo}_2 \le\mathit{mid}_2 \le \mathit{hi}_2 \le\mathit{end}$.
- As we have successfully entered the **while** loop in this instance, we know that $\mathit{lo}_2\le\mathit{hi}_2$.
- Once you prove the above claim, we will have proven that if the algorithm returns $\text{true}$, it is indeed the case that $\mathit{item}\in A[\mathit{start},\ldots,\mathit{end}]$.
- I'll put the other case, i.e., if a run of the algorithm returns $\text{false}$, then indeed $\mathit{item}\not\in A[\mathit{start},\ldots,\mathit{end}]$ in your practice problem set.

> [!success]- Solution



---

> [!example] **Question 2**
> 

Let $A = \{1,2,3\}$, and $R\subseteq A^2$ be the relation: $R = \{\langle 1,2\rangle, \langle 2,3\rangle, \langle 3,1\rangle\}$.

a. True or false $+$ justification: $R$ is antisymmetric.
b. True or false $+$ justification: $R$ is asymmetric.

> [!success]- Solution

---

> [!example] **Question 3**
> 

Alice claims that a relation $R$ with $|R| > 1$ cannot be both an equivalence and a partial order. Do you concur with Alice? Justify.

> [!success]- Solution

---

> [!example] **Question 4**
> 

Let $\mathbb{Z}$ be the set of integers, i.e., $\mathbb{Z} = \{\ldots,-2,-1,0,1,\ldots\}$. And let $R\subseteq \mathbb{Z}^2$ be the relation:
$$
R = \{\langle x,y\rangle\in\mathbb{Z}^2 \mid x^2 \ge y^2\}
$$

Prove or disprove:

a. $R$ is an equivalence relation.
b. $R$ is a partial order.

> [!success]- Solution

---

> [!example] **Question 5**
> 

A relation $R\subseteq A^2$ is said to be *euclidean* if: $\forall \langle x,y,z\rangle\in A^3, \langle x,y\rangle\in R \wedge \langle x,z\rangle\in R \implies \langle y,z\rangle\in R$.

Prove that if $R\subseteq A^2$ is symmetric, then $R$ is transitive if and only if it is euclidean.

> [!success]- Solution

---

> [!example] **Question 6**
> 

How many different rearrangements of the letters do we have of the word, "bookkeeper?"

> [!success]- Solution

---

> [!example] **Question 7**
> 

A set $S$ has at least $100$ different subsets of size $5$. What is the smallest $|S|$ can be?

> [!success]- Solution

---

> [!example] **Question 8**
> 

We have $10$ distinct dresses to hang on a rack. We have three each of black, white and red dresses, and one blue dress. In how many ways can we hang them so that:

a. Dresses of the same colour are adjacent.
b. The blue dress is at one end, and the other dresses are arranged black, red, white, black, red, white, black, red, white, left to right.

> [!success]- Solution
