## Chapter 4

## Combinatorics

This chapter addresses combinatorics, ways in which items can be chosen from a set. We will deal with finite sets only. We begin with some examples, which illustrate the different kinds of problems we deal with.

Example 1. A committee comprises a chairperson, an outreach coordinator and a treasurer. There are 10 candidates, and one person may serve more than one role. In how many different ways can the committee be constituted?

For each of the three positions, we have all 10 candidates available. Thus, the total number of ways is 10<sup>3</sup> = 1000.

Example 2. Suppose we have the same situation as Example 1, but one person may serve at most one role. In how many different ways can the committee be constituted?

We have 10 ways to choose a chairperson. Once we choose a chairperson, we have 9 ways in which we can choose the outreach coordinator, and then 8 ways in which we can choose the treasurer. Thus, the total number of ways is 10 × 9 × 8 = 720.

Example 3. A committee comprises three officers, each of whom must be a different person, and there are 10 candidates. In how many different ways can the committee be constituted?

In this case, we no longer distinguish the officers' roles, e.g., as chairperson, outreach coordinator and treasurer. But three distinct people must be chosen from the set of 10. One way to count is to repeat the approach of Example 2 above, and then account for the number of possibilities that should be treated as the same.

Example 2 tells us that there are 720 ways, if we distinguish each officer's role. Suppose we have chosen a person, call her Alice to serve as officer 1, Bob to serve as officer 2 and Carol to serve as officer 3. This is the same as, for example, choosing Bob as officer 1, Carol as officer 2 and Alice as officer 3.

Denoting Alice as a, Bob as b and Carol as c, the number of different rearrangements of ⟨a, b, c⟩ is six: ⟨a, b, c⟩, ⟨a, c, b⟩, ⟨b, a, c⟩, ⟨b, c, a⟩, ⟨c, a, b⟩ and ⟨c, b, a⟩. Thus, to count all 6 of those ways as the same, we divide; i.e., our solution is 720/6 = 120.

That is, the 720 different ways can be perceived as 120 groups of 6 each, where within each group, we have the same set of three officers.

Example 4. A committee comprises three officers, not all of whom need to be distinct individuals. There are 10 candidates. In how many different ways can the committee be constituted?

In this case, we can either choose (i) one person to serve all three roles, (ii) two persons, one of whom serves two roles and the other one role, or, (iii) three persons. In case (ii), we need to distinguish which person serves two roles, i.e., for example, if the two chosen people are Alice and Bob, then we count Alice serving two roles and Bob one role as distinct from the situation that Bob serves two roles and Alice serves one role.

In case (i), we have 10 different ways. In case (ii), we have 10 × 9 = 90 different ways. And in case (iii), we have 120 different ways, which we deduced in Example 3 above. Thus, the total is 220 different ways.

The four examples above correspond to the four broad classes of selection we address. In Example 1, the selection is ordered with replacement. That is, the order of the choices matters, i.e., first vs. second vs. third, or chairperson vs. outreach coordinator vs. treasurer. But once a choice is made, e.g., of chairperson, the set from which we choose is replenished, i.e., the chosen one is replaced with a replica of that person.

In Example 2, the selection is ordered without replacement. The ordering

matters, e.g., if Alice is chosen as chairperson and Bob as outreach coordinator, that is different from Alice being chosen as outreach coordinator and Bob as chairperson. Also, the original set is not replenished once a choice is made. E.g., if Alice is chosen to be chairperson, then she is no longer available to serve any other role.

In Example 3, the selection is unordered without replacement. The "unordered" refers to the fact that all the members of the subset that is our selection are made simultaneously. There is no longer a first selection, then a second and so on. It is without replacement in that once a selection is made, the original set is not replenished.

In Example 4, the selection is unordered with replacement. The selection is unordered in that the subset that is our selection is contituted in one shot, and not one member of it at a time. However, there are limitlessly many replicas of each member in the original set from which we select the subset.

## Principles

We now discuss the several underlying principles that help us navigate these sorts of questions regarding the number of possibilities in a particular setting.

"And" vs. "or" The first principle we discuss is a recognition of the use of "and" vs. "or" in the context of counting the number of different ways to make a selection. "And" is of course akin to conjunction, "∧," in propositional logic, and intersection, "∩," between sets. "Or" is a bit more subtle in this context. It is not "inclusive or," which is akin to disjunction, "∨," in propositional logic, and union, "∪," between sets. Rather, it is "mutually exclusive or," which some folks represent using a new propositional logic operator "⊕." Its semantics, expressed in English, is, "one or the other, but not both." Using ¬, ∨ and ∧, a ⊕ b ⇐⇒ (a ∨ b) ∧ (¬(a ∧ b)) ⇐⇒ (a ∧ ¬b) ∨ (b ∧ ¬a) ⇐⇒ (a ∨ b) ∧ (¬a ∨ ¬b).

"And" is typically used as part of putting together a selection. And when we use "and," we usually multiply the pieces that are and-ed together. "Or" is used to distinguish two different selections. And when we use "or," we usually add the different possibilities.

Example 5. Jack has three books to read, Book 1, 2 and 3. He decides to either pick two of them, one to read during the day and the other at bedtime, or one only, to read during the day and at bedtime. How may different possibilities do we have for Jack's decision?

This problem has both "and" and "or" components that can be called our clearly. The number of different possibilities can be expressed as:

Jack can pick:

- (A) (one book for daytime AND another for bedtime) OR
- (B) (one book for both day- and bedtime)

The number of possibilities corresponding to (A) is 3×2, i.e., a multiplication to correspond to the AND. The number of possibilities corresponding to (B) is 3. And we add the number of possibilities for (A) and (B) to correspond to the OR between them. So the solution is: 3 × 2 + 3 = 9.

Pigeonhole principle The pigeonhole principle is: if we have n pigeonholes and more than n pigeons, then there must be a pigeonhole that houses more than one pigeon. It is called a "principle" because it is considered so self-evident that we do not bother proving it. However, can prove it by, for example, contradiction. Assume that we have n piegonholes, more than n pigeons, and that every pigeonhole has at most one pigeon. Then, if we sum the total number of pigeons across all pigeonholes, that sum ≤ n, which contradicts the assumption that we have more than n pigeons.

The pigeonhole principle is useful in counting possibilities in certain situations.

Example 6. How many people do we need in a group so we can guarantee that the birthdays of at least two of them fall in the same month?

Answer: 13. Because we have 12 "pigeonholes."

Example 7. We have 30 books that we want to put in 20 bags, each of which can hold all 30 books, if needed. Then, we know that there exists a bag with at least two books. And that is the strongest assertion we can make.

Example 8. In every set M of n ≥ 2 integers, there exist distinct a, b ∈ M such that the difference a − b is divisible by n − 1.

A special case of the above assertion is Claim 6 from Chapter 2, under "Proof techniques": given any set {a, b, c} of integers, at least one of the differences a−b, b−c, c−a must be divisible by 2, i.e., even. Another example is: given a set of 12 integers, at least one of the pairwise differences is divisible by 11.

