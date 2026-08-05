## Chapter 2

# Propositional Logic and Proof Techniques

In this chapter, we'll define the precise language of propositional logic. You'll find that it is very closely related to switching algebra – or the two-element boolean algebra – that you will be studying in ECE 124, Digital circuits and systems.

Definition 1 (Proposition). A proposition is a statement with which we are able to associate true or false.

Examples of propositions:

- 1. "The Earth is flat."
- 2. "Not all birds can fly."
- 3. "A dog is a mammal, and not a bird."

Of course, in the above, Proposition (1) happens to be false, and Propositions (2) and (3) are true.

Examples of statements that are not propositions:

- 1. "Hey, you!"
- 2. "Which way is the hotel?"
- 3. "This statement is false."

#### 4. "The variable x is non-negative."

The first of the above is an exclamation, and the second is a question. As for the third, if it is true, then it is false, and if it is false, then it is true. Thus, we are able to associate neither true nor false with that statement. The fourth refers to a variable that can take on one of several values. Without knowledge of exactly what value x takes at a given moment, we cannot assess the truthfulness of the statement.

In this context, it is interesting and fun to address an old riddle. Suppose one is faced with two persons, call them Alice and Bob, one of whom always speaks the truth, and the other of whom always lies. What questions, when asked of Alice and/or Bob, would reveal which one amongst them is the truth-teller, and which one is the liar?

Suppose we ask one of them, say Alice, whether the other, Bob, would say 'yes' if asked whether Alice is the liar. If Alice is the truth-teller, then she would say 'yes,' because Bob is the liar, and he would answer 'yes' to our question to him, when the correct answer is 'no.' If Alice is the liar, then she would say 'no,' because Bob, as the truth-teller, would say 'yes' if we asked him whether Alice is the liar, and because Alice always lies, she would negate that expected response from Bob.

While devising the right question to ask above certainly takes creativity, underlying the entire exercise is careful logical reasoning. Communicating and inculcating this is exactly our intent with our discussions on propositional logic.

To develop an understanding of propositional logic, we will often deal with propositions abstractly. Specifically, we will adopt usages such as: "Assume that p is a proposition." When we say that, we do not know exactly what the proposition p is. All we know is that p is either true or false.

Given propositions, we can compose them in certain ways to yield other propositions. Some refer to such a new proposition as a compound proposition. A proposition that is not compound is called an atomic proposition.

The third example of a proposition above, "A dog is a mammal, and not a bird" is an example of a compound proposition. As another example, consider the following two propositions: (i) "The glass is not empty." (ii) "The glass is not full." We can compose them and say, (iii) "The glass is neither empty nor full." Given such a compound proposition, it is necessary to clarify its semantics, that is, what the truth value of the compound proposition (iii) is as a function of the truth values of its constituent, atomic propositions.

To clarify what we mean, suppose the glass is indeed empty. Then Proposition (i) above is false. This implies that Proposition (iii) is false as well. Similarly, suppose Proposition (iii) is false. Then at least one of Proposition (i) and (ii) is false. A customary way, in propositional logic, to specify a semantics for a proposition that is composed of other propositions is to specify a truth table. For our example of Propositions (i)–(iii) above, such a truth table may look like the following.

| If "the glass is not | and "the glass is         | then "the glass is neither empty nor |
|----------------------|---------------------------|-----------------------------------------|
|                      | empty" is not full" is |                                         |
|                      |                           | full" is                                |
| true                 | true                      | true                                    |
| true                 | false                     | false                                   |
| false                | true                      | false                                   |
| false                | false                     | false                                   |

An important aspect of logic is to carefully distinguish syntax from semantics. Syntax refers to the way we write things down. Semantics refers to what they mean. We now specify a syntax for compound propositions. We then clarify what the semantics of each is, via truth tables. The manner in which we specify a syntax for compound propositions is by introducing logical connectives, and then asserting that the use of such connectives in particular ways is syntactically valid.

Logical connectives – syntax Given that each of p and q is a proposition, so are the following:

- (p): parenthesization used to force precedence.
- ¬p: negation.
- p ∧ q: conjunction.
- p ∨ q: disjunction.

- p =⇒ q: implication.
- p ⇐= q: inference.
- p ⇐⇒ q: if and only if.

Given the above syntax for the use of logical connectives to make new propositions, we can further propose rules via which even more propositions can be derived. They would be similar to the axioms of boolean algebra, which you will likely see in ECE 124. We present an example here, but leave more for a future course. For this course, we focus on employing semantics, which we specify using truth tables, to infer more propositions. Similarly, in ECE 124, you will generally use "truth tables," like those employed here, rather than proofs based on the axioms of boolean algebra.

We point out that more connectives can be introduced, for example, ⊕, "exclusive-or." It turns out that in propositional logic, the connectives ¬, ∨ and ∧ suffice, and all other connectives can be defined using those three only. Analogously, in ECE 124, you see that AND, OR, and NOT gates suffice to implement any boolean function; but you'll consider XOR and other gates, which may be more convenient for the implementation of specific functions. We introduced =⇒ , ⇐= and ⇐⇒ as well because those are used heavily in this course for proofs. Consequently, it is useful to directly specify and understand those connectives as well.

As an example of the use of purely syntactic derivation, see proofwiki.org/ wiki/Rule\_of\_Material\_Implication/Formulation\_1/Forward\_Implication/Proof, which shows a derivation from p =⇒ q to ¬p ∨ q.

