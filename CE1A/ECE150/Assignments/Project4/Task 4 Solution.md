
---

> [!abstract] Introduction
> ## The Minimum Edit Distance Problem

The **minimum edit distance** (also known as **Levenshtein distance**) is a fundamental problem in computer science with applications in spell checking, DNA sequence alignment, and natural language processing. The problem asks: what is the minimum number of single-character edits needed to transform one string into another?

This is a classic example of **dynamic programming**, where we break down a complex problem into overlapping subproblems and build up solutions systematically.


> [!quote] Definition
> ## Edit Distance

Given two strings $\text{str1}$ and $\text{str2}$, the <u><strong style="color:#dab1da">edit distance</strong></u> is the minimum number of operations required to convert $\text{str1}$ into $\text{str2}$.

The allowed <u><strong style="color:#dab1da">operations</strong></u> are:
- **Insert** a character
- **Delete** a character  
- **Replace** (modify) a character

Each operation has a cost of $1$.

**Examples:**
- $\text{distance}(\text{"fiction"}, \text{"friction"}) = 1$ (insert 'r')
- $\text{distance}(\text{"celebration"}, \text{"calibration"}) = 2$ 
- $\text{distance}(\text{"substitution"}, \text{"subtracting"}) = 6$


> [!info]
> ## The Dynamic Programming Approach

**Key Insight:** Instead of trying all possible sequences of operations, we build a table that stores the edit distance between all pairs of substrings.

We define a 2D array $\text{dis}[i][j]$ where:

$$\text{dis}[i][j] = \text{edit distance between } \text{str1}[i:] \text{ and } \text{str2}[j:]$$

Here, $\text{str1}[i:]$ means the substring of $\text{str1}$ starting from index $i$ to the end.

**Example Structure:**

For $\text{str1} = \text{"fiction"}$ (length $7$) and $\text{str2} = \text{"friction"}$ (length $8$):

$$
\begin{array}{c|cccccccc|c}
& & f & r & i & c & t & i & o & n & \\
\hline
& 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 \\
f & 1 & ? & ? & ? & ? & ? & ? & ? & ? \\
i & 2 & ? & ? & ? & ? & ? & ? & ? & ? \\
c & 3 & ? & ? & ? & ? & ? & ? & ? & ? \\
t & 4 & ? & ? & ? & ? & ? & ? & ? & ? \\
i & 5 & ? & ? & ? & ? & ? & ? & ? & ? \\
o & 6 & ? & ? & ? & ? & ? & ? & ? & ? \\
n & 7 & ? & ? & ? & ? & ? & ? & ? & ? \\
\hline
& 8 & 7 & 6 & 5 & 4 & 3 & 2 & 1 & 0
\end{array}
$$


> [!info]
> ## Base Cases: Initializing the Boundaries

**Observation:** The edit distance between any string and an empty string is simply the length of that string (we need to delete/insert all characters).

### Last Row Initialization

For the last row (when $i = \text{len1}$, meaning $\text{str1}[i:] = \text{""}$):

$$\text{dis}[\text{len1}][j] = \text{len2} - j$$

This represents the distance from empty string to $\text{str2}[j:]$, which requires $(\text{len2} - j)$ insertions.

### Last Column Initialization

For the last column (when $j = \text{len2}$, meaning $\text{str2}[j:] = \text{""}$):

$$\text{dis}[i][\text{len2}] = \text{len1} - i$$

This represents the distance from $\text{str1}[i:]$ to empty string, which requires $(\text{len1} - i)$ deletions.

**Example:** For $\text{str1} = \text{"abc"}$ (length $3$) and $\text{str2} = \text{"abcdefghi"}$ (length $9$):

$$
\begin{array}{c|ccccccccc|c}
& & a & b & c & d & e & f & g & h & i & \\
\hline
& 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 \\
a & 1 & ? & ? & ? & ? & ? & ? & ? & ? & ? \\
b & 2 & ? & ? & ? & ? & ? & ? & ? & ? & ? \\
c & 3 & ? & ? & ? & ? & ? & ? & ? & ? & ? \\
\hline
& 3 & 8 & 7 & 6 & 5 & 4 & 3 & 2 & 1 & 0
\end{array}
$$

