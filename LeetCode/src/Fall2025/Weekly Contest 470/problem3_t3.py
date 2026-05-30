def encode(s:str) -> list[tuple[str, int]]:
    result:list[tuple[str, int]] = list()
    stack_start:int = 0
    for i in range(len(s)):
        if s[stack_start] != s[i]:
            # if there is a mismatch
            result.append((s[stack_start], i-stack_start))
            stack_start = i
    result.append((s[stack_start], len(s) - stack_start))
    return result

def decode(l:list[tuple[str, int]]) -> str:
    result:str = ""
    for i in l:
        result += i[0] * i[1]
    return result

def re_organize(l:list[tuple[str, int]], index:int) -> None:
    # if both terms have length zero
    if l[index][1] == 0 and l[index+1][1] == 0:
        # pop both terms
        l.pop(index)
        l.pop(index)
        return
    # if term1 is gone but term2 is still there
    if l[index][1] == 0:
        # first, pop term1
        l.pop(index)
        # if term1 is the first term in the array
        if index == 0:
            # no further action is required
            return
        # otherwise, combine term2 with the previous term
        # pop term2
        term2 = l.pop(index)
        # increase the term before term1
        l[index-1] = (')', l[index-1][1] + term2[1])
    # now, consider the case where term2 is gone but term1 is still there
    elif l[index+1][1] == 0:
        # first, pop term2
        l.pop(index+1)
        # if term2 is the last term in the array
        if index+1 == len(l):
            # no further action is required
            return
        # otherwise, combine term1 with the next term
        # pop term1
        term1 = l.pop(index)
        # increase the term after term2
        l[index] = ('(', l[index][1] + term1[1])


def remove_if_exist(l:list[tuple[str, int]], k:int) -> bool:
    removed_point = None
    for i in range(len(l)-1):
        if l[i][0] == '(' and l[i][1] >= k and l[i+1][0] == ')' and l[i+1][1] >= k:
            l[i] = ('(', l[i][1]-k)
            l[i+1] = (')', l[i+1][1]-k)
            removed_point = i
            break
    if removed_point is not None:
        re_organize(l, removed_point)
        return True
    return False


class Solution:
    def removeSubstring(self, s: str, k: int) -> str:
        l = encode(s)
        while remove_if_exist(l, k):
            pass
        return decode(l)


if __name__ == '__main__':
    # print(Solution().removeSubstring("()()((((()))", 3))
    # print(Solution().removeSubstring("(())", 1))
    # print(Solution().removeSubstring("())(", 1))
    print(Solution().removeSubstring("(()", 1))
    l = encode("(((())())(")
    print(remove_if_exist(l, 2))
    print(l)