Logical connectives – semantics The following truth tables are customarily associated with the above propositions that are formed using logical connectives. A truth table specifies, for every possibility of a truth value for the constituent propositions, what the truth value of a compound proposition is. We use T for true, and F for false.

• parenthesization:

| p | (p) |
|---|-----|
| T | T   |
| F | F   |

The above truth table merely emphasizes that the truth value of p is unaffected by parenthesization.

• negation:

| p | ¬p |
|---|----|
| T | F  |
| F | T  |

Example: suppose "the Sun is hot" is true. Then, "the Sun is not hot" is false. The second statement is the manner in which we customarily write the negation of "the Sun is hot" in English.

• conjunction:

| p | q | ∧ p q |
|---|---|-------------|
| T | T | T           |
| T | F | F           |
| F | T | F           |
| F | F | F           |

Example: suppose "the Moon is made of cheese" is false, and "the Sun is hot" is true. Then, "the Moon is made of cheese and the Sun is hot" is false.

• disjunction:

| p | q | p ∨ q |
|---|---|-------------|
| T | T | T           |
| T | F | T           |
| F | T | T           |
| F | F | F           |

Example: suppose "the Moon is made of cheese" is false, and "the Sun is hot" is true. Then, "either the Moon is made of cheese, or the Sun is hot, or both" is true.

• implication:

| p | q | p =⇒ q |
|---|---|--------------|
| T | T | T            |
| T | F | F            |
| F | T | T            |
| F | F | T            |

Example: suppose "the Moon is made of cheese" is false, and "the Sun is hot" is true. Then:

- "If the Sun is hot, then the Moon is made of cheese" is false.
- "If the Moon is made of cheese, then the Sun is hot" is true.
- "If the Sun is not hot, then the Moon is made of cheese" is true.

The last two examples illustrate that, in propositional logic, "if p then q" may have a very different meaning than in natural language. In English, it is often used, for instance, to imply a causal relationship between p and q. But given a premise p that is false – for example, "the Sun is not hot" – the implication p =⇒ q is true for any q, even a completely unrelated proposition q such as "the Moon is made of cheese." So the current truth of p =⇒ q does not mean that, when the Sun eventually cools, the Moon will then be composed entirely of fermented curd; rather, when the Sun cools, the implication itself will be false: in our truth-functional semantics, the truth value of the compound proposition reflects only the specific truth values of the constituent propositions, and no more profound relationship between those constituent propositions. It may be helpful to think of "if p then q" as shorthand for, "(in any row of the truth table in which p =⇒ q is true), if p is true, then q is true."

In mathematics, because we use these same truth-functional semantics, if p is false, we say that p =⇒ q is vacuously true, to mean that the implication is true simply by virtue of the falsity of its premise. For example, if p is "x is an element of the empty set," and q is "x has property Q," then p =⇒ q is (vacuously) true, whatever the property Q: the elements of the empty set can be said to have any property that you like, because there are no such elements.

It is not necessary to read p =⇒ q as "if p then q"; another common way is to say "p only if q." Again, the proper interpretation is truthfunctional.

In other words, in our truth-functional semantics, the following two statements are completely equivalent:

If the Sun is hot, then the Moon is made of cheese. The Sun is hot only if the Moon is made of cheese.

| p | q | p ⇐= q |
|---|---|--------------|
| T | T | T            |
| T | F | T            |
| F | T | F            |
| F | F | T            |

Here the compound proposition is a different way of writing q =⇒ p. It is commonly read, "p if q," but should be interpreted only truthfunctionally, and not as implying some deeper relationship between p and q.

Example: suppose "the Moon is made of cheese" is false, and "the Sun is hot" is true. Then:

- "the Sun is hot if the Moon is made of cheese" is true.
- "the Moon is made of cheese if the Sun is hot" is false.
- "the Moon is made of cheese if the Sun is not hot" is true.

• if and only if:

| p | q | p ⇐⇒ q |
|---|---|--------------|
| T | T | T            |
| T | F | F            |
| F | T | F            |
| F | F | T            |

Example: suppose "the Moon is made of cheese" is false, and "the Sun is hot" is true. Then:

- "The Sun is hot if and only if the Moon is made of cheese" is false.
- "The Moon is made of cheese if and only if the Sun is not hot" is true.

Given the above semantics via truth tables, we can now infer several more propositions.

Claim 1. 
$$(p \implies q) \iff (\neg p \lor q)$$
.

Proof. By truth-table.

| p | q | ¬p | p =⇒ q | ¬p ∨ q | (p =⇒ q) ⇐⇒ (¬p ∨ q) |
|---|---|----|--------------|--------------|----------------------------------------|
| F | F | T  | T            | T            | T                                      |
| F | T | T  | T            | T            | T                                      |
| T | F | F  | F            | F            | T                                      |
| T | T | F  | T            | T            | T                                      |

We claim that the above is a valid proof for the claim because for every possible combination of truth values for p and q, we have shown that the

proposition in the claim is true. We now make and prove two more claims. The first, which is an implication, has a special name, and is useful for carrying out some proofs. Given p =⇒ q, we call the proposition ¬q =⇒ ¬p its contrapositive. The contrapositive of an implication is different from the converse: the converse of p =⇒ q is q =⇒ p. It turns out that (p =⇒ q) ⇐⇒ (¬q =⇒ ¬p), that is, an implication and its contrapositive are completely equivalent from the standpoint of their respective truth values. However, given a proposition p =⇒ q, its converse, q =⇒ p, is not necessarily true.

