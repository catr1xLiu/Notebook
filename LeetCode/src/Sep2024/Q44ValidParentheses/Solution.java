package Sep2024.Q44ValidParentheses;

import java.util.Stack;

// https://leetcode.com/problems/valid-parentheses/description/
/**
 * Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 *
 * An input string is valid if:
 *
 * Open brackets must be closed by the same type of brackets.
 * Open brackets must be closed in the correct order.
 * Every close bracket has a corresponding open bracket of the same type.
 *
 *
 * Example 1:
 *
 * Input: s = "()"
 * Output: true
 * Example 2:
 *
 * Input: s = "()[]{}"
 * Output: true
 * Example 3:
 *
 * Input: s = "(]"
 * Output: false
 *
 *
 * Constraints:
 *
 * 1 <= s.length <= 104
 * s consists of parentheses only '()[]{}'.
 * */
public class Solution {
    public boolean isValid(String s) {
        final Stack<Character> openedBrackets = new Stack<>();

        for (char c:s.toCharArray()) {
            if (isOpener(c)) // if c in '([{'
                openedBrackets.push(c);
            else if (openedBrackets.isEmpty()
                    || (!matches(openedBrackets.pop(), c)))
                    return false;
        }

        return openedBrackets.isEmpty();
    }

    /**
     * whether c is one of "([{"
     * */
    public boolean isOpener(char c) {
        return c == '(' || c == '[' || c == '{';
    }

    /**
     * @return whether the opening character matches the closing character
     * */
    public boolean matches(char opener, char closer) {
        if (opener == '(')
            return closer == ')';
        if (opener == '[')
            return closer == ']';
        return closer == '}';
    }

    public static void main(String[] args) {
        System.out.println(new Solution().isValid("([)]"));
    }
}
