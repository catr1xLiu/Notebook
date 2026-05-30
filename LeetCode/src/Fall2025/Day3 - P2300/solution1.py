from typing import *
class Solution:
    @staticmethod
    def count_greater(source:List[int], target:float) -> int:
        left: int = 0
        right = len(source) - 1

        if source[left] >= target:
            return len(source)
        if source[right] < target:
            return 0

        while right - left > 1:
            middle = (left + right) // 2
            if source[middle] >= target:
                right = middle
            else:
                left = middle

        return len(source) - right


    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        result:List[int] = list()
        potions.sort()

        for spell in spells:
            result.append(Solution.count_greater(potions, success / spell))

        return result

if __name__ == '__main__':
    spells = [5,1,3]
    potions = [1,2,3,4,5]
    success = 7
    # print(Solution().successfulPairs(spells, potions, success))
    p = [10, 11, 12, 24, 24, 24, 24, 24, 24, 26]
    print(Solution.count_greater(p, 24))

