from typing import *
class Solution:
    def sortColors(self, nums: List[int]) -> None:
        red, white, blue = 0, 0 ,0
        
        for i in nums:
            red += int(i == 0)
            white += int(i == 1)
            blue += int(i == 2)

        for i in range(len(nums)):
            if (red):
                nums[i] = 0
                red -= 1
            elif (white):
                nums[i] = 1
                white -= 1
            elif (blue):
                nums[i] = 2
                blue -= 1