For example, suppose you know that if it rains, then I carry an umbrella. You happen to observe that I am carrying an umbrella. Can you infer anything, for example, that it is raining? The answer is no, not necessarily. On the other hand, suppose you observe that I am not carrying an umbrella. Can you infer anything? The answer is yes, you can infer that it is not raining.

Claim 2. 
$$(p \implies q) \iff (\neg q \implies \neg p)$$
.

Proof. We prove by truth table.

| p | q | ¬p | ¬q | p =⇒ q | ¬q =⇒ ¬p | (p =⇒ q) ⇐⇒ (¬q =⇒ ¬p) |
|---|---|----|----|--------------|----------------|------------------------------------------|
| F | F | T  | T  | T            | T              | T                                        |
| F | T | T  | F  | T            | T              | T                                        |
| T | F | F  | T  | F            | F              | T                                        |
| T | T | F  | F  | T            | T              | T                                        |

We now assert something that is perhaps not as easy to prove. If only because it involves three propositions, p, q and r. But again, careful use of the truth table enables us to carry out the proof.

Claim 3. 
$$(p \implies q) \implies (p \lor r \implies q \lor r)$$
.

| p | q | r | p ∨ r | q ∨ r | p =⇒ q | p ∨ r =⇒ q ∨ r | (p =⇒ q) =⇒ (p ∨ r =⇒ q ∨ r) |
|---|---|---|-------------|-------------|--------------|----------------------------------|------------------------------------------------------------|
| F | F | F | F           | F           | T            | T                                | T                                                          |
| F | F | T | T           | T           | T            | T                                | T                                                          |
| F | T | F | F           | T           | T            | T                                | T                                                          |
| F | T | T | T           | T           | T            | T                                | T                                                          |
| T | F | F | T           | F           | F            | F                                | T                                                          |
| T | F | T | T           | T           | F            | T                                | T                                                          |
| T | T | F | T           | T           | T            | T                                | T                                                          |
| T | T | T | T           | T           | T            | T                                | T                                                          |

Perhaps the trickiest part of the truth table in the above proof is intuiting the truth value of the last column when p =⇒ q is false. Recall that the proposition ϕ =⇒ ψ is true whenever ϕ is false. And in this case, ϕ is p =⇒ q.

A number of other useful propositions can similarly be inferred from the truth tables. Following are some useful propositions, and names we associate with them when perceived as properties.

- (p ∨ q) ⇐⇒ (q ∨ p) commutativity of ∨.
- (p ∧ q) ⇐⇒ (q ∧ p) commutativity of ∧.
- ((p ∨ q) ∨ r) ⇐⇒ (p ∨ (q ∨ r)) associativity of ∨.
- ((p ∧ q) ∧ r) ⇐⇒ (p ∧ (q ∧ r)) associativity of ∧.
- (¬(p ∨ q)) ⇐⇒ (¬p ∧ ¬q) De Morgan's law (¬ over ∨).
- (¬(p ∧ q)) ⇐⇒ (¬p ∨ ¬q) De Morgan's law (¬ over ∧).
- (p ∨ (q ∧ r)) ⇐⇒ ((p ∨ q) ∧ (p ∨ r)) distributivity of ∨ over ∧.
- (p ∧ (q ∨ r)) ⇐⇒ ((p ∧ q) ∨ (p ∧ r)) distributivity of ∧ over ∨.
- (p =⇒ q) ⇐⇒ (q ⇐= p).
- (p ⇐⇒ q) ⇐⇒ ((p =⇒ q) ∧ (p ⇐= q)).

Quantifiers We now introduce constructs that are not part of propositional logic, but a higher-order logic called predicate logic. However, as they are useful for this course in intuiting properties in various contexts, we introduce and discuss them here. The constructs are called quantifiers, and they are useful when we want to make assertions that have variables in them.

An example of the use of a quantifier is the following: "every star is hot." Another way of saying the same thing, while explicating the use of a variable and a quantifier is: "for every star x, x is hot." The "for every" part is a quantifier, specifically the universal quantifier. The other quantifier of interest to use is the existential quantifier. An example of its use is: "there exists x such that x is a bird and x can fly." (More simply, in English we would say, "there exists a bird that can fly," or "some birds can fly.")

The notation we use for the universal quantifier is " ∀ " and for the existential quantifier is " ∃ ." For example, we might write: "∃ rational y such that y <sup>2</sup> = 2." As another example, "∀ integer x, x<sup>3</sup> is an integer ." We can use the logical connectives ¬, ∨ and ∧ along with quantifiers. For example, to express that there exists no rational y such that y <sup>2</sup> = 2, we could write: "¬(∃ rational y such that y <sup>2</sup> = 2),"

In the context of that last example, it is useful to be able to intuit equivalent assertions. We could equivalently assert: "∀ rational y, ¬(y <sup>2</sup> = 2)," for that example, or, "∀ rational y, y<sup>2</sup> ̸= 2," if we define the symbol "̸=" as the complement of "=." Indeed, following are the rules, in general, of negating an assertion with a quantifier. In the following, we assume that p(x) is an assertion that involves the variable x.

- ¬(∃x, p(x)) ⇐⇒ ∀x, ¬p(x).
- ¬(∀x, p(x)) ⇐⇒ ∃x, ¬p(x).

We can quantify over more than one variable. For example: "∀ positive integer a, ∃ real b such that b = √ a." Note that, when different quantifiers are used, as in this example, their order matters: in general, "∀ person a, ∃ person b such that b is a's mother" is not equivalent to "∃ person b, such that, ∀ person a, b is a's mother"; the first formula asserts that every person has a mother, the second that there is a person who is mother to everyone (even herself).