For the original, general assertion, we can think of the "pigeonholes" as being 0, . . . , n − 2, which is every value any integer can be modulo n − 1. Thus, given n integers, there must exist at least two, i, j, such that i mod (n−1) = j mod (n − 1) ⇐⇒ (i − j) is divisible by n − 1.

Exponentiation When we make an ordered selection with replacement, we have repeated multiplications of the same number, i.e., exponentiation. An example is Example 1. Another example is the following.

Example 9. The children at a school are taking field trips every day of the five days the following week, and need a teacher to act as chaperone for each trip. There are six teachers from which to choose a chaperone for each field trip. What is the total number of possiblities of assigning a chaperone to each field trip?

The problem does not preclude the same teacher acting as chaperone for multiple field trips. Therefore, the total number of possibilities is 6 5 .

Example 10. The set of bit strings of length n, for some n ∈ N, is:

$$\underbrace{\{0,1\} \times \ldots \times \{0,1\}}_{n \text{ times}} = \{0,1\}^n$$

The number of bit strings of length n is |{0, 1} n | = 2<sup>n</sup> . The number of bit strings of length n that all begin and end with the same bit = 2 1 × 2 <sup>n</sup>−<sup>2</sup> = 2 n−1 . The number that begin and end with different bits = 2<sup>n</sup> − 2 <sup>n</sup>−<sup>1</sup> = 2 n−1 (2 − 1) = 2<sup>n</sup>−<sup>1</sup> . The number that have no consecutive bits the same = 2, because our choice of the first bit immediately gives us a choice for all n bits.

Factorial Recall that the factorial of n, denoted n!, for n ∈ W = {0, 1, 2, . . .} is defined using a recurrence as follows:

$$n! = \begin{cases} 1 & \text{if } n = 0 \\ n \times (n-1)! & \text{otherwise} \end{cases}$$

The factorial function corresponds to the number of rearrangements of n distinct items. That is, if we have a set of n distinct items, the number of different ways in which they can be arranged is n!.

Example 11. Eight friends go to a movie and buy tickets with assigned seating. The number of different ways in which they can occupy those seats is 8! = 40, 320.

Example 12. Bob has three different shirts and two different suits. How many different arrangements do we have in which he can hang them in his closet? What if every shirt is to be to the left of all the suits?

The answer to the first question is 5! because we have 5 items and 5! different ways to order them. The answer to the second is 3! × 2!. As a sanity check, we observe that 5! > 3!×2!, which is what we would expect, because the second situation is more constrained than the first.

Example 13. How many different ways do we have to arrange 8 different math books, 5 different physics books and 7 different chemistry books such that all books of each subject are to be together?

Answer: 3! × 8! × 5! × 7!. The 3! is for the order of the subjects.

Example 14. How many rearrangements the letters does "BANANA" have?

If all its letters were distinct, "BANANA" we would have 6!. However, in any such arrangement, a rearrangement of the A's and/or N's yields the same rearrangement of "BANANA." Thus, the solution is:

$$\frac{6!}{3! \ 2!}$$

Permutation Given a set of n items, a permutation, or more specifically, a k-out-of-n permutation, is an arrangement of k of the n items from the set. For example, if the set S = {1, 2, 3}, then there are six 2-out-of-3 permutations: ⟨1, 2⟩, ⟨1, 3⟩, ⟨2, 1⟩, ⟨2, 3⟩, ⟨3, 1⟩, ⟨3, 2⟩.

A special case is when k = n, i.e., an n-out-of-n permutation, which is also simply called a permutation of the n items. We represent a k-out-of-n permutation as P(n, k). And we can intuit what P(n, k) is as follows. We have n ways to pick the first item in the sequence, n − 1 ways to pick the second, . . . , and n − k + 1 wants to pick the k th item. Thus:

$$P(n,k) = \frac{n!}{(n-k)!}$$

Note that built into this notion of a permutation is that it is a kind of selection without replacement. Indeed, it is ordered selection without replacement. For example, Example 2 is exactly P(10, 3).

Example 15. The number of 4-letter strings where each letter is one of the 26 in the English alphabet is P(26, 4).

Example 16. In how many different ways can be place 8 identical black pawns and 8 identical white pawns on a standard 8 × 8 chess board such that each pawn is in a square by itself ?

If the pawns were all distinct from one another, then our solution would be P(64, 16). Given that we have two sets of 8 identical pawns each, we need to "factor" out duplicate arrangements. Once we have chosen the squares in which the 8 black pawns go, any rearrangement of those black pawns within those same squares is treated as the same arrangement. Thus, our solution is:

$$\frac{P(64, 16)}{8! \ 8!}$$

Example 14 and the above example are instances of what we can call generalized permutation. If we have n<sup>1</sup> indistinguishable items of Type<sup>1</sup> , n<sup>2</sup> of Type<sup>2</sup> , . . . , n<sup>k</sup> of Type<sup>k</sup> , and n<sup>1</sup> + . . . + n<sup>k</sup> = n, then the number of ways to arrange them is:

$$\frac{n!}{n_1! \, n_2! \dots n_k!}$$

Combination A k-out-of-n combination is a simultaneous, unordered selection of k items from a set of n items. We represent it as n k , which is read as "n choose k." We can think of such a selection as first, an ordered selection, i.e., P(n, k), and then dividing by k! so selections that should be counted as the same are indeed counted as the same.

That is, n k = P(n, k)/k!, because the k! rearrangements (permutations) of the k chosen items from n are all to be treated the same. Thus:

$$\binom{n}{k} = \frac{n!}{(n-k)! \ k!}$$

 n k corresponds to unordered selection without replacement. An example is Example 3, in which we ask in how many different ways we can choose 3 distinct officers from 10 people. The answer is 10 3 .

Another example is Example 16, which we can approach as follows. We first pick the 16 squares on which the pawns are to be placed. Then, from amongst those 16, we choose 8 for the black pawns. Thus, the solution is:

$$\binom{64}{16} \times \binom{16}{8}$$

We can (and should) double-check that this yields the same solution as our approach using permutations does.

From permutations :

$$\frac{P(64,16)}{8! \ 8!} = \frac{64!}{48! \ 8! \ 8!}$$

From combinations :

$$\binom{64}{16} \times \binom{16}{8} = \frac{64!}{16! \ 48!} \times \frac{16!}{8! \ 8!} = \frac{64!}{48! \ 8! \ 8!}$$

Example 17. In how many different ways can we arrange 8 identical copies of "Pride & Prejudice" and 5 identical copies of "Sense & Sensibility" on a shelf ?

One way to look at this is to observe that we have 13 slots to fill on the shelf, and we choose 8 of them, unordered, for "Pride & Prejudice." This should be (and is) equivalent to choosing 5 of the slots for "Sense & Sensibility." So the solution is:

$$\binom{13}{8} = \binom{13}{5}$$

The above example is a good illustration of the intuition behind the fact that  $\binom{n}{k} = \binom{n}{n-k}$ . Picking k items from a set of n is identical to picking the n-k items to leave out. A special case is  $\binom{n}{0} = \binom{n}{n} = 1$ . That is, there is only one way to choose nothing from a set of size n, and this is the same number of ways in which we can choose everything from the set. We present one more example, before we discuss the binomial theorem.

