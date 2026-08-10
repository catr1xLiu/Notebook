

## Question 2

Let $\mathcal{A} = \set{a, b, c, \cdots, z}$ denote the alphabet, let $S$ denote the set of all possible non-empty strings of finite length:
$$S = \bigcup_{n=1}^\infty \mathcal{A}^n$$

Prove that $S$ is **countably infinite**.


**Solution:**

Define function $h: S \to \mathbb{N}^{26}$ as a mapping from a letter to its position in $\mathcal{A}$, $h(a)=1, \cdots h(z)=26$. 
Let $P = \set{2, 3, 5, 7, 11, 13, 17, \cdots}$ denote the set of all prime numbers, labeled $p_1, p_2, p_3, \cdots$, we know there are infinitely many. 
Now we can define function $f:S \to \mathbb{N}^+$ as:
$$ f(s) = \prod _{i=1}^n \, p_i^{h(s_i)} = p_1^{h(s_1)} \times p_2^{h(s_2)} \times \cdots \times p_n^{h(s_n)}$$
where $s\in S$ is a string of length $n$, $p_i^{h(s_0)}$ is the i-th prime number raised to the letter at the i-th position, the letter is converted to number using $h$. 
With $\forall u,v \in S, \, u\neq v$, we have:
$$ u\neq v \implies \exists i: u_i \neq v_i \implies p_i^{h(u_i)} \neq p_i^{h(v_i)}$$
By the definition of prime numbers, $p_i$ is not a multiple nor a factor of all other $p$ in the expression. So $u\neq v \implies f(u) \neq f(v)$, which means $f: S\to \mathbb{N}^+$ is an injection. Therefore, $S$ is **countable**. 


We assume, for the sake of contradiction, that there exists **bijection** 
$$ \exists n \in \mathbb{N}, \quad \text{bijection }g:S\to \mathbb{N}^n \quad (1)$$
Since $g$ is a bijection, it has inverse $g^{-1}$ and $\text{range}(g) = \text{codomain}(g) = \mathbb{N}^n$. Let $I \subseteq S$ denote the range of its inverse:
$$ I = \set{g^{-1}(1), g^{-1}(2), \cdots, g^{-1}(n)} $$
Select string $s_\text{max} \in I$ to be one of the strings that has maximum length in $I$ (multiple may exist, select any one). Append letter a to it: $s' = s_\text{max} + a$. The new string $s' \in S$ is longer than any other strings in $I$, so $s' \notin I \implies g(s') \notin \mathbb{N}^n$. This contradicts our assumption $(1)$. Therefore, no such bijection $g: S\to \mathbb{N}^n$ can exist, which means $S$ is **infinite**. 


Since $S$ is both **countable** and **infinite**, $S$ is countably infinite. 


## Question 3

