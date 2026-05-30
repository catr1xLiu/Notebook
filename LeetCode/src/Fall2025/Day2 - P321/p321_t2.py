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

Thoughts:
    1. We draw i items from nums1, and k-i from nums2.
    2. A simple greedy algorithm can determine what the maximum number drawn from each list is 
    3. It's also very easy to combine the two result, such that the final is greatest and satisfies the requirement 
'''

from copy import deepcopy as cp
class Solution:
    @staticmethod
    def maxNums(nums:list[int], k:int) -> list[int]:
        result:list[int] = list()
        numbers_throwaway = len(nums)-k
        for i in nums:
            while numbers_throwaway and result and result[-1] < i:
                result.pop()
                numbers_throwaway -= 1 
            result.append(i)
        return result[:k]
    @staticmethod
    def merge(nums1:list[int], nums2:list[int]) -> list[int]:
        result:list[int] = list()
        for _ in range(len(nums1) + len(nums2)):
            flag = False
            for digit in range(min(len(nums1), len(nums2))):
                if nums1[digit] > nums2[digit]:
                    result.append(nums1.pop(0))
                    flag = True
                    break
                elif nums2[digit] > nums1[digit]:
                    result.append(nums2.pop(0))
                    flag=True
                    break
            if flag:
                continue
            if len(nums1) > len(nums2):
                result.append(nums1.pop(0))
            else:
                result.append(nums2.pop(0))
        return result
    @staticmethod
    def greaterOne(nums1:list[int], nums2:list[int]) -> list[int]:
        if len(nums1) < len(nums2):
            return nums2
        elif len(nums2) < len(nums1):
            return nums1
        for i in range(len(nums1)):
            if nums1[i] > nums2[i]:
                return nums1
            elif nums2[i] > nums1[i]:
                return nums2
        return nums1

    def maxNumber(self, nums1: list[int], nums2: list[int], k: int) -> list[int]:
        result:list[int] = list()
        for fromNums1 in range(max(0, k-len(nums2)), min(k, len(nums1))+1):
            fromNums2:int = k - fromNums1
            max_nums1 = Solution.maxNums(nums1, fromNums1)
            max_nums2 = Solution.maxNums(nums2, fromNums2)
            # print("Max nums1 of", fromNums1, "digits is", max_nums1)
            # print("Max nums2 of", fromNums2, "digits is", max_nums2)
            new_result = Solution.merge(max_nums1, max_nums2)
            # print("Merged:", new_result)
            result = Solution.greaterOne(result, new_result)
        return result

if __name__ == '__main__':
    s = Solution()
    nums1 = [3,4,6,5]
    nums2 = [9,1,2,5,8,3]
    k = 5
    print(s.maxNumber(nums1, nums2, k))

    nums1 = [6,7]
    nums2 = [6,0,4]
    k = 5
    print(s.maxNumber(nums1, nums2, k))

    nums1 = [3, 9]
    nums2 = [8, 9]
    k = 3
    print(s.maxNumber(nums1, nums2, k))

    nums1 = [2,5,6,4,4,0]
    nums2 = [7,3,8,0,6,5,7,6,2]
    k = 15
    print(s.maxNumber(nums1, nums2, k))
