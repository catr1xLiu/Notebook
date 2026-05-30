## 2300. Successful Pairs of Spells and Potions

You are given two positive integer arrays **spells** and **potions**, of length $n$ and $m$ respectively, where `spells[i]` represents the strength of the $i^{th}$ spell and `potions[j]` represents the strength of the $j^{th}$ potion.

You are also given an integer **success**. A spell and potion pair is considered **successful** if the **product** of their strengths is **at least** `success`.

Return an integer array **pairs** of length $n$ where `pairs[i]` is the number of **potions** that will form a successful pair with the $i^{th}$ spell.

### Example 1:
**Input:** `spells = [5,1,3]`, `potions = [1,2,3,4,5]`, `success = 7`
**Output:** `[4,0,3]`
**Explanation:**
- $0^{th}$ spell: $5 \times [1,2,3,4,5] = [5,10,15,20,25]$. 4 pairs are successful.
- $1^{st}$ spell: $1 \times [1,2,3,4,5] = [1,2,3,4,5]$. 0 pairs are successful.
- $2^{nd}$ spell: $3 \times [1,2,3,4,5] = [3,6,9,12,15]$. 3 pairs are successful.
Thus, `[4,0,3]` is returned.

### Example 2:
**Input:** `spells = [3,1,2]`, `potions = [8,5,8]`, `success = 16`
**Output:** `[2,0,2]`
**Explanation:**
- $0^{th}$ spell: $3 \times [8,5,8] = [24,15,24]$. 2 pairs are successful.
- $1^{st}$ spell: $1 \times [8,5,8] = [8,5,8]$. 0 pairs are successful. 
- $2^{nd}$ spell: $2 \times [8,5,8] = [16,10,16]$. 2 pairs are successful. 
Thus, `[2,0,2]` is returned.

---

### Constraints:
* $n == \text{spells.length}$
* $m == \text{potions.length}$
* $1 \le n, m \le 10^5$
* $1 \le \text{spells}[i], \text{potions}[i] \le 10^5$
* $1 \le \text{success} \le 10^{10}$