Sometimes, when we use the same quantifier over multiple variables, we write

one instance of a quantifier only, and not several. For example:

$$\forall$$
 real  $a, b, (a \leq b \vee b \leq a)$ 

When we really should write "∀ real a, ∀ real b . . .."

We have already been using quantifiers implicitly. For example, consider Claim 3 above. When we refer to p, q and r in the statement of the claim, what we really mean to say is, "for all propositions p, q and r, it is true that. . . " The "for all" quantifiers on each of p, q and r were left implicit in the statement of the claim.

### Proof techniques

We now discuss proof techniques that are useful in this course, and in future, to you in your engineering profession. The mindset and systematic thinking that working out a proof develops is critical to one's success as an engineer. The kinds of proofs we develop, and the underlying mindsets and techniques we use, are not only of esoteric or theoretical interest. They have immediate, practical consequence. Also, the precise communication that such proofs require also are very valuable for one to develop as an engineer. Precise technical communication is an invaluable skill, that is highy prized not only in academia, but also industry and business settings. We return to this somewhat philosophical discussion once we have discussed the proof techniques we seek to impart as part of this course.

Logical deduction The overarching technique we use is logical deduction: going from a set of known or assumed statements to new statements, that are typically derived by logic implication. We have already seen some examples of this in our discussions on logic in this chapter.

Consider the following joke. Three logicians walk into a bar. The bartender asks, "would y'all like something to drink?" Logician 1 says, "I don't know." Logician 2 says, "I don't know." Logician 3 says, "yes."

The joke is a play on the wording of the bartender's question, specifically, her use of "all." She seems to be asking whether all three of the logicians want a drink. Presumably, each of Logicians 1 and 2 would like a drink. But they do not know yet as to whether all of them want a drink. Therefore, they are compelled to say, "I don't know." Logician 3 infers that the other two would each like a drink; otherwise, one of them would have said, "no." She knows that she wants a drink herself, and therefore says, "yes."

Imagine that Logician 3 had said, "no." Then, presumably Logicians 1 and 2 want a drink each, but Logician 3 does not. While this is admittedly a joke, it exercises logical deduction in a good way. Such logical deduction is at the foundations of every proof we carry out. Following are some specific strategies one could adopt to carry out a proof. Each strategy provides a kind of framework within which logical deduction is used. More than one strategy may be useful in carrying out a proof, and a proof does not require any particular strategy to be adopted to be carried out successfully. It is important also to recognize when one has successfully carried out a proof; the strategy helps with this aspect as well.

Some of the strategies that arise in this course, and in future courses are:

• Case analysis: we enumerate, exhaustively, all possible cases that can occur, and prove each, in turn. Following is an example.

Claim 4. For any three natural numbers x, y, z, where x + y = z, if any two of x, y, z are divisible by 3, then so is the third.

Proof. By case analysis.

- 1. x, y are divisible by 3. Then, x = 3a, y = 3b for some natural numbers a, b. Then, because z = x+y, z = 3(a+b), which implies that z is divisible by 3.
- 2. x, z are divisible by 3. Then, x = 3a, z = 3b for some natural numbers a, b. As y is a natural number, i.e., y ≥ 0 and x + y = z, b ≥ a. And, y = 3(b − a). As b ≥ a, b − a is a natural number, and therefore y is a natural number that is divisible by 3.
- 3. y, z are divisible by 3. This is identical to the previous case as x and y are interchangeable.

An interesting observation about the above claim is that its converse is not necessarily true. That is, for three natural numbers x, y, z with x+y = z, if one of them is divisible 3, it does not necessarily imply that the other two are as well. A counterexample can be used to establish this. A counterexample is x = 1, y = 2, z = 3.

• Contradiction: we recall the truth table for an implication, and observe that the only case such a proposition is false is when ϕ is true, and ψ is false. For a proof by contradiction of a proposition ϕ =⇒ ψ, we assume that the premise, ϕ is true, and yet, the implication, ψ, is false. We then establish by logical deduction that something that is false must be true, or that something that is true must be false – this is the contradiction we deduce.

For example, consider the following claim, and its proof by contradiction.

Claim 5. <sup>√</sup> 2 is not rational.

Proof. To perceive the statement the claim as an implication, we can rephrase it as: x = √ 2 =⇒ x is not a rational number.

For the purpose of contradiction, assume that x = √ 2, and x is rational. Then, x = p/q, where p and q are integers. We assume, without loss of generality, that p and q have only 1 as a common factor, i.e., p/q is in its simplest form. Then, x <sup>2</sup> = 2 = p <sup>2</sup>/q<sup>2</sup> =⇒ p <sup>2</sup> = 2q 2 .

Thus, p 2 is even. This implies that p is even, because if p is odd, then p is of the form 2x+1 where x is an integer, and (2x+1)<sup>2</sup> = 4x <sup>2</sup> +4x+1, which is odd. Thus, p = 2y, for some integer y.

Therefore, p <sup>2</sup>/2 = (2y) <sup>2</sup>/2 = 2y <sup>2</sup> = q 2 . Thus, q 2 is even as well, and therefore q is even. Thus, both p and q are even, which means p/q is not in its simplest form, which is our desired contradiction.

Another example, which was on the final exam of the Spring'18 offering of the course is the following claim. We define an even number as follows: x is an even number if x = 2y, where y is an integer.

Claim 6. If a, b, c are positive integers, then at least one of a − b, b − c, c − a is even.

An example is a = 13, b = 8, c = 5. Then, c − a = −8, which is even.