**Example 18.** In how many different ways can a pack of 52 distinct cards be dealt in to four hands of 13 cards each?

We first select 13 cards, unordered, for the first hand from all 52. For the second hand, we select 13 cards from the remaining 39, and so on. So the solution is:

$$\binom{52}{13} \times \binom{39}{13} \times \binom{26}{13} \times \binom{13}{13}$$

We first observe that simplifying the above solution yields:

$$\frac{52!}{13! \ 39!} \times \frac{39!}{13! \ 26!} \times \frac{26!}{13! \ 13!} \times \frac{13!}{13! \ 0!}$$

$$= \frac{52!}{13! \ 13! \ 13! \ 13!}$$

This makes sense. This corresponds to every permutation of the 52 cards, but within each group of 13, we treat them as unordered.

Another aspect is that in the above mindset, the hands themselves are ordered. Otherwise, we would divide the above by 4!.

We now present the binomial theorem. As a clarification of terminology, a polynomial in n variables,  $x_1, \ldots, x_n$  is a summation of terms, each of the form  $c \times x_1^{c_1} \times x_2^{c_2} \times \ldots \times x_n^{c_n}$ , where c is a constant integer, and each  $c_i$  is a constant non-negative integer. A monomial is a polynomial that has one term only, and a binomial is a polynomial that has two terms only. The binomial theorem identifies the terms of  $(x + y)^n$ , where x, y are variables, and  $n \in \mathbb{N} = \{1, 2, \ldots\}$ .

Claim 37 (Binomial theorem). For n ∈ N,

$$(x+y)^n = \sum_{i=0}^n \binom{n}{i} x^i y^{n-i}$$

For example,

$$(a-b)^3 = {3 \choose 0} a^0 (-b)^3 + {3 \choose 1} a^1 (-b)^2 + {3 \choose 2} a^2 (-b)^1 + {3 \choose 3} a^3 (-b)^0$$
  
=  $-b^3 + 3ab^2 - 3a^2b + a^3$ 

Proof. By induction on n. For the base case, the left hand side of the equation is x + y. The right hand side is 1 0 x 0 y <sup>1</sup> + 1 1 x 1 y <sup>0</sup> = x + y.

For the step:

$$(x+y)^{n} = (x+y)(x+y)^{n-1}$$

$$= (x+y)\sum_{i=0}^{n-1} \binom{n-1}{i} x^{i} y^{n-1-i}$$

$$= (x+y)\sum_{i=1}^{n} \binom{n-1}{i-1} x^{i-1} y^{n-i}$$

$$= \sum_{i=1}^{n} \binom{n-1}{i-1} x^{i} y^{n-i} + \sum_{i=1}^{n} \binom{n-1}{i-1} x^{i-1} y^{n-i+1}$$

$$= \sum_{i=1}^{n} \binom{n-1}{i-1} x^{i} y^{n-i} + \sum_{i=0}^{n-1} \binom{n-1}{i} x^{i} y^{n-i}$$

$$= \binom{n-1}{0} x^{0} y^{n} + \binom{n-1}{i-1} \binom{n-1}{i-1} + \binom{n-1}{i} x^{i} y^{n-i} + \binom{n-1}{n-1} x^{n} y^{0}$$

$$= \binom{n}{0} x^{0} y^{n} + \binom{n-1}{i-1} \binom{n-1}{i-1} + \binom{n-1}{i} x^{i} y^{n-i} + \binom{n}{n} x^{n} y^{0}$$

And, we have:

$$\binom{n-1}{i-1} + \binom{n-1}{i} = \frac{(n-1)!}{(i-1)!} + \frac{(n-1)!}{(n-1-i)!} \frac{i!}{i!}$$

$$= \frac{(n-1)!}{(i-1)!} \frac{1}{(n-i-1)!} \frac{1}{n-i} \frac{1}{i}$$

$$= \frac{(n-1)!}{(i-1)!} \frac{n}{(n-i-1)!} \frac{n}{(n-i)}$$

$$= \frac{n!}{(n-i)!} = \binom{n}{i}$$

Thus, the coefficients are given exactly by the combinations. An example of an application of the binomial theorem is expressed by the following claim.

Claim 38. Given a finite set S of  $n \in \mathbb{N}$  members, the number of subsets of S, i.e., the cardinality of  $\mathscr{P}(S)$ , is  $2^n$ .

*Proof.* We ask how many subsets of size  $0, 1, \ldots, n$  the set S has. And these correspond exactly to unordered selection of items from S. That is, S has  $\binom{n}{0} = 1$  subset of size  $0, \binom{n}{1} = n$  subsets of size  $1, \ldots, \binom{n}{n} = 1$  subset of size n. Thus, the total number of its subsets is:

$$\sum_{i=0}^{n} \binom{n}{i}$$

$$= \sum_{i=0}^{n} \binom{n}{i} 1^{i} 1^{n-i}$$

$$= (1+1)^{n} = 2^{n}$$

As a final disussion point about combinations, before we introduce the notion of multichoose below, we revisit Example 4. Recall that that was an example of unordered selection with replacement: we seek the number of ways in which three officers can be chosen from a pool of 10, where an individual is allowed to occupy more than one officer position.

One way to think about this, which results in re-posing the question as one about combinations, is the following. Each officer position is an identical

"ball." Each of the 10 candidates is a "bin." We ask in how many ways we can have the 10 bins contain the 3 balls, such that each bin contains between 0 and 3 balls. To visualize the bins, we can think of 9 partitions, which results in 10 bins. For example, the following picture depicts the 9 partitions which result in 10 bins, with the first bin containing one ball, and the fifth bin containing the other two. This would be one of the ways in which the bins can contain the balls.

![](_page_11_Picture_3.jpeg)

To further converge towards a way of counting the different possibilities, the balls-and-bins situation in the above picture can be thought of as a bit-string, i.e., string of 0's and 1's. For example, the scenario above is the bit-string 011110011111. And what we are asking is: how many bit-strings of length 12 do we have that contain exactly three 0's?

The answer to that question is a simple combination: we pick three of the 12 bit positions to be a 0. That is, the solution is:

$$\binom{12}{3} = \frac{12 \times 11 \times 10}{3 \times 2} = 220$$

Multichoose The above example illustrates multichoose: unordered selection with replacement. k-out-of-n multichoose is represented as:

$$\binom{n}{k}$$

And it turns out that there is a simple formula for it based on combination:

$$\binom{\binom{n}{k}} = \binom{n+k-1}{k}$$

In Example 4, n = 10, k = 3, and so <sup>10</sup> 3 = 10+3−1 3 = 12 3 . Example 19. We have decided to add 5 dashes of powdered spice to a dish. We have available to us bags of 9 different powdered spices. How many ways are there to select those 5 dashes from the 9?

This is unordered selection with replacement, because we assume that we have a limitless amount of each spice available, or at least a sufficient amount of each of the 9 spices for 5 dashes. Thus, the solution is:

$$\begin{pmatrix} 9 \\ 5 \end{pmatrix} = \begin{pmatrix} 9+5-1 \\ 5 \end{pmatrix}$$

