'''
Given string num representing a non-negative integer num, and an integer k, return the smallest possible integer after removing k digits from num.

 

Example 1:

Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.

Example 2:

Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.

Example 3:

Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.

 

Constraints:

    1 <= k <= num.length <= 105
    num consists of only digits.
    num does not have any leading zeros except for the zero itself.
'''

'''
My Thoughts: 
    1. We scan the string from left to right. 
    2. We can perform k removing operations. 
    3. Since digits to the left are more "valueable", we use our chances of operations as soon as possible.
    4. Whenever num[i] > num[i+1], remove num[i]; Until we run out of operations
'''

class Solution:
    def removeKdigits(self, num: str, k: int) -> str:
        result = []

        for i in num:
            print(result, i)
            while result and k and result[-1] > i:
                result.pop()
                k -= 1 
            result.append(i)
        
        result = result[:len(result)-k] # Remove remaining digits
        # Remove redundant zeros
        while result and result[0] == "0":
            result.pop(0)
        result = "".join(result)
        if result:
            return result
        return "0"

if __name__ == '__main__':
    s = Solution()
    print(s.removeKdigits("1432219", 3))
