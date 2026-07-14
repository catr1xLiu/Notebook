
## Definition: Event

First, we define a sample space $S$, which is the set of all elementary events.
- We do a countable amount of experiments. (e.g. toss a coin twice)
- Collect all possible outcomes. (e.g. $(TT, TH, HT, HH)$)
Event $E \subseteq S$  is the combination of one or more elementary events happening.

Events $A, B \subseteq S$ are **mutually exclusive** if $A \cap B = \emptyset$
 
## Definition: Probably Distribution

A function $P_n$ can be used to describe the probably distribution for sampling space $S$ $$
P_n: \mathcal{P}(S) \rightarrow R
$$
- $\forall A \subseteq S: \quad P_n(A) \geq 0$
- $P_n(S) = 1$
- For two mutually exclusive events $A, B$: $A \cap B = \emptyset \implies P_n(A) + P_n(B) = P_n(A \cup B)$

#### Discreteness 

A probability distribution is **discrete** if $S$ is **finite**. *We only consider finite $S$ in this course.* 

#### Uniform
A probability distribution is **uniform** if: $$
\forall \text{ elementry events }e_1, e_2, ... \in S: \quad P_n(e_i) = P_n(e_j)
$$
This implies that: $$
\forall A \subseteq S: \quad P_n(A) = \frac{|A|}{|B|}
$$

## Hint: Relevant Claims

For event space $S$ that $|S| = n$ and probability distribution $P_n: \mathcal{P}(S) \rightarrow R$: 

#### Null Event
**Claim:**
$$
P_n(\emptyset) = 0
$$
#### Probability Magnitude
**Claim:**
$$
\forall A, B \subseteq S:\quad A \subseteq B \implies P_n(A) \leq P_n(B)
$$

#### Combining
**Claim:**
$$
P_n(A \cup B) = P_n(A) + P_n(B) - P_n(A \cap B)
$$

