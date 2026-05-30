from typing import List, Tuple, Set

class Solution:
    def twoSum(self, nums:List[int], start_index:int, target:int) -> Set[Tuple[int]]:
        """
        Return all possible pairs with sum=target
        nums should be sorted here
        only looking for entries since start_index (including)
        """

        results:Set[Tuple[int]] = set()
        for i in range(start_index, len(nums)-1):
            second_target = target - nums[i]
            if second_target < -nums[-1]: # if even the greatest term cannot satisfy
                continue

            for j in range(i+1, len(nums)):
                if nums[j] == second_target:
                    results.add((nums[i], nums[j]))
        
        return results
    
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        # First, sort the array
        nums.sort()

        results:Set[Tuple[int]] = set()

        prev = None
        for i in range(len(nums)-2):
            num:int = nums[i]

            # Avoid repeating peers
            if num == prev:
                continue
            else:
                prev == num
            
            duals:Set[Tuple[int]] = self.twoSum(nums, i+1, -num)
            for dual in duals:
                results.add((num, dual[0], dual[1]))

        resultsAsList:List[List[int]] = list()
        for triple in results:
            resultsAsList.append(list(triple))
        return resultsAsList
    

if __name__ == '__main__':
    print(Solution().threeSum([-1,0,1,2,-1,-4]))
    print(Solution().threeSum([0,1,1]))
    print(Solution().threeSum([0,0,0]))