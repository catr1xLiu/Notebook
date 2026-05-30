def remove_if_exist(s:str, k:int) -> str:
    start:int = 0

    for i in range(len(s)):
        current_length = (i-start) + 1
        faulty_bracket_1 = current_length <= k and s[i] == ')'
        faulty_bracket_2 = current_length > k and s[i] == '('
        if faulty_bracket_1 or faulty_bracket_2:
            start=i
            continue
        if current_length == k*2:
            return s[:start] + s[i+1:]
    return s

class Solution:
    def removeSubstring(self, s: str, k: int) -> str:
        while len(s) >= k*2:
            new_s = remove_if_exist(s, k)
            if new_s == s:
                break
            s = new_s
        return s

if __name__ == '__main__':
    print(remove_if_exist("()()()((()))", 3))