**Why is $\text{dis}[3][1] = 8$?**
- $\text{dis}[3][1]$ is the distance between $\text{str1}[3:] = \text{""}$ and $\text{str2}[1:] = \text{"bcdefghi"}$
- This equals $\text{len}(\text{str2}[1:]) = \text{len2} - 1 = 9 - 1 = 8$


> [!fact] Theorem
> ## Recurrence Relation

For any position $\text{dis}[i][j]$ where $i < \text{len1}$ and $j < \text{len2}$, we have:

#### Case 1: Characters Match

If $\text{str1}[i] = \text{str2}[j]$:

$$\text{dis}[i][j] = \text{dis}[i+1][j+1]$$

**Reasoning:** No operation needed! We can skip both characters and use the distance of the remaining substrings.

#### Case 2: Characters Don't Match

If $\text{str1}[i] \neq \text{str2}[j]$, we consider three operations:

$$\text{dis}[i][j] = 1 + \min \begin{cases}
\text{dis}[i+1][j+1] & \text{(Replace)} \\
\text{dis}[i][j+1] & \text{(Insert)} \\
\text{dis}[i+1][j] & \text{(Delete)}
\end{cases}$$

**Operation Details:**

1. **Replace**: Change $\text{str1}[i]$ to $\text{str2}[j]$
   - Cost: $1 + \text{dis}[i+1][j+1]$
   - Both characters are now handled, continue with remaining substrings

2. **Insert**: Insert $\text{str2}[j]$ into $\text{str1}$
   - Cost: $1 + \text{dis}[i][j+1]$
   - We've matched $\text{str2}[j]$, so continue with $\text{str2}[j+1:]$

3. **Delete**: Remove $\text{str1}[i]$
   - Cost: $1 + \text{dis}[i+1][j]$
   - We've removed $\text{str1}[i]$, so continue with $\text{str1}[i+1:]$


> [!example] Example
> ## Step-by-Step Computation

Let's compute the edit distance for $\text{str1} = \text{"cat"}$ and $\text{str2} = \text{"hat"}$.

### Step 1: Initialize the Table

$$
\begin{array}{c|ccc|c}
& & h & a & t & \\
\hline
& 0 & 1 & 2 & 3 \\
c & 1 & ? & ? & ? \\
a & 2 & ? & ? & ? \\
t & 3 & ? & ? & ? \\
\hline
& 3 & 2 & 1 & 0
\end{array}
$$

### Step 2: Fill Using Recurrence

**Position (2, 2):** $\text{str1}[2] = \text{'t'}$, $\text{str2}[2] = \text{'t'}$ → **Match!**

$$\text{dis}[2][2] = \text{dis}[3][3] = 0$$

**Position (2, 1):** $\text{str1}[2] = \text{'t'}$, $\text{str2}[1] = \text{'a'}$ → **No match**

$$\text{dis}[2][1] = 1 + \min(0, 1, 2) = 1$$

**Position (2, 0):** $\text{str1}[2] = \text{'t'}$, $\text{str2}[0] = \text{'h'}$ → **No match**

$$\text{dis}[2][0] = 1 + \min(1, 1, 3) = 2$$

**Position (1, 2):** $\text{str1}[1] = \text{'a'}$, $\text{str2}[2] = \text{'t'}$ → **No match**

$$\text{dis}[1][2] = 1 + \min(0, 0, 1) = 1$$

**Position (1, 1):** $\text{str1}[1] = \text{'a'}$, $\text{str2}[1] = \text{'a'}$ → **Match!**

$$\text{dis}[1][1] = \text{dis}[2][2] = 0$$

**Position (1, 0):** $\text{str1}[1] = \text{'a'}$, $\text{str2}[0] = \text{'h'}$ → **No match**

$$\text{dis}[1][0] = 1 + \min(0, 1, 2) = 1$$

**Position (0, 2):** $\text{str1}[0] = \text{'c'}$, $\text{str2}[2] = \text{'t'}$ → **No match**

$$\text{dis}[0][2] = 1 + \min(1, 1, 0) = 1$$

**Position (0, 1):** $\text{str1}[0] = \text{'c'}$, $\text{str2}[1] = \text{'a'}$ → **No match**

$$\text{dis}[0][1] = 1 + \min(0, 1, 1) = 1$$

**Position (0, 0):** $\text{str1}[0] = \text{'c'}$, $\text{str2}[0] = \text{'h'}$ → **No match**

$$\text{dis}[0][0] = 1 + \min(1, 1, 1) = 1$$

