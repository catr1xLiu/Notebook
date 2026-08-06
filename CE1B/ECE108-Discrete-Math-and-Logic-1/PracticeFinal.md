# ECE 108 — Final Exam, Spring 2024

Closed book, no aids. 150 minutes. 50 marks total. Mark values in brackets.

> **Incomplete source.** The PDF in `sources/` carries only Q1–Q6 and Q7(b). Pages 8 and 10 (where Q7(a), Q8 and Q9 would be) are blank in the file, so those questions are unavailable — 41 of the 50 marks are represented here.

| Question | Value |
|---|---|
| 1 | 11 |
| 2 | 10 |
| 3 | 4 |
| 4 | 4 |
| 5 | 6 |
| 6 | 4 |
| 7 | 6 |
| 8 | 4 *(missing)* |
| 9 | 1 *(missing)* |
| **Total** | **50** |

---

## Section 1: Definitions and multi-select

### Problem 1 [11]

Give formal definitions for the following. Non-formal descriptions are not sufficient.

- **a.** [5] State the form of Bayes' Theorem that is used for medical testing applications in the event of a positive test. You must define any needed events (i.e. explain what your events represent).
- **b.** [3] Give a formal definition of an antisymmetric relation $R$ on a set $S$.
- **c.** [2] Give a definition of an uncountable set $S$. For full credit, your answer must define uncountable sets by using properties of functions.
- **d.** [1] Free mark — accept it.

### Problem 2 [10]

Multi-select: circle the correct answer(s). No justification is required.

- **a.** [2] Which of the following relations are symmetric:
    - i. $\equiv$ on the set of all propositions
    - ii. $>$ on $\mathbb{Z}$
    - iii. $\le$ on $\mathbb{Q}$
    - iv. $\emptyset$ on $\mathbb{N}$
    - v. None of the above.
- **b.** [2] Which of the following sets are countably infinite:
    - i. $[0, 1]$
    - ii. $\mathbb{Z}$
    - iii. $\mathbb{Q}$
    - iv. $\{0, 1\}$
    - v. None of the above.
- **c.** [1] A group of 100 ECE 108 students took a survey and the results are in: 60 students like playing video games; 40 students like reading books; 25 students like both playing video games and reading books.

    True or False: The events of an ECE 108 student liking video games and liking reading books are independent.
    - i. True
    - ii. False
- **d.** [1] A horse owns $n$ types of toys. How many ways can the horse pick $k$ toys to share with their barnyard friends assuming that they have at least $k^2$ toys of each type?
    - i. $\binom{n}{k}$
    - ii. $P(n, k)$
    - iii. $n^k$
    - iv. $\left(\!\!\binom{n}{k}\!\!\right)$
    - v. $\left(\!\!\binom{k}{n}\!\!\right)$
    - vi. None of the above.
- **e.** [1] How many ways can you pick $k$ frogs out of a collection of $n$ distinct frogs where $k \le n$?
    - i. $\binom{n}{k}$
    - ii. $P(n, k)$
    - iii. $n^k$
    - iv. $\left(\!\!\binom{n}{k}\!\!\right)$
    - v. $\left(\!\!\binom{k}{n}\!\!\right)$
    - vi. None of the above.
- **f.** [1] $\binom{9001}{2}$ simplifies to
    - i. $9001 \cdot 8999$
    - ii. $\frac{9000 \cdot 8999}{2}$
    - iii. $\frac{9001 \cdot 9000}{2}$
    - iv. $9001 \cdot 9000$
    - v. None of the above.
- **g.** [1] How many ways can you select and order $k$ objects out of $n$ distinct object types if there is no limit on the number of times you can pick one particular type of object?
    - i. $\binom{n}{k}$
    - ii. $P(n, k)$
    - iii. $n^k$
    - iv. $\left(\!\!\binom{n}{k}\!\!\right)$
    - v. $\left(\!\!\binom{k}{n}\!\!\right)$
    - vi. None of the above.
- **h.** [1] How many injective functions are there from $A$ to $B$ if $|A| = k$, $|B| = n$ and $n \ge k$?
    - i. $\binom{n}{k}$
    - ii. $P(n, k)$
    - iii. $n^k$
    - iv. $\left(\!\!\binom{n}{k}\!\!\right)$
    - v. $\left(\!\!\binom{k}{n}\!\!\right)$
    - vi. None of the above.

---

## Section 2: Formal proofs

### Problem 3 [4]

Let $\Pr$ be a PMF on a finite sample space $S$. Give a formal proof that for all events $A, B \subseteq S$,

$$
\Pr\{A \cup B\} \ge \Pr\{A - B\} + \Pr\{B - A\}
$$

You do not need to prove any set theory results that you use.

*Reminder:* In a formal proof you must explicitly define all needed objects and need to justify every step in your work (other than set theory results for this question).

### Problem 4 [4]

Give a formal proof that for all sets $A$ and $B$, the sets $A \cap B$ and $A \cap \overline{B}$ partition $A$.

*Reminder:* Venn diagrams cannot be used in a formal proof and you must justify every step in your work.

---

## Section 3: Counting and probability

### Problem 5 [6]

For a fixed $n \ge 4$ use the inclusion-exclusion principle to find a non-recursive expression for the number of solutions to

$$
x_1 + x_2 + \ldots + x_n \le 2n \quad \text{where } x_i \in \{-1, 0, 1, \ldots, n\}
$$

*Hint:* If you get stuck, try first solving the case where $n = 4$. Your final solution will be a function of $n$.

### Problem 6 [4]

Consider an $n$ step staircase for some $n \in \mathbb{N}$ that you wish to ascend. Suppose that you can either take 1, 2 or 3 steps at a time. Find a recursive function $f: \mathbb{N} \to \mathbb{N}$ that computes the number of ways that you can choose to ascend the staircase under these rules.

Here is a diagram for such a staircase. Here for your first step you can choose to move to step 1, 2 or 3.

![](media/final2024-staircase.jpeg)

### Problem 7 [6]

- **a.** *Not present in the source PDF.* From part (b), the setup involves a litter of $n$ kittens and the sex of each.
- **b.** [3] Suppose that you learn that the firstborn kitten is a male. Find an expression for the probability that at least one of the kittens is female given this new information.

    Your final solution will be a function of $n$.

### Problem 8 [4]

*Not present in the source PDF.*

### Problem 9 [1]

*Not present in the source PDF.*
