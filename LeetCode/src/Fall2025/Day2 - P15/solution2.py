from typing import List, Tuple, Set

class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        # First, sort the array
        nums.sort()

        results:Set[Tuple[int]] = set()

        for i in range(len(nums)-2):
            num1:int = nums[i]

            # two pointers, one going forward and one going backwards
            j, k = i+1, len(nums)-1
            while j < k:
                num2 = nums[j]
                num3 = nums[k]
                num_sum = num1 + num2 + num3
                print(num1, num2, num3)
                if num_sum > 0:
                    # if the result is greater than zero, move pointer k backward to get smaller results
                    k -= 1
                elif num_sum < 0:
                    # if the is smaller than zero, move pointer j forwards to get bigger results
                    j += 1 
                if num_sum == 0:
                    # if the we got the result, add it to the collection
                    results.add((num1, num2, num3))
                    # Then, move both pointers
                    k -= 1
                    j += 1

        resultsAsList:List[List[int]] = list()
        for triple in results:
            resultsAsList.append(list(triple))
        return resultsAsList
    
if __name__ == '__main__':
    print(Solution().threeSum([-2,0,1,1,2]))
    # print(Solution().threeSum([0,1,1]))
    # print(Solution().threeSum([0,0,0])) 