def smaller(a:str, b:str) -> str:
    if a == b == "inf":
        return "inf"
    if a == "inf":
        return b 
    if b == "inf":
        return a
    if len(a) < len(b):
        return a
    if len(b) < len(a):
        return b 
    for i in range(len(a)):
        if a[i] < b[i]:
            return a 
        if b[i] < a[i]:
            return b 
    return a
def format_num(num:str) -> str:
    rst = ""
    zeros_ended = False
    for i in num:
        if i != "0":
            zeros_ended = True 
        if zeros_ended:
            rst += i 
    return rst

class Solution:
    def removeKdigits(self, num: str, k: int) -> str:
        self.num = num
        return str(self.pickDigit("", 0, len(num)-k))
    
    # Pick n digits for the number
    def pickDigit(self, current_num:str, index:int, digits:int) -> str:
        if len(current_num) == digits:
            return format_num(current_num)
        digits_needed:int = digits - len(current_num)
        smallest_num = "inf"
        for i in range(index, len(self.num) - digits_needed+1):
            smallest_num = smaller(smallest_num, self.pickDigit(
                current_num + self.num[i],
                i+1,
                digits))
        return smallest_num

if __name__ == '__main__':
    s = Solution()
    print(s.removeKdigits("1432219", 3))