Proof. Assume, for the purpose of contradiction, that none of a−b, b− c, c−a is even. Then, a−b = 2k+1 for some integer k, and b−c = 2l+1 for some integer l. then, c−a = −(b−c+a−b) = −(2l + 1 + 2k + 1) = 2(−l − k + 1), which is an integer because l, k are integers, and is even. This contradicts our assumption that c − a is odd.

• Contrapositive: recall that (ϕ =⇒ ψ) ⇐⇒ (¬ψ =⇒ ¬ϕ); the two implications are contrapositives of one another. Given a claim ϕ =⇒ ψ a proof of the contrapositive proves, instead, ¬ψ =⇒ ¬ϕ.

Following is an example of proof by contrapositive.

Claim 7. For 
$$x, y$$
 positive integers,  $\left(\sum_{i=1}^{x} i = \sum_{i=1}^{y} i\right) \implies (x = y)$ .

Proof. We prove the contrapositive, that is, for x, y positive integers,

$$(x \neq y) \implies \left(\sum_{i=1}^{x} i \neq \sum_{i=1}^{y} i\right).$$

Given that 
$$x \neq y$$
, either (i)  $x > y$  or (ii)  $x < y$ . In case (i),  $\left(\sum_{i=1}^{x} i\right) =$ 

$$\left(\sum_{i=1}^{y} i + \sum_{i=y+1}^{x} i\right) \ge \left(y+1+\sum_{i=1}^{y} i\right) > \left(1+\sum_{i=1}^{y} i\right), \text{ because } x \ge y+1$$

and y > 0. This implies that <sup>X</sup><sup>x</sup> i=1 i ̸= X y i=1 i, as desired.

Case (ii) is proven identically, by interchanging x and y.

• Construction: this is typically for statements of the form "there exists. . . " That is, a natural way to prove that something exists is to construct, or present, one. For example, if we all agree on what an elephant is, and I am challenged to prove that elephants exist, I can simply produce and present an elephant. Following is an example.

Claim 8. Given any two real numbers, x, y such that x < y, there exists a real number z such that x < z < y.

Proof. By construction. Let z = (x + y)/2. Then z is real because the sum of two real numbers is real, and dividing a real by another that is not zero yields a real. To establish that x < z < y, we observe:

$$x < z < y \iff x < \frac{x+y}{2} < y$$

$$\iff 2x < x+y < 2y$$

$$\iff x+x < x+y < y+y$$

$$\iff x < y$$

The above proof demonstrates a useful strategy: to begin with what we seek to prove, and then work backwards to a sufficient condition for that to be true, in this case, x < y, which we know to be true.

- Induction: a proof by induction is usually put to use when we have a statement that involves a universal quantifier, for a sequence of items, for example, all natural numbers. A proof by induction is structured as follows:
  - We first prove that the statement is true for the *base case*. The base case is the statement for the first natural number, 0.
  - We then prove the step, i.e., the following implication: if the statement is true for all natural numbers,  $0, 1, \ldots, i-1$ , then the statement is true for the natural number i.

Together, the two steps above prove the statement for all items in the sequence, for example, every natural number. This is because proving the (i) base case, i.e., the statement for 0, and, (ii) the step, implies that the statement is true for the second natural number, 1. This, with the step, in turn implies that the statement is true for 2. And, 3, and so on, for all natural numbers. Following is an example.

Claim 9. 
$$1+2+\ldots+n=\frac{n(n+1)}{2}$$
.

*Proof.* By induction on n.

Base case: n = 1. When n = 1, the left hand side is 1. And the right hand-side is  $\frac{1 \times 2}{2} = 1$ . Thus, we have proved that the statement is true for the base case.

Step: we adopt the induction assumption, that the statement is true for all n = 1, 2, ..., i - 1, for some  $i \ge 2$ . Under that premise, we seek to prove the statement for n = i. We observe:

$$1+2+\ldots+i-1+i=\frac{(i-1)i}{2}+i \qquad \because \text{ induction assumption}$$

$$=\frac{i^2-i+2i}{2}$$

$$=\frac{i^2+i}{2}=\frac{i(i+1)}{2}$$

Thus, we have proven the base case and the step, and therefore we have successfully carried out our proof by induction on n.

As the base case, we have proved that the statement is true when n = 1. As a consequence of proving the step, then, we have proved that the statement is true for n = 2. And with that, and as a consequence of the step, we have proved that the statement is true for n = 3. And so on.

We now carry out several proofs as examples to demonstrate the above strategies. We begin with a problem from the final exam of the Spring'18 offering of the course.

Claim 10. For every natural number n ≥ 12, there exist natural numbers m1, m<sup>2</sup> such that n = 4m<sup>1</sup> + 5m2.

Proof. By induction on n.

Base cases: we prove the statement for the following cases: n = 12, 13, 14, 15. The reason we consider several base cases becomes apparent once we get in to proving the step. We observe:

- 12 = 4 × 3 + 5 × 0.
- 13 = 4 × 2 + 5 × 1.
- 14 = 4 × 1 + 5 × 2.
- 15 = 4 × 0 + 5 × 3.

Step: we assume that the assertion is true for all n = 12, 13, . . . , i − 1 for some i ≥ 13. For n = i, we first observe that i = i − 1 + 1 = 4k<sup>1</sup> + 5k<sup>2</sup> + 1, for some natural numbers k1, k2, from the induction assumption. We do a case analysis.

Case (i): 
$$k_1 > 0$$
. Then,  $i = 4k_1 + 5k_2 + 1 = 4(k_1 - 1) + 5(k_2 + 1)$ .

