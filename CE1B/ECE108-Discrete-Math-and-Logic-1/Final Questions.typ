#import "@preview/obsidius:0.1.1": *
#show: notes.with("Final Questions")

== Question 2
<question-2>
Let $cal(A) = { a \, b \, c \, dots.h.c \, z }$ denote the alphabet, let
$S$ denote the set of all possible non-empty strings of finite length:
$ S = union.big_(n = 1)^oo cal(A)^n $

Prove that $S$ is #strong[countably infinite];.

#strong[Solution:]

Define function $h : S arrow.r bb(N)^26$ as a mapping from a letter to
its position in $cal(A)$, $h \( a \) = 1 \, dots.h.c h \( z \) = 26$.
Let $P = { 2 \, 3 \, 5 \, 7 \, 11 \, 13 \, 17 \, dots.h.c }$ denote the
set of all prime numbers, labeled $p_1 \, p_2 \, p_3 \, dots.h.c$, we
know there are infinitely many. Now we can define function
$f : S arrow.r bb(N)^(+)$ as:
$ f \( s \) = product_(i = 1)^n thin p_i^(h \( s_i \)) = p_1^(h \( s_1 \)) times p_2^(h \( s_2 \)) times dots.h.c times p_n^(h \( s_n \)) $
where $s in S$ is a string of length $n$, $p_i^(h \( s_0 \))$ is the
i-th prime number raised to the letter at the i-th position, the letter
is converted to number using $h$. With
$forall u \, v in S \, thin u eq.not v$, we have:
$ u eq.not v arrow.r.double.long exists i : u_i eq.not v_i arrow.r.double.long p_i^(h \( u_i \)) eq.not p_i^(h \( v_i \)) $
By the definition of prime numbers, $p_i$ is not a multiple nor a factor
of all other $p$ in the expression. So
$u eq.not v arrow.r.double.long f \( u \) eq.not f \( v \)$, which means
$f : S arrow.r bb(N)^(+)$ is an injection. Therefore, $S$ is
#strong[countable];.

We assume, for the sake of contradiction, that there exists
#strong[bijection]
$ exists n in bb(N) \, quad upright("bijection ") g : S arrow.r bb(N)^n quad \( 1 \) $
Since $g$ is a bijection, it has inverse $g^(- 1)$ and
$upright("range") \( g \) = upright("codomain") \( g \) = bb(N)^n$. Let
$I subset.eq S$ denote the range of its inverse:
$ I = { g^(- 1 } \( 1 \) \, g^(- 1) \( 2 \) \, dots.h.c \, g^(- 1) \( n \)) $
Select string $s_(upright("max")) in I$ to be one of the strings that
has maximum length in $I$ (multiple may exist, select any one). Append
letter a to it: $s' = s_(upright("max")) + a$. The new string $s' in S$
is longer than any other strings in $I$, so
$s' in.not I arrow.r.double.long g \( s' \) in.not bb(N)^n$. This
contradicts our assumption $\( 1 \)$. Therefore, no such bijection
$g : S arrow.r bb(N)^n$ can exist, which means $S$ is #strong[infinite];.

Since $S$ is both #strong[countable] and #strong[infinite];, $S$ is
countably infinite.

== Question 3
<question-3>