Example 20. In a large basket, we have a medley of apples, oranges and pears. We reach in and pick 4 pieces of fruit. How many different possibilities do we have of sets of the 4 pieces of fruit?

The solution is:

$$\begin{pmatrix} 3 \\ 4 \end{pmatrix} = \begin{pmatrix} 3+4-1 \\ 4 \end{pmatrix} = \begin{pmatrix} 6 \\ 4 \end{pmatrix} = 15$$

The above example illustrates an important point about multichoose. In kout-of-n multichoose, it is certainly possible that k > n. This makes sense, because it is selection with replacement. Therefore, even though we have only n < k distinct items, we can pick more than n items because the items are replenished, i.e., it is with replacement. This is different from, for example, combinations and permutations. In both those cases, for k-out-of-n, it must be the case that k ≤ n. In those cases, the selection is without replacement.

Principle of inclusion-exclusion We begin with an example question: among 100 students, 75 take a math course, 50 take a physics course, and 45 take both. How many take at least one of those two courses?

The principle of inclusion-exclusion is useful is answering questions such as these. It is based in the following observations, and their corresponding generalizations. For finite sets, it is true that:

$$|A \cup B| = |A| + |B| - |A \cap B|$$
  

$$|A \cup B \cup C| = |A| + |B| + |C| - (|A \cap B| + |A \cap C| + |B \cap C|) + |A \cap B \cap C|$$

Example 21. Among 100 students, 75 take a math course, 50 take a physics course, and 45 take both. How many take at least one of those two courses?

Let M be the set each of whom takes a math course, and P that takes the physics course. We seek |M ∪ P|. And by the formula above, it is 75 + 50 − 45 = 80.

And therefore, the number that take neither is 100 − 80 = 20.

## Discrete Probability

We now introduce probability, which captures the notion of the likelihood that an event may occur. We begin with the notion of an experiment which is something we conduct or happens, and has one or more outcomes. Each outcome in the context of an experiment is called an elementary event. A sample space is a set of elementary events.

For example, our experiment may be a toss of a two-sided coin, which has one of two possible outcomes, heads or tails. We could associate the symbol H with the elementary event that is the former, and T with the elementary event that is the latter. The set {H, T}, then, is a sample space. Similarly, we may associate the toss of a 6-sided die with the sample space {1, 2, . . . , 6}, where each of its members represents the elementary event that the die lands on that number.

Note: in this course, we deal with space spaces that are finite, and therefore countable, only. Some of the following notions rely on this assumption.

An event is a subset of a sample space. For example, given the sample space {HH, HT, T H, T T}, that is the set of elementary events associated with tossing two coins, the subset {HH, HT, T H} is an event; it is the event that we get at least one heads. A sample space is a subset of itself, and is therefore an event, which we can call the certain event. The emptyset, ∅, is the null event. Given a sample space S and two events A, B ⊆ S, we say that the events A and B are mutually exclusive if A ∩ B = ∅. E.g., in tossing two coins, the event that we get no tails, {HH}, is mutually exclusive from the event that the first toss is a tails, {T H, T T}. We can think of each elementary event s ∈ S as an event {s}; the elementary events are mutually exclusive from one another.

Probability A probability distribution, Pr, is a function from the powerset of a sample space S to the real numbers R that satisfies the following axioms, which are called the probability axioms.

- 1. Pr{A} ≥ 0 for every event A ⊆ S.
- 2. Pr{S} = 1. (This is why we call S the certain event.)

3. For pairwise mutually exclusive events A1, . . . , An,

$$\Pr\{A_1 \cup A_2 \cup \ldots \cup A_n\} = \Pr\{A_1\} + \Pr\{A_2\} + \ldots + \Pr\{A_n\}$$

Note: we choose to write Pr{·} rather than Pr(·), i.e., with the customary round backets that we use for functions, merely to emphasize that while Pr{·} is a function, it is a function that happens to be a probability distribution.

We call Pr{A} the probability of the event A. For example, suppose we associate the sample space S = {1, 2, . . . , 6} with the roll of a 6-sided die. And suppose Pr{1} = Pr{2} = . . . = Pr{5} = 1/10, and Pr{6} = 1/2. Then, such a Pr can be a probability distribution. (We need to assert, in addition, that Axiom 3 is satisfied.)

A probability distribution is said to be discrete if it is defined over a sample space that is countable. As our note above says, in this course, we deal with finite, and therefore countable, sample spaces only. Thus, all probability distributions with which we deal are discrete. In a discrete probability distribution over a sample space S, for an event A ⊆ S:

$$\Pr\{A\} = \sum_{s \in A} \Pr\{s\}$$

Given the above probability axioms, we can establish a number of claims for a discrete probability distribution, Pr.

Claim 39. Pr{∅} = 0.

Proof. Assume otherwise for the purpose of contradiction, i.e., assume Pr{∅} > 0. We observe that if S is the sample space, then S ∩ ∅ = ∅, that is, S and ∅ are mutually exclusive. Therefore, Pr{S ∪ ∅} = Pr{S} = Pr{S}+Pr{∅} > 1, a contradiction to the axiom Pr{S} = 1.

Claim 40. If A ⊆ S is an event, then Pr A = 1 − Pr{A}.

*Proof.* 
$$\overline{A} = S \setminus A$$
. And  $\overline{A} \cap A = \emptyset$ . Therefore,  $\Pr\{\overline{A} \cup A\} = \Pr\{S\} = 1 = \Pr\{\overline{A}\} + \Pr\{A\} \implies \Pr\{\overline{A}\} = 1 - \Pr\{A\}$ .

The above claim can be useful in intuiting the probability of an event by considering its complement. For example, for the events associated with the toss of two coins, suppose each of the elementary events HH, HT, T H, T T has equal probability of 1/4. Then, Pr{at least one heads} = 1−Pr{no heads} = 1 − Pr{T T} = 1 − 1/4 = 3/4.

Claim 41. For events A, B with A ⊆ B, it is true that Pr{A} ≤ Pr{B}.

Proof. 
$$B \supseteq A \implies B = A \cup (B \setminus A) \implies \Pr\{B\} = \Pr\{A\} + \Pr\{B \setminus A\} \implies \Pr\{B\} \ge \Pr\{A\}.$$

Claim 42. Pr{A ∪ B} = Pr{A} + Pr{B} − Pr{A ∩ B}.

Proof.

$$A = (A \setminus (A \cap B)) \cup (A \cap B)$$

$$\Rightarrow \Pr\{A\} = \Pr\{A \setminus (A \cap B)\} + \Pr\{A \cap B\}$$

$$B = (B \setminus (A \cap B)) \cup (A \cap B)$$

$$\Rightarrow \Pr\{B\} = \Pr\{B \setminus (A \cap B)\} + \Pr\{A \cap B\}$$

$$\Rightarrow \Pr\{A\} + \Pr\{B\} - \Pr\{A \cap B\} =$$

$$\Pr\{A \setminus (A \cap B)\} + \Pr\{B \setminus (A \cap B)\} + \Pr\{A \cap B\} =$$

$$\Pr\{A \cup B\}$$

A corollary to the above claim is: Pr{A ∪ B} ≤ Pr{A} + Pr{B}.

