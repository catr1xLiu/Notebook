from heapq import heappush, nsmallest
from typing import Self

class Element:
    value:int = 0
    occurrence:int = 0

    def __init__(self, value:int, occurrence:int=1):
        self.value = value
        self.occurrence = occurrence

    def __lt__(self, other:Self):
        if self.occurrence == other.occurrence:
            return self.value > other.value
        return self.occurrence > other.occurrence

    def __repr__(self):
        return f"<Value {self.value} with {self.occurrence} Occurrence(s)>"

def x_sum(elements:list[Element], x:int) -> int:
    x_sum:int = 0
    for e in nsmallest(x, elements):
        x_sum += e.value * e.occurrence
    return x_sum

def to_elements(nums:list[int]) -> list[Element]:
    num_to_occurance:dict[int, int] = dict()
    for num in nums:
        if num not in num_to_occurance:
            num_to_occurance[num] = 0
        num_to_occurance[num] += 1
    
    elements: list[Element] = list()
    for value, occurrence in num_to_occurance.items():
        heappush(elements, Element(value, occurrence))
    return elements

# TODO: Currently, the two functions below all have a time complexity O(n)
# This causes the time complexity of our entire solution to be O(n*k*log(n))
# We should build a reverse map that maps a `num` to its index in the `elements` list
# This way these two functions will have time complxity O(1)

def elements_remove(elements:list[Element], num:int):
    for i in range(len(elements)):
        e = elements[i]
        if e.value != num:
            continue 
        elements.pop(i)
        e.occurrence -= 1
        if e.occurrence > 0:
            heappush(elements, e)
        return

def elements_add(elements:list[Element], num:int):
    for i in range(len(elements)):
        e = elements[i]
        if e.value != num:
            continue

        elements.pop(i)
        e.occurrence += 1
        heappush(elements, e)
        return
    
    heappush(elements, Element(num))

class Solution:
    def findXSum(self, nums: list[int], k: int, x: int) -> list[int]:
        elements:list[Element] = to_elements(nums[0:k])

        results:list[int] = list()

        for i in range(len(nums)-k+1):
            # print(f"elements are currently: {elements}")
            results.append(x_sum(elements, x))

            if i == len(nums)-k:
                break
            # Move sliding window forward
            elements_remove(elements, nums[i])
            # print(f"nums[i]={nums[i]} is removed, elements are now: {elements}.")
            elements_add(elements, nums[i+k])
            # print(f"nums[i+k]={nums[i+k]} is removed, elements are now: {elements}.")

        return results

if __name__ == '__main__':
    result = Solution().findXSum([8,2,2], 2, 2)
    print("Result:", result)
