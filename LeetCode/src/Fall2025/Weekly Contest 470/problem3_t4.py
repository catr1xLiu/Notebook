def remove_if_match(s:str, sample:str) -> str:
    start_point = len(s) - len(sample)
    if start_point >= 0 and s[start_point:] == sample:
        return s[0:start_point]
    return s
class Solution:
    def removeSubstring(self, s: str, k: int) -> str:
        result = ""
        sample = "(" * k + ")" * k
        for i in s:
            result += i
            result = remove_if_match(result, sample)
        result = remove_if_match(result, sample)
        return result

if __name__ == '__main__':
    print(Solution().removeSubstring("(())", 1))