Uniform probability distribution Given a sample space S = {s1, . . . , sn}, if Pr{s1} = . . . = Pr{sn}, we call such a Pr a uniform probability distribution. Given such a uniform distribution over a sample space S, and an event A ⊆ S, we have a relatively simple formula for Pr{A}:

$$\Pr\{A\} = \frac{|A|}{|S|}$$

**Example 22.** Suppose we toss three coins, with each outcome equally likely. What is the probability that we have at least two heads?

If S is the same space, then  $|S| = 2^3$ . The event A mentioned above occurs when we have either (i) exactly two heads, or, (ii) all three are heads. The number of ways in which (ii) can happen is 1. The number of ways in which (i) can happen is  $\binom{3}{2}$ . So:

$$Pr\{A\} = \frac{\binom{3}{2} + 1}{2^3} = \frac{1}{2}$$

**Example 23.** We have a basketful of apples, oranges, pears and peaches. We reach in and take two pieces of fruit in a manner that every multiset of two pieces of fruit is equally likely. What is the probability that we end up with two different kinds of fruit?

Let A be the event that we end up with two different kinds of fruit. Then,  $Pr\{A\} = 1 - Pr\{\overline{A}\}$ , where  $\overline{A}$  is the event that we end up with two of the same kind of fruit. The number of ways in which  $\overline{A}$  can happen is 4, because we have 4 different kinds of fruit.

All that remains is for us to intuit the size of the same space, call it S, which is all possible multisets of size 2. Our situation corresponds to unordered selection with replacement, and so:

$$Pr\{A\} = 1 - Pr\{\overline{A}\} = 1 - \frac{|\overline{A}|}{|S|} = 1 - \frac{4}{\binom{4}{2}}$$
$$= 1 - \frac{4}{\binom{4+2-1}{2}} = 1 - \frac{4}{10} = \frac{3}{5}$$

It is somewhat interesting to sanity-check the solution in the above example by changing the number of different kinds of fruit in the basket, call it d. The example considers the case that d = 4. The following table gives us the

probability of picking two different pieces of fruit for different values of d.

| d | d<br>Pr{A}<br>= 1<br>−<br>((d<br>2))                             |
|---|------------------------------------------------------------------|
| 1 | 1<br>1<br>−<br>−<br>1<br>= 1<br>1 = 0<br>(<br>1+2−1<br>)<br>2    |
| 2 | 2<br>2<br>1<br>−<br>= 1<br>−<br>3 = 1/3<br>(<br>2+2−1<br>)<br>2  |
| 3 | 3<br>3<br>−<br>−<br>1<br>= 1<br>6 = 1/2<br>(<br>3+2−1<br>)<br>2  |
| 4 | 4<br>4<br>1<br>−<br>= 1<br>−<br>10 = 3/5<br>(<br>4+2−1<br>)<br>2 |
| 5 | 5<br>5<br>1<br>−<br>= 1<br>−<br>15 = 2/3<br>(<br>5+2−1<br>)<br>2 |
| 6 | 6<br>6<br>1<br>−<br>= 1<br>−<br>21 = 5/7<br>(<br>6+2−1<br>)<br>2 |
| 7 | 7<br>7<br>1<br>−<br>= 1<br>−<br>28 = 3/4<br>(<br>7+2−1<br>)<br>2 |

The table suggests that as the number of kinds of fruit increases in the basket, the probability of picking two different kinds of fruit increases. This of course appeals to the common sense.

Conditional probability and independence Conditional probability addresses situations that we already have some prior knowledge about some outcomes. Consider the following game, which is from a TV show called "Let's Make a Deal."

There are three curtains, numbered 1, 2 and 3. Behind one of them is a desirable prize. Behind the other two, there is nothing. The game goes as follows. You are first asked to pick one of the curtains. The host then draws back one of the other curtains that does not contain the prize; we know that there is at least one. The host them gives you the opportunity to change your choice to the other curtain that remains closed.

Should we change our choice? Is it rational to do so?

We can pose this as a problem of intuiting the probability of winning if we switch our choice, given our a priori knowledge that the curtain that the host drew back does not contain the prize. If this probability is higher than 1/3, we should switch; otherwise, there is no rational reason to switch. The value 1/3 comes from our assumption that initially, we have a uniform distribution, i.e., the probability that the prize is behind any one of the curtains is 1/3.

The above problem is called "The Monty Hall problem," after the host of the game show. We revisit it after our discussions on conditional probability. A simpler example is: suppose we toss two coins, with every elementary event equally likely, and you know that one of them lands heads. So that is our a priori knowledge. What is the probability that both land heads?

The fact that one of the coins lands heads eliminates the event T T, that both land tails. So, the only possible events are HH, HT, T H. And therefore, the conditional probability in question is 1/3.

The conditional probability of an event A given that an event B occurs, i.e., Pr{B} ̸= 0, read as "the probability of A given B" is:

$$\Pr\{A \mid B\} = \frac{\Pr\{A \cap B\}}{\Pr\{B\}}$$

One way to understand the above formula is that we normalize the probability that both A and B occur by the probability that B occurs. For example, for our coin toss example above, A is the event that both coins land heads, and B is the event that one of them lands heads. And we have:

$$\Pr\{A \mid B\} = \frac{\Pr\{A \cap B\}}{\Pr\{B\}} = \frac{\Pr\{A\}}{\Pr\{B\}} = \frac{1/4}{3/4} = \frac{1}{3}$$

We exploited the fact that A ∩ B = A, because A ⊆ B.

We say that events A and B are said to be independent if Pr{A ∩ B} = Pr{A}Pr{B}. This is equivalent, if Pr{B} ̸= 0, to: Pr{A | B} = Pr{A}.

Example 24. Suppose we toss a coin once and then again, in a manner that every elementary event, HH, T T, HT, T H, is equally likely. Let A be the event that the first toss lands heads. And B be the event that the two tosses land differently. Are the events A and B independent?

We compare Pr{A} with Pr{A | B}.

$$\begin{split} & Pr\{A\} = 1/2 \\ & Pr\{A \mid B\} = \frac{Pr\{A \cap B\}}{Pr\{B\}} = \frac{Pr\{HT\}}{Pr\{HT, TH\}} = \frac{1/4}{2/4} = \frac{1}{2} \end{split}$$

Thus, the events A and B are indeed independent.

Example 25. You have a coin that you fear may be biased. That is, it lands heads with some probability p ∈ (0, 1), and tails with probability 1 − p. You do not know what p is, except that it is neither 0 nor 1. Devise a way to get a fair coin toss.

Consider the following approach. We repeatedly toss the coin twice till the two outcomes are different. Then we adopt the first of the two tosses as our result.

Why does this work? With every two tosses, we have the sample space S = {HH, HT, T H, T T}. And we observe that Pr{HT} = Pr{T H} = p(1 − p). That is, we have the same probability for the two events that correspond to different outcomes for the two tosses.

Example 26. A standard pack of 52 cards includes 12 "face cards" – Queens, Kings and Jacks. Suppose you draw two cards uniformly at random from such a standard pack, and notice that the first is not a face card. What is the probability that the second is a face card?

Let A be the event that the first is not a face card, and B be the event that the second is. We seek Pr{B | A}.