Case (ii): k<sup>1</sup> = 0. Then, because i > 12, k<sup>2</sup> ≥ 3. Then, i = 5k<sup>2</sup> + 1 = 4 × 4 + 5(k<sup>2</sup> − 3).

The reason we prove several base cases is to address Case (ii) of the step. Because the smallest n for which k<sup>2</sup> ≥ 3 is n = 15. By addressing several

base cases, we ensure that our proof is indeed correct, i.e., that we can indeed make the inductive argument.

Claim 11. For every non-negative integer n, exactly one of the following is true:

- there exists a non-negative integer m such that n = 3m.
- there exists a non-negative integer m such that n = 3m + 1.
- there exists a non-negative integer m such that n = 3m + 2.

We need to be careful here in that the statement says that exactly one of those cases is true. That is, for a particular n, one of the cases is true, and neither of the others is true. We need to prove both those properties.

Proof. By induction on n. Again, we are careful to address several base cases.

Base cases: for each of n = 0, 1, 2, we prove the first part by construction, i.e., by producing an m that demonstrates that the statement is true.

For n = 0, we observe that 0 = 3 × 0, i.e., m = 0, which proves that the statement is true. For n = 1, we again propose m = 0, and observe that n = 1 = 3 × 0 + 1. And for n = 2, we propose m = 0, and observe that n = 2 = 3 × 0 + 2. Thus, we have shown one part of the statement for each of n = 0, 1, 2, which is that there exists such an m.

We now prove the other part of the statement: that given that 0 = 3m for some m, then it can be neither 3m′ + 1 nor 3m′ + 2 for any non-negative integer m′ . Suppose, for the purpose of contradiction, there exists such an m′ , that is, 0 = 3m′+1. Then, m′ = −1/3, which contradicts the assumption that m′ is a non-negative integer. Similarly, 0 = 3m′ + 2 =⇒ m′ = −2/3, again a contradiction.

And similarly, if 1 = 3m′ , then m′ = 1/3 and if 1 = 3m′+2, then m′ = −1/3, in each case a contradiction to the assumption that m′ is a non-negative integer. And finally, if 2 = 3m′ , then m′ = 2/3, and if 2 = 3m′ + 1, then m′ = 1/3.

Step: we assume that the statement is true for all n = 0, 1, 2, . . . , i − 1 for some i ≥ 1. For n = i, we do a case analysis, and in each case, produce an m.

- if i − 1 = 3m for some non-negative integer m, then, i = 3m + 1.
- if i − 1 = 3m + 1 for some non-negative integer m, then, i = 3m + 2.
- if i − 1 = 3m + 2 for some non-negative integer m, then, i = 3(m + 1). And because m is a non-negative integer, so is m + 1.

To establish that no other case applies, assume that a non-negative integer m′ exists that corresponds to one of the other cases, for the purpose of contradiction. We again do a case analysis.

- if i = 3m and i = 3m′ + 1, then m′ = m −1/3, which is a contradiction to the assumption that m′ is a non-negative integer. And if i = 3m′+2, then m′ = m − 2/3, which is a similar contradiction.
- if i = 3m + 1 and i = 3m′ , then m′ = m + 1/3, and if i = 3m′ + 2, then m′ = m − 1/3, each of which is a contradiction.
- if i = 3m + 2 and i = 3m′ , then m′ = m + 2/3, and if i = 3m′ + 1, then m′ = m + 1/3, both of which contradict our assumption that m′ is a non-negative integer.

We now consider a proof by induction for a statement that is obviously not true. The statement is: all horses have the same colour. The proof is as follows. For the base case, pick a horse. Obviously it is the same colour as itself. Therefore, the base case has been proved. The induction assumption is that given up to n = i − 1 horses, for some i ≥ 2, they all have the same colour. Now consider that we are given n = i horses. We pick some horse, and temporarily remove it from the set. Then we are left with i − 1 horses which, by the induction assumption all have the same colour. We now temporarily remove one of those i − 1 horses from the set, and add back in the horse that we first removed. Again, we are left with i − 1 horses which, by the induction assumption must all have the same colour.

A flaw in the above proof is in the manner in which we prove the step. While it is certainly ok to remove a horse, call it H, from the set and then assert that the remainder all have the same colour, what we now need to do is prove

that H has the same colour as the other i−1 horses. We cannot again appeal to the induction assumption to do that, as the above flawed proof does.

We now present one more correct example of proof by induction. In the following claim, we address a situation that there appears to be more than one choice for the parameter on which we carry out induction.

Claim 12. Suppose n is a natural number whose digits, in order of mostto least-significant, are nk−<sup>1</sup> nk−<sup>2</sup> . . . , n0, where each n<sup>i</sup> is one of 0, . . . , 9. If the sum of the digits of n, S<sup>n</sup> = X k−1 i=0 ni, is divisible by 3, then n is divisible by 3.

An example is n = 809173. Then, S<sup>n</sup> = 28, which is not divisible by 3. Therefore, from the statement in the claim, we cannot infer anything as to whether n is divisible by 3. On the other hand, the digits of 82907370 add up to 36, and therefore, if the claim is true, then 82907370 is divisible by 3.

We emphasize that the implication in the statement goes in one direction only. ". . . if S<sup>n</sup> is divisible by 3, then n is divisible by 3. . . " It says nothing about what S<sup>n</sup> may be if n is divisible by 3.