### Final Table

$$
\begin{array}{c|ccc|c}
& & h & a & t & \\
\hline
& 0 & 1 & 2 & 3 \\
c & 1 & 1 & 1 & 1 \\
a & 2 & 1 & 0 & 1 \\
t & 3 & 2 & 1 & 0 \\
\hline
& 3 & 2 & 1 & 0
\end{array}
$$

**Answer:** $\text{dis}[0][0] = 1$ (replace 'c' with 'h')

---

> [!info]
> ## Implementation Strategy

The algorithm uses a **bottom-up** approach with **reverse iteration**:

1. **Initialize** boundaries (last row and column)
2. **Iterate backwards** from $i = \text{len1}-1$ to $0$ and $j = \text{len2}-1$ to $0$
3. **Apply recurrence relation** at each position
4. **Return** $\text{dis}[0][0]$ as the final answer

**Time Complexity:** $O(m \times n)$ where $m = \text{len1}$, $n = \text{len2}$

**Space Complexity:** $O(m \times n)$ for the DP table


> [!example] Example
> ## C++ Implementation

### Helper Function: String Length
```cpp
/**
 * @brief Calculates the length of a C-string
 * @param str the string terminated by '\0'
 * @return the length of the string
 */
std::size_t length(const char *str)
{
    std::size_t len = 0;
    while (str[len] != '\0') {
        len++;
    }
    return len;
}
```

### Main Algorithm: Edit Distance
```cpp
/**
 * @brief Finds the distance between str1 and str2
 * @param str1 the first string, terminated by '\0'
 * @param str2 the second string, terminated by '\0'
 * @return the minimum amount of EDITS (insertion, deletion or modification)
 * needed to turn str1 to str2
 */
unsigned int distance(const char *str1, const char *str2)
{
    // Find the length of the two strings
    const std::size_t len1{ length(str1) }, len2{ length(str2) };

    // dis[i][j] is the distance between the substrings str1+i and str2+j
    // Note for i = len1 or j = len2, we think of that as the distance
    // between "" and a substring of str2 or str1
    int dis[len1 + 1][len2 + 1];

    // STEP 1: Initialize base cases
    // First, the distance between an empty string and
    // a string with length n is n (all insertions/deletions)
    
    for (int i = 0; i <= len1; i++) {
        dis[i][len2] = len1 - i;  // Last column
    }
    
    for (int j = 0; j <= len2; j++) {
        dis[len1][j] = len2 - j;  // Last row
    }

    // STEP 2: Fill the table using reverse iteration
    for (std::size_t i = len1; (i--) > 0;) {
        for (std::size_t j = len2; (j--) > 0;) {
            
            // CASE 1: Characters match
            // If str1[i] = str2[j], no modification needed
            // So, by simply doing nothing,
            // we achieve a distance dis[i+1][j+1]
            if (str1[i] == str2[j]) {
                dis[i][j] = dis[i + 1][j + 1];
                continue;
            }

            // CASE 2: Characters don't match
            // We can perform one of three EDITs:

            // EDIT 1: Replace str1[i] with str2[j]
            // This achieves a distance dis[i+1][j+1],
            // as we can skip str1[i] and str2[j]
            // 1 is added to the result (one EDIT performed)
            const int dis_modified{ dis[i + 1][j + 1] + 1 };

            // EDIT 2: Insert str2[j] after str1[i]
            // This achieves a distance dis[i][j+1],
            // as we can skip str2[j]
            // Similarly, 1 is added to the result
            const int dis_inserted{ dis[i][j + 1] + 1 };

            // EDIT 3: Delete str1[i]
            // This achieves a distance dis[i+1][j],
            // as we removed str1[i]
            // Similarly, 1 is added to the result
            const int dis_deleted{ dis[i + 1][j] + 1 };

            // We take the MINIMUM of the
            // distance after every possible operation
            dis[i][j] = std::min(
                std::min(dis_modified, dis_inserted), dis_deleted);
        }
    }

    // STEP 3: Return the final answer
    return dis[0][0];
}
```

### Usage Example
```cpp
#include <iostream>

int main() {
    const char* word1 = "fiction";
    const char* word2 = "friction";
    
    unsigned int result = distance(word1, word2);
    
    std::cout << "Edit distance: " << result << std::endl;
    // Output: Edit distance: 1
    
    return 0;
}
```