$$Pr\{B \mid A\} = \frac{Pr\{B \cap A\}}{Pr\{A\}} = \frac{(40 \times 12)/(52 \times 51)}{40/52}$$
$$= \frac{40 \times 12 \times 52}{52 \times 51 \times 40} = \frac{12}{51}$$

This makes sense, because once we remove a non-face card, we have a 12/51 chance of drawing a face card. Also, the events A and B are not independent. 90

Because:

$$Pr\{B\} = Pr\{(B \cap A) \cup (B \cap \overline{A})\}$$

$$= Pr\{B \cap A\} + Pr\{B \cap \overline{A}\}$$

$$= \frac{40 \times 12}{52 \times 51} + \frac{12 \times 11}{52 \times 51}$$

$$= \frac{12 \times (40 + 11)}{52 \times 51}$$

$$= \frac{12}{52} \neq \frac{12}{51} = Pr\{B \mid A\}$$

In the above example, does it make sense that  $\Pr\{B\}$ , the probability that the <u>second</u> card that is chosen, is  $\frac{12}{52}$ ? We observe that this is the same probability that, if we choose one card uniformly at random from the pack of 52, it is a face card. What if, for example, we pick 10 cards, one after another uniformly at random, and ask what the probability is that the eighth is a face card? The answer, as per the above mindset, should still be  $\frac{12}{52}$ .

We argue that this does make sense based on the following reasoning. Suppose we shuffle the cards thoroughly and lay them out left to right on a table. The leftmost card then, can be seen as corresponding to our first pick, the second card from the left as our second pick, and so on. Now, if we ask what the probability is that any one of them is a face card, it is  $\frac{12}{52}$ . Thus, if we uniformly at random pick n cards out of the 52, and ask what the probability is that the  $k^{\text{th}}$  of those cards is a face card, for  $1 \le k \le n$ , the answer is the same,  $\frac{12}{52}$ .

We now articulate Bayes's theorem, which relates  $Pr\{A \mid B\}$  and  $Pr\{B \mid A\}$ . It is useful, for example, when one of those probabilities is easier to intuit than the other.