The above claim presents an example of where if we choose to carry out a proof by induction, then we need to clearly say on what parameter we carry out induction. For the above claim, there appear to be at least two choices: induction on n, and induction on k. In the following proof, we carry out induction on k, i.e., the number of digits when we write n in decimal.

Proof. Base case: k = 1. Then, n = n<sup>0</sup> = Sn, i.e., n has only one digit. Then, for S<sup>n</sup> to be divisible by 3, S<sup>n</sup> must be one of 3, 6 or 9. In each case, because n = Sn, we observe that n is divible by 3 as well.

Step: our induction assumption is that given any n that has k = 1, . . . , i − 1 digits, for some i ≥ 2, if S<sup>n</sup> is divisible by 3, then so is n. We need to now prove that given some n of i digits, if S<sup>n</sup> is divisible by 3, then so is n. Henceforth, we use the notation ( )<sup>10</sup> to indicate when we write a number in base-10, i.e., its digits from most- to least-significant.

We have n = (ni−<sup>1</sup> ni−<sup>2</sup> . . . n0) <sup>10</sup>. Therefore, n = 10<sup>i</sup>−<sup>1</sup>ni−1+10<sup>i</sup>−<sup>2</sup>ni−2+. . .+

$$10^{0}n_{0} = 10^{i-1}n_{i-1} + (n_{i-2}\dots n_{0})_{10}$$
. Also,  $S_{n} = \sum_{i=0}^{i-1} n_{i} = n_{i-1} + \sum_{j=0}^{i-2} n_{j}$ . We do

a case analysis on  $\sum_{j=0}^{i-2} n_j$  as to whether it is divisible by 3. We appeal often to Claim 4. Recall that that claim is: given three natural numbers x, y, z such that x + y = z and any two are divisible by 3, then so is the third.

- Suppose  $\sum_{j=0}^{i-2} n_j$  is divisible by 3. Then, for  $S_n$  to be divisible by 3,  $n_{i-1}$  must be divisible by 3 by Claim 4. That is,  $n_{i-1} = 3a$  for some natural number a. Then,  $n = 10^{i-1} \times 3a + (n_{i-2} \dots n_0)_{10}$ . As  $\sum_{j=0}^{i-2} n_j$  is divisible by 3, by the induction assumption,  $(n_{i-2} \dots n_0)_{10}$  is divisible by 3. Therefore, by Claim 4,  $n = 10^{i-1} \times 3a + (n_{i-2} \dots n_0)_{10}$  is divisible by 3, because it is the sum of two numbers, each of which is divisible by 3.
- Suppose  $\sum_{j=0}^{i-2} n_j$  is not divisible by 3. Then,  $\sum_{j=0}^{i-2} n_j = 3a + b$ , for some natural number a, and for b either 1 or 2. We now do a case analysis of those two cases for b.
  - If b = 1, then  $n_{i-1} = 3a' + 2$  for some natural number a', because otherwise,  $S_n$  is not divisible by 3. And we have:

$$n = 10^{i-1}n_{i-1} + (n_{i-2} \dots n_0)_{10}$$
  
