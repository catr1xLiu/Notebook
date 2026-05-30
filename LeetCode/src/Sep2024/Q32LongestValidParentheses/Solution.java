// https://leetcode.com/problems/longest-valid-parentheses

package Sep2024.Q32LongestValidParentheses;

import java.util.Arrays;

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
    public int longestValidParentheses(String s) {
        int[] maxSubSequenceEndingAtEachChar = new int[s.length()];
        Arrays.fill(maxSubSequenceEndingAtEachChar, 0);

        int ans = 0;
        for (int i = 1; i < s.length(); i++) {
            // A valid sub-sequence should not end as '('
            if (s.charAt(i) == '(')
                continue;

            // If the previous digit is '(',
            // the last two digit forms a valid sequence itself
            // So we can extend 2 more digit from the previous valid sequence
            if (s.charAt(i - 1) == '(') {
                int previousSubsequenceLength = i >= 2
                        ? maxSubSequenceEndingAtEachChar[i - 2]
                        : 0;
                maxSubSequenceEndingAtEachChar[i] = previousSubsequenceLength + 2;
            }


            // If the previous digit is ')',
            // We need to check if we can find one more '(' before the start of the previous sequence
            if (s.charAt(i - 1) == ')') {
                int previousSubsequenceLength = maxSubSequenceEndingAtEachChar[i - 1];
                int previousSubSequenceEndIndex = i - previousSubsequenceLength;
                // If we can find one more '(' before the start of the previous sequence
                if (previousSubSequenceEndIndex != 0 && s.charAt(previousSubSequenceEndIndex - 1) == '(') {
                    // Then we can extend the sequence by a length of 2
                    maxSubSequenceEndingAtEachChar[i] = previousSubsequenceLength + 2;
                    // Furthermore, it can connect to a previous subsequence and form a new, longer subsequence
                    if (previousSubSequenceEndIndex-2 >= 0)
                        maxSubSequenceEndingAtEachChar[i] = maxSubSequenceEndingAtEachChar[i] + maxSubSequenceEndingAtEachChar[previousSubSequenceEndIndex-2];
                }
            }

            ans = Math.max(maxSubSequenceEndingAtEachChar[i], ans);
        }

        return ans;
    }
}