Claim 43 (Bayes's theorem). Suppose  $Pr\{A\} \neq 0, Pr\{B\} \neq 0$ . Then:

$$Pr\{A \mid B\} = \frac{Pr\{A\}Pr\{B \mid A\}}{Pr\{B\}}$$

Proof.

$$\Pr\{A \mid B\} = \frac{\Pr\{A \cap B\}}{\Pr\{B\}}$$

$$\Pr\{B \mid A\} = \frac{\Pr\{A \cap B\}}{\Pr\{A\}}$$

$$\Longrightarrow \Pr\{B\}\Pr\{A \mid B\} = \Pr\{A\}\Pr\{B \mid A\}$$

$$\Longrightarrow \Pr\{A \mid B\} = \frac{\Pr\{A\}\Pr\{B \mid A\}}{\Pr\{B\}}$$

Example 27. We revisit Example 26 and ask, instead, what Pr{A | B} is, i.e., the probability that the first card we draw is not a face card, given that the second is.

$$Pr\{A\} = \frac{40}{52}$$

$$Pr\{B\} = \frac{12}{52}$$

$$Pr\{A \mid B\} = \frac{Pr\{A\}Pr\{B \mid A\}}{Pr\{B\}} \qquad \because Bayes$$

$$= \frac{40/52 \times 12/51}{12/52} = \frac{40 \times 12 \times 52}{52 \times 51 \times 12}$$

$$= \frac{40}{51}$$

Example 28. We address the Monty Hall problem that we introduced earlier. Recall that the problem is as follows. There are three curtains behind one of which is a prize. We initially pick a curtain, and Monty then opens one of the other curtains that does not contain the prize. He then gives us the option of switching our choice to the third curtain before he reveals behind which curtain the prize is. The question is: should we switch? Or more specifically, does our probability of winning increase by switching?

Assume that we choose Curtain 1 initially and then Monty opens curtain 2. Consider the following two events:

• P<sup>1</sup> is the event that the prize is behind Curtain 1.

• R<sup>2</sup> is the event that after we have initially chosen Curtain 1, Monty opens Curtain 2.

Then, we are interested to know Pr{P<sup>1</sup> | R2}. Because, if Pr{P<sup>1</sup> | R2} < 1/2, that would be a good rationale to switch to Curtain 3.

We leverage Bayes to determine Pr{P<sup>1</sup> | R2}. For that, we need to determine Pr{P1}, Pr{R2} and Pr{R<sup>2</sup> | P1}. Pr{P1} = 1/3 because the prize is equally likely to be behind any of the three curtains. Pr{R<sup>2</sup> | P1} = 1/2 because if the prize is behind Curtain 1, given that we have chosen Curtain 1 initially, Monty can open either Curtain 2 or 3, and we assume he picks one with equal probability.

As for Pr{R2}, we know that it is 0 if the prize is behind Curtain 2. Also, Monty cannot open Curtain 1 as we chose it initially. So the only way the event R<sup>2</sup> can occur is if the prize is behind Curtain 3. And this occurs with probability 1/2 because the prize may be behind either Curtain 1 or 3 with equal probability. So:

$$Pr\{P_1 \mid R_2\} = \frac{Pr\{P_1\}Pr\{R_2 \mid P_2\}}{Pr\{R_2\}}$$
$$= \frac{1/3 \times 1/2}{1/2} = 1/3$$

Therefore, we should switch to Curtain 3, because the probability that the prize is behind Curtain 3 is 1 − 1/3 = 2/3.

Example 29. Suppose we have two coins, one of which is fair, and the other always comes up heads. Suppose we pick one of those coins uniformly at random and toss it three times, and it so happens that it comes up heads all of the three times. What is the probability that we happened to pick the coin that always comes up heads?

Let A be the event that we pick the coin that always comes up heads. Let B be the event that all three tosses of the chosen coin come up heads. We seek Pr{A | B}.

We leverage Bayes, for which we need to know Pr{A}, Pr{B} and Pr{B | A}.

Pr{A} = 1/2, and Pr{B | A} = 1. To determine Pr{B}, we observe:

$$Pr\{B\} = Pr\{B \cap A\} + Pr\{B \cap \overline{A}\}$$

$$= Pr\{A\}Pr\{B \mid A\} + Pr\{\overline{A}\}Pr\{B \mid \overline{A}\}$$

$$= 1/2 \times 1 + 1/2 \times 1/8$$

$$= 9/16$$

So our solution:

$$\frac{Pr\{A\}Pr\{B \mid A\}}{Pr\{B\}} = \frac{1/2 \times 1}{9/16} = \frac{8}{9}$$

We expect that the more tosses we make that are all heads, the higher the probability that we have chosen the biased coin. Of course, if we see even one tails, we immediately know that we have chosen the fair coin.

Expectation We conclude our discussions on discrete probability with the notion of expectation, or the expected value of a discrete random variable.

Given a sample space S over which we specify a probability distribution, Pr, a discrete random variable X is a function from the sample space to a real number, X : S → R.

For example, suppose we toss a coin thrice, and I am to lose \$2 for every tails, and win \$10 for every heads. Then, we can specify a discrete random variable, call it W, which is my total winnings. The sample space is {H, T}× {H, T} × {H, T}. The range of W is {−6, 6, 18, 30}.

As we deal with only discrete random variables in this course, we drop the qualifier "discrete," henceforth. Given a random variable X, we define the event X = x to be the set {s ∈ S | X(s) = x}. In our above example, the event W = 18 is {T HH, HT H, HHT}. And then:

$$\Pr\{X = x\} = \sum_{s \in S: X(s) = x} \Pr\{s\}$$

In our above example, if the coin is fair, then Pr{W = 18} = 3/8.

The expected value, expectation or mean of a random variable X : S → R is

denoted E[X], and defined as:

$$E[X] = \sum_{x \in \mathbb{R}} x \cdot \Pr\{X = x\}$$
$$= \sum_{s \in \mathbb{S}} X(s) \cdot \Pr\{s\}$$

As the formula suggests, the expectation of X is a weighted average, where each of the values X can take is weighted by the probability with which X takes that value.

For example, in our above coin-toss game, the expectation of the random variable W, assuming that the coin is fair, is:

$$E[W] = -6 \times \frac{1}{8} + 6 \times \frac{3}{8} + 18 \times \frac{3}{8} + 30 \times \frac{1}{8}$$
$$= \frac{1}{8}(-6 + 18 + 54 + 30) = 12$$

The idea behind the expected value is exactly what we associate with the term "expectation." That is, if we play the coin-toss game, we expect to win \$12. And interesting observation is that the expectation is not necessarily one of the values that the random variable can take. That is, in our above example, there is no situation in which we actually win \$12, as our winning from playing the game once is one of −6, 6, 18 or 30.

Example 30. We toss a fair 6-sided die whose faces are numbered 1, . . . , 6. What is the expectation of the toss?

If T is a random variable that is the value the die lands, we have:

$$E[T] = \frac{1}{6}(1+2+\ldots+6) = \frac{21}{6} = 3.5$$

The expectation can be used to make decisions that we can argue are rational. Consider the following example.

Example 31. You need to put in \$15 upfront to play the following game. We toss a fair coin twice. You earn \$4 for every tails and \$10 for every heads. Would you play this game?

One way to rationally answer this question is to define an appropriate random variable and compute its expected value. Let X be a random variable that is our earnings after the two tosses. If E[X] ≥ 15, we agree to play the game. If not, we do not play the game.

We observe:

$$E[X] = 8 \times \frac{1}{4} + 14 \times \frac{1}{2} + 20 \times \frac{1}{4} = 14$$

So, if we play the game in the above example, we expect to lose money. This is exactly the kind of set up we see in Casinos. It is not quite true that "the house always wins." Rather, if we play a game in the Casino, we expect to lose money. Of course, we may win as well, and the house may lose. But the expectation captures the long-term trend. That is, provided the Casino is able to stay in business long enough and has sufficiently many visitors, it is highly likely to make a profit. Of course, if the odds are too skewed in favour of the house, no one would visit.

In the above example, we can ask what the probability is that we win more than \$15 so we do not lose money. And the answer is of course that the only way is if we land both heads, which happens with probability 1/4 only.

Example 32. We revisit Example 25, in which we are given a biased coin, which lands heads with probability p ∈ (0, 1), and tails with probability 1 − p. Our algorithm to ensure a fair coin toss is: repeatedly toss the coin twice till we see two different results. Choose the first of the two as the result of our fair coin toss.

As we discuss there, this works because Pr{HT} = Pr{T H}. However, a concern may be the number of times we may have to repeatedly toss the coin before we finally have a result for our fair coin toss. How many could it be?

Of course, in the worst-case, we may never stop – we may get so unlucky that both consecutive coin tosses always have the same result. But what if we ask how many consecutive pair of tosses we expect to have to make before we are able to stop?

Let T be the corresponding random variable. We can intuit E[T] from our definition of expectation. We observe that T takes on values in N, i.e., 1, 2, . . . That is, we may stop after the first pair of coin tosses, or the second, and so on. The only reason we engage in a second pair of coin tosses is that we got the same results for both tosses in the first pair. The probability with which we get the same result in a pair of tosses is p <sup>2</sup> + (1 − p) 2 , i.e., both tails or heads, with each event being mutually exclusive.

So we have the following for E[T], with explanations for the lines with equation numbers following.

$$E[T] = 1 \times 2p(1-p) + 2 \times [p^{2} + (1-p)^{2}] \times 2p(1-p) + 3 \times [p^{2} + (1-p)^{2}]^{2} \times 2p(1-p) + 4 \times [p^{2} + (1-p)^{2}]^{3} \times 2p(1-p) + \dots$$

$$= \sum_{i=1}^{\infty} i \times [p^{2} + (1-p)^{2}]^{i-1} \times 2p(1-p)$$

$$= 2p(1-p) \sum_{i=1}^{\infty} i \times [p^{2} + (1-p)^{2}]^{i-1}$$

$$= 2p(1-p) \sum_{i=1}^{\infty} \sum_{j=i}^{\infty} [p^{2} + (1-p)^{2}]^{j-1}$$

$$= 2p(1-p) \sum_{i=1}^{\infty} \frac{[p^{2} + (1-p)^{2}]^{i-1}}{1 - [p^{2} + (1-p)^{2}]}$$

$$= \frac{2p(1-p)}{1 - [p^{2} + (1-p)^{2}]} \sum_{i=1}^{\infty} [p^{2} + (1-p)^{2}]^{i-1}$$

$$= \frac{2p(1-p)}{[1-(p^{2} + (1-p)^{2})]^{2}}$$

$$= \frac{2p(1-p)}{[2p(1-p)]^{2}}$$

$$= \frac{2p(1-p)}{[2p(1-p)]^{2}}$$

$$= \frac{1}{2p(1-p)}$$

$$(4.4)$$

Explanations: for clarify, adopt a = p <sup>2</sup> + (1 − p) 2 .

(4.1) We seek 1 × a <sup>0</sup> + 2 × a <sup>1</sup> + 3 × a <sup>2</sup> + 4 × a <sup>3</sup> + . . . We rewrite this as (a <sup>0</sup> + a <sup>1</sup> + a <sup>2</sup> + a <sup>3</sup> + . . .) + (a <sup>1</sup> + a <sup>2</sup> + a <sup>3</sup> + . . .) + (a <sup>2</sup> + a <sup>3</sup> + . . .) + . . . This is exactly what the double summation expresses.

(4.2) The inner summation is what is called a *geometric series*. It is of the form  $a^{i-1} + a^i + a^{i+1} + a^{i+2} + \dots$  We can intuit what that summation is as follows:

$$S = a^{i-1} + a^i + a^{i+1} + a^{i+2} + \dots$$

$$aS = a^i + a^{i+1} + a^{i+2} + \dots$$

$$S - aS = a^{i-1}$$

$$\implies S = \frac{a^{i-1}}{1 - a}$$

- (4.3) We again have a geometric series, except that the first term in the summation is  $a^0 = 1$ .
- **(4.4)**  $1 [p^2 + (1-p)^2] = 2p(1-p)$ . We can intuit this by looking at the binomial expansion of  $[p + (1-p)]^2$ , or simply by observing that  $2p(1-p) = \Pr\{HT, TH\} = 1 \Pr\{HH, TT\} = 1 [p^2 + (1-p)^2]$ .

As an example, suppose p = 1/2, that is, the coin is fair. Then, the number of pairs of tosses we expect to have to make before we have a result for our fair coin toss is:  $\frac{1}{2p(1-p)} = 2$ .

If the coin is more skewed, e.g., p=1/8, then the expected number of pairs of tosses is  $\frac{1}{2\times 1/8\times 7/8}=\frac{32}{7}$ , which is between 4 and 5. It makes sense that our expected number of pairs of tosses increases as the coin gets more skewed. We get the minimum when the coin is fair, i.e., 2 pairs of tosses only.

In Example 32 above, we could have saved ourselves a whole lot of work on the math if we had been a bit more creative with the random variable we defined, paired with some additional observations about the expected value of random variables.

The first observation is the so-called *linearity of expectation*: if X, Y are random variables, then E[X + Y] = E[X] + E[Y]. The second is about so-called *indicator random variables*. An indicator random variable is a random variable which takes one of two values only: 0 or 1. Then, if X is an indicator random variable,  $E[X] = \Pr\{X = 1\}$ .

To prove the linearity of expectation, we recall that a random variable is a function, and rely on how we define addition for functions. We restrict ourselves to functions whose codomain is the real numbers. Given functions f : A → R, g : A → R, we define the function (f + g): A → R as (f + g)(a) = f(a) + g(a).

Claim 44. If X : S → R, Y : S → R are random variables where S is a sample space, then E[X + Y ] = E[X] + E[Y ].

Proof.

$$\begin{split} E[X] &= \sum_{s \in \mathbb{S}} X(s) \cdot \Pr\{s\} \\ E[Y] &= \sum_{s \in \mathbb{S}} Y(s) \cdot \Pr\{s\} \\ E[X+Y] &= \sum_{s \in \mathbb{S}} (X+Y)(s) \cdot \Pr\{s\} \\ &= \sum_{s \in \mathbb{S}} (X(s)+Y(s)) \cdot \Pr\{s\} \\ &= \sum_{s \in \mathbb{S}} ((X(s) \cdot \Pr\{s\}) + (Y(s) \cdot \Pr\{s\})) \\ &= \sum_{s \in \mathbb{S}} X(s) \cdot \Pr\{s\} + \sum_{s \in \mathbb{S}} Y(s) \cdot \Pr\{s\} \\ &= E[X] + E[Y] \end{split}$$

Note that the above can be generalized to several random variables. That is:

$$E\left[\sum_{i=1}^{n} X_i\right] = \sum_{i=1}^{n} E[X_i]$$

Claim 45. If X is an indicator random variable, i.e., takes on the value 0 or 1 only, then E[X] = Pr{X = 1}.

Proof. As X takes on the value 0 or 1 only:

$$E[X] = 0 \cdot \Pr\{X = 0\} + 1 \cdot \Pr\{X = 1\}$$
  
=  $\Pr\{X = 1\}$ 

We now return to Example 32. Consider the following alternative way of intuiting the expected number of pairs of tosses till we are able to return the result of a fair coin toss.

Suppose we carry out n pairs of such tosses. We first ask in how many we expect to have T H or HT. We then ask what n must be so that this expectation is at least 1. We proceed as follows, assuming that we carry out n pairs of tosses. Define n random variables, X1, . . . , X<sup>n</sup> as follows:

$$X_i = \begin{cases} 1 & \text{if the } i^{\text{th}} \text{ pair is } TH \text{ or } HT \\ 0 & \text{otherwise} \end{cases}$$

Let R be a random variable that is the number of such pairs of tosses for which we are able to return a result. Then:

$$R = \sum_{i=1}^{n} X_{i}$$

$$\Longrightarrow E[R] = E\left[\sum_{i=1}^{n} X_{i}\right]$$

$$= \sum_{i=1}^{n} E[X_{i}]$$

$$= \sum_{i=1}^{n} \Pr\{X_{i} = 1\}$$

$$= \sum_{i=1}^{n} 2p(1-p)$$

$$= 2p(1-p)\sum_{i=1}^{n} 1$$

$$= 2np(1-p)$$

And so,

$$E[R] \ge 1 \iff 2np(1-p) \ge 1 \iff n \ge \frac{1}{2p(1-p)}$$

The notion of an indicator random variable is related closely to the notion of a Bernoulli trial. A Bernoulli trial is an experiment which has one of two outcomes only: success or failure. And, if p is the probability of success in a Bernoulli trial, the expected number of trials before a success is 1/p. This can be proved easily by leveraging an appropriately defined indicator random variable. Our experiment in Example 32 can be seen as a Bernoulli trial: success is a pair of coin tosses with different outcomes. As the probability of success is 2p(1 − p), the expected number of trials before a success is <sup>1</sup> 2p(1−p) .

Example 33. We revisit the situation in Example 29. We have a fair coin, and a coin that always lands heads. Suppose we pick one of the two uniformly at random, toss it, and repeat both of those steps till we get tails. What is the expected number of tosses?

We adopt the notion of a Bernoulli trial. That is, success is when we get a tails from our randomly chosen coin. If we are able to intuit the probability of success, call it p, then 1/p is the expectation we seek.

Thus, the success event is when: (i) we choose the fair coin, and, (ii) a toss results in tails. And this probability is 1/2 × 1/2 = 1/4, and therefore, our expected number of tosses is 4.

The approach in the above example may be used to distinguish the coins. Following is another approach. We toss both coins simultaneously till one of them lands tails. We would then have immediately identified which coin is which. What is the expected number of tosses of each coin in this approach?

The expectation in this case is the same as the expected number of tosses of the fair coin till it lands tails. We can perceive this as a Bernoulli trial: we toss the fair coin, and success is that it lands tails. The probability of success, then, is 1/2, and therefore the expectation is 2. Thus, we expect to have to toss each coin twice before we identify which is which. Thus, the total number of tosses is 4.

We conclude with an example from algorithms. Suppose you are given a set of n distinct integers, where n is odd. You are asked for an algorithm to find the median of those integers. The median is the middlemost value from amongst the members of the set. E.g., the median of {−42, 17, 4, 5, 6} is 5.

Consider the following randomized algorithm. We pick a number from the set, call it i, uniformly at random from amongst the n numbers. We then check whether i is indeed the median. We can do this, for example, by comparing i to every other number, and counting how many are smaller than i. The number of integers in the set that is smaller than i is (n − 1)/2 if and only if i is the median. If we find out that i is not the median, we repeat the entire process. That is, we pick an integer uniformly at random and test it. (Of course, we may again pick i.)

This algorithm may not seem good, but it is simple, and somewhat surprisingly good in expectation. We can ask, for example, how many trials, i.e., random pick and subsequent check, we expect to make before we find the median. To answer this, we perceive a random pick as a Bernoulli trial. Success is if we picked the median. The probability of success, then, is 1/n. Therefore, the expected number of trials before success is n.