=  $10^{i-1}(3a' + 2) + (n_{i-2} \dots n_0)_{10}$   
=  $10^{i-1} \times 3a' + 10^{i-2} \times 20 + (n_{i-2} \dots n_0)_{10}$ 

Now, we do a further case analysis on  $n_{i-2}$ :

\* If  $n_{i-2} = 0$ , then, we choose to write n as:

$$n = 10^{i-1} \times 3a' + 10^{i-2} \times 18 + (2 n_{i-3} \dots n_0)_{10}$$

Now, each of  $10^{i-1} \times 3a'$  and  $10^{i-2} \times 18$  is divisible by 3. And the digits of  $(2 n_{i-3} \dots n_0)_{10}$  are divisible by 3, because

X i−2 j=2 n<sup>j</sup> = 3a + 1. Therefore, by the induction assumption,

(2 ni−<sup>3</sup> . . . n0) is divisible by 3. Thus, n is the sum of three numbers, each of which is divisible by 3, and therefore n is divisible by 3.

∗ If ni−<sup>2</sup> > 0, then, we choose to write n as:

$$n = 10^{i-1} \times 3a' + 10^{i-2} \times 21 + ((n_{i-2} - 1) n_{i-3} \dots n_0)_{10}$$

Again, n is the sum of three numbers each of which is divisible by 3.

– If b = 2, then ni−<sup>1</sup> = 3a ′ + 1 for some natural number a ′ , because otherwise, S<sup>n</sup> is not divisible by 3. And we have:

$$n = 10^{i-1}n_{i-1} + (n_{i-2} \dots n_0)_{10}$$
  
=  $10^{i-1}(3a'+1) + (n_{i-2} \dots n_0)_{10}$   
=  $10^{i-1} \times 3a' + 10^{i-2} \times 10 + (n_{i-2} \dots n_0)_{10}$ 

As before, we do a further case analysis on ni−2:

∗ If ni−<sup>2</sup> = 0 or ni−<sup>2</sup> = 1, then we choose to write n as:

$$n = 10^{i-1} \times 3a' + 10^{i-2} \times 9 + ((n_{i-2} + 1) n_{i-3} \dots n_0)_{10}$$

And n is the sum of three numbers each of which is divisible by 3.

∗ If ni−<sup>2</sup> ≥ 2, then we choose to write n as:

$$n = 10^{i-1} \times 3a' + 10^{i-2} \times 12 + ((n_{i-2} - 2) n_{i-3} \dots n_0)_{10}$$

And n is the sum of three numbers each of which is divisible by 3.

### Disproof

Sometimes we are faced with a statement that we don't know to be true or to be false. We may need to find out whether it's true or false. In such a case, we can see whether we can prove it, or disprove it.

Consider the following example.

Claim 13. For every natural number n, n <sup>2</sup> − n + 11 is prime.

If we simply try to prove this statement, we will never succeed. But we may succeed in disproving it: it turns out that the above claim is false. That is, there exists natural n such that n <sup>2</sup> − n + 11 is not prime.

Such an n is 11, and this is called a counterexample to the claim: an example of a specific n for which the claim does not hold. Producing a counterexample is an effective way of refuting a statement of the form "for all . . . "

For another disproof by counterexample, consider the statement, "no mammal lays eggs." This can be seen as the negation of a statement with the "there exists" quantifier – which can in turn be rephrased as a statement with "for all . . . "

```
No mammal lays eggs ⇐⇒ ∄ a mammal that lays eggs
                    ⇐⇒ ¬(∃ a mammal that lays eggs)
                    ⇐⇒ ∀ mammals m, m does not lay eggs
```

As a counterexample to the latter statement, we could present the platypus, which is an egg-laying mammal. A note of caution: sometimes it is not obvious that something that is presented as a counterexample is indeed a counterexample. In that case, we need to prove that it is indeed a counterexample. For instance, we need to prove that the platypus that we present as a counterexample is indeed a mammal, and does lay eggs.

For our counterexample for Claim 13, as proof that n = 11 is indeed a valid counterexample, we would observe that 11<sup>2</sup> − 11 + 11 = 121, which is not prime because it has a divisor, 11, which is neither itself nor 1. The proof of Claim 5 of Chapter 2 establishes the non-obvious fact that the square root of 2 is a valid counterexample to the claim that all real numbers are rational.

Why is the presentation of a counterexample a valid way of disproving a

statement of the form "for all . . . "? The reason is that we are proving the negation of the statement. That is, to prove that a statement S is false, we prove ¬S to be true. Thus, if P(x) is a statement about x, and S = ∀x, P(x), then:

$$\neg S \iff \neg(\forall x, P(x)) \iff \exists x, \neg P(x)$$

And then, a counterexample is a proof by construction of ∃x, ¬P(x).

We consider one more example of a claim that we are able to disprove by counterexample.

Claim 14. For all sets A, B and C, A × C = B × C =⇒ A = B.

As a counterexample, pick C = ∅ and A, B be any sets such that A ̸= B.

To disprove a statement of a form other than "for all . . . " we simply negate the statement, and prove that this negation is true. For example, to disprove a statement of the form "there exists . . . ", we need to prove a statement of the form "for all . . . " That is:

Let 
$$S = \exists x, P(x)$$
  
Then,  $\neg S = \neg(\exists x, P(x)) \iff \forall x, \neg P(x)$ 

Claim 15. There exist primes p, q such that p − q = 513.

The above claim is false. Its negation is:

For all primes 
$$p, q, p - q \neq 513$$

We can prove this by contradiction. Suppose there exist primes p, q such that p − q = 513. (Observe that this is exactly the statement of Claim 15.) Then, one of p, q is even and the other is odd. We now do a case analysis. (i) Suppose p is even, and q is odd. Then, p = 2 as that is the only even prime. Then, q = −511, which contradicts the assumption that q is prime. (We adopt the customary condition that for a number to be prime, it must be a natural number, i.e., ≥ 1.) (ii) Suppose q is even and p is odd. Then, q = 2 and p = 515, which contradicts the assumption that p is prime.

We now consider a more complex example, a statement that involves two quantifiers. This example illustrates the utility of first carefully negating the statement, and then choosing a strategy when trying to disprove the original statement.

Claim 16.  $\forall m \in \mathbb{Z}, \exists n \in \mathbb{N}, \left|\frac{1}{m} - \frac{1}{n}\right| > \frac{1}{2}.$ 

The above statement is not true. Its negation, which we seek to prove, is:

$$\exists m \in \mathbb{Z}, \forall n \in \mathbb{N}, \left| \frac{1}{m} - \frac{1}{n} \right| \le \frac{1}{2}$$

We can prove this statement by construction of a suitable m, and then proving that for that choice of m, the " $\forall n \dots$ " part is true. Choose m = 2. Then, we perform a case analysis on n.

When 
$$n = 1$$
,  $\left| \frac{1}{2} - 1 \right| = \frac{1}{2} \le \frac{1}{2}$ .

When 
$$n=2$$
,  $\left|\frac{1}{2} - \frac{1}{2}\right| = 0 \le \frac{1}{2}$ .

When 
$$n \ge 3$$
,  $0 < \frac{1}{n} < \frac{1}{2}$ . Therefore,  $\left| \frac{1}{2} - \frac{1}{n} \right| = \frac{1}{2} - \frac{1}{n} < \frac{1}{2}$ .

We conclude with an example of a logical implication which does not generally hold. We use this example to illustrate the fact that when a proposition is not true in general, this means that there is some assignment of truth values to the constituent propositions that causes the implication not to hold. For some other assignments, it may or may not hold. And of course, for a proposition to be true in general, it must be true for all truth assignments of its constituent propositions.

Claim 17. 
$$(p \implies q) \implies ((p \lor r) \implies q)$$

To show that the above claim is not true in general, we observe that when p is false, q is false and r is true, the statement is not true. We observe that for some other truth assignments, the statement is true; for example,  $p = \mathsf{true}, q = \mathsf{false}, r = \mathsf{true}$ . But that is immaterial to the fact that the claim is not true in general, i.e., always.
