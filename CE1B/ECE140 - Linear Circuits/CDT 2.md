
## Example Problem: Circuit Analysis using Node Method

Given the circuit below, where $R_1=14 \ohm$, $R_2 = 4\ohm$, $R_3=6\ohm$ and $R_4=5\ohm$. Determine the node voltages $V_a$, $V_b$ and $V_c$, as well as the power of the voltage and current source.

![[3.1 - Problem 1|60%]]

Solution:
We label the current through each resistor, then label the voltage across them:

![[3.1 - Problem 1 Notation|60%]]
Now we write Ohm's Law equations for the four resistors:
$$
\begin{cases}
I_1 = \frac{V_a-V_b}{R_1} = \frac{12\text{V}-V_b}{14\ \Omega} & (\text{Ohm's Law across } R_1) \\\\
I_2 = \frac{V_b-V_c}{R_2} = \frac{V_b-V_c}{4\ \Omega} & (\text{Ohm's Law across } R_2) \\\\
I_3 = \frac{V_a - V_c}{R_3} = \frac{12\text{V}-V_c}{6\ \Omega} & (\text{Ohm's Law across } R_3) \\\\
I_4 = \frac{V_c-0\text{V}}{R_4} = \frac{V_c}{5\ \Omega} & (\text{Ohm's Law across } R_4)
\end{cases}
$$

Then, we can write the KCL equations for the three nodes:

![[3.1 - Problem 1 Notation 1|60%]]
$$\begin{cases}
I_1+I_3 = I & (\text{KCL on node 1}) \\
I_1+1A = I_2 & (\text{KCL on node 2}) \\
I+1A = I_4 & (\text{KCL on node 3}) \\
I_2+I_3 = I_4 & (\text{KCL on node 4})
\end{cases}$$
Which can be simplified to: $$
\begin{cases}
I_2 = 1A+I_1\\
I_2=I_3+I_4
\end{cases}$$
We then take the voltages into the expressions: $$
\begin{cases}
\frac{V_b-V_c}{4\ \Omega} = 1\text{A} + \frac{12\text{V}-V_b}{14\ \Omega} & \rightarrow & 7V_b-7V_c = 28\text{V} + 24\text{V}-2V_b \\ \\
\frac{V_b-V_c}{4\ \Omega} = \frac{V_c}{5\ \Omega} - \frac{12\text{V}-V_c}{6\ \Omega} & \rightarrow & 15V_b-15V_c = 12V_c - 120\text{V}+10V_c
\end{cases}$$
Re-arrange:$$
\begin{cases}
9V_b-7V_c=52\text{V} \\
15V_b-37V_c=-120\text{V}
\end{cases}$$
Using the method from [[MATH115 - Linear Algebra/2 - Systems of Linear Equations/2.1 - Systems of Equations as Matrices|Math115]], we can write it as a matrix, then reduce to row-echelon form: $$
\left[\begin{array}{cc|c}
9 & -7 & 52 \\
15 & -37 & -120
\end{array}\right] 
\xrightarrow{\substack{5R_1 \\ 3R_2}}
\left[\begin{array}{cc|c}
45 & -35 & 260 \\
45 & -111 & -360
\end{array}\right]
\xrightarrow{\substack{R_1-R_2}}
\left[\begin{array}{cc|c}
45 & -35 & 260 \\
0 & 76 & 620
\end{array}\right]
$$
Now, we can solve for $V_b=12.123\text{V}$, $V_c=8.158\text{V}$. 
