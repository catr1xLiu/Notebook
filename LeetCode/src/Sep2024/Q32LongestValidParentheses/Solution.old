package Sep2024.Q32LongestValidParentheses;
// https://leetcode.com/problems/longest-valid-parentheses

/**
 * <h1>Longest Valid Parentheses</h1>
 *
 * Given a string containing just the characters '(' and ')', return the length of the longest valid (well-formed) parentheses substring.
 *
 * <h3>Example 1:</h3>
 * <code>Input: s = "(()"</code>
 * <code>Output: 2</code>
 * <p>Explanation: The longest valid parentheses substring is "()".</p>
 *
 * <h3>Example 2:</h3>
 * <code>Input: s = ")()())"</code>
 * <code>Output: 4</code>
 * <p>Explanation: The longest valid parentheses substring is "()()".</p>
 *
 * <h3>Example3: </h3>
 * <code>Input: s = ""</code>
 * <code>Output: 0</code>
 * */
public class Solution {
    public static void main(String[] args) {
        String s = "))))((()((";

        System.out.println(new Solution().longestValidParentheses(s));
    }

    public int longestValidParentheses(String s) {
        return longestValidParentheses(s, SubSequence.create(s));
    }

    private int longestValidParentheses(String s, SubSequence sequence) {
        if (sequence.isValid())
            return sequence.length();

        if (sequence.length() <= 1)
            return 0;

        return Math.max(
                longestValidParentheses(s, sequence.castLeft(s)),
                longestValidParentheses(s, sequence.castRight(s)));
    }
}

record SubSequence (
    // first digit index
    int start,
    // last digit index + 1
    int end,
    // the minimum depth within the sequence
    // this depths must be greater than 0 throughout the sequence to make this sequence VALID
    // so this value must be greater than 0
    int minimumDepth,
    // the depth at the end of the sequence
    int endingDepth) {

    public static SubSequence create(String s) {
        return create(s, 0, s.length());
    }

    public static SubSequence create(String s, int start, int end) {
        int depth = 0;
        int minDepth = 1;
        for (int i = start; i < end; i++) {
            depth += s.charAt(i) == '(' ? 1:-1;
            minDepth = Math.min(minDepth, depth);
        }
        return new SubSequence(start, end, minDepth, depth);
    }

    public boolean isValid() {
        System.out.println("start: " + start + ", end: " + end + ", minDepth: " + minimumDepth + ", endDepth: " + endingDepth);
        return minimumDepth >= 0 && endingDepth == 0;
    }

    public int length() {
        return end - start;
    }

    public SubSequence castLeft(String s) {
        if (s.charAt(start) == ')' && minimumDepth == -1)
            return create(s, start+1, end); // have to recompute
        if (s.charAt(start) == '(' && minimumDepth == 1)
            return create(s, start+1, end); // have to recompute
        // The '(' or  ')' will cause the depth on each digit to change
        int depthIncrement = s.charAt(start) == '('
                // if that digit is '(', the depth on each digit should decrease by 1
                ? -1
                // if that digit is ')', the depth on each digit should increase by 1
                : 1;
        return new SubSequence(
                start+1,
                end,
                minimumDepth + depthIncrement,
                endingDepth + depthIncrement);
    }

    public SubSequence castRight(String s) {
        int depthIncrement = s.charAt(end-1) == '('
                // if that digit is '(', the depth on the last digit should decrease by 1
                ? -1
                // if that digit is ')', the depth on the last digit should increase by 1
                : 1;
        // If the ending depth happens to be the minimum depths, we have no other option but to compute the minimum depth again
        if (endingDepth == minimumDepth)
            return SubSequence.create(s, start, end-1);
        // However, in other cases, the minimum depth won't change
        int endingDepthNew = endingDepth + depthIncrement;
        return new SubSequence(
                start,
                end-1,
                minimumDepth,
                endingDepthNew);
    }
}
