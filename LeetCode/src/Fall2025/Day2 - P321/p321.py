'''
You are given two integer arrays nums1 and nums2 of lengths m and n respectively. nums1 and nums2 represent the digits of two numbers. You are also given an integer k.

Create the maximum number of length k <= m + n from digits of the two numbers. The relative order of the digits from the same array must be preserved.

Return an array of the k digits representing the answer.

 

Example 1:

Input: nums1 = [3,4,6,5], nums2 = [9,1,2,5,8,3], k = 5
Output: [9,8,6,5,3]

Example 2:

Input: nums1 = [6,7], nums2 = [6,0,4], k = 5
Output: [6,7,6,0,4]

Example 3:

Input: nums1 = [3,9], nums2 = [8,9], k = 3
Output: [9,8,9]

 

Constraints:

    m == nums1.length
    n == nums2.length
    1 <= m, n <= 500
    0 <= nums1[i], nums2[i] <= 9
    1 <= k <= m + n
    nums1 and nums2 do not have leading zeros.
'''

'''
Thoughts:
    In a numberm, the digits to the left are more "valuable"
    Repeatively draw the larger front number from the two pools (num1, num2), replace previous digits if the number drawn is larger.
'''
from typing import List
from copy import deepcopy as cp 



class Solution:
    def dp(self, current_nums:List[int], i:int, j:int) -> int:
        if len(current_nums) == k:
            return int("".join) 
        
        # Try drawing from nums1 
        if nums1:
            drawn:int = nums1[i]
            current_nums_cp = cp(current_nums)
            while len(current_nums) + len(self.nums1)-i-1 + len(self.nums2)-j >= k and current_nums and current_nums[-1] < drawn:
                current_nums.pop()
            current_nums.append(drawn)
            self.dfs(current_nums, i+1, j)

        # Try drawing from nums2

    def maxNumber(self, nums1: List[int], nums2: List[int], k: int) -> List[int]:
        self.nums1:List[int] = nums1
        self.nums2:List[int] = nums2 
        self.k = k 
        self.dfs([], 0, 0)


if __name__ == '__main__':
    nums1 = [3,4,6,5]
    nums2 = [9, 1, 2, 5, 8, 3]
    k = 5
    print(Solution().maxNumber(nums1, nums2, 5))
