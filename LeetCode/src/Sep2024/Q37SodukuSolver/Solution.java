package Sep2024.Q37SodukuSolver;
// https://leetcode.com/problems/sudoku-solver/
/**
 * You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
 *
 * Merge nums1 and nums2 into a single array sorted in non-decreasing order.
 *
 * The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
 *
 *
 *
 * Example 1:
 *
 * Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 * Output: [1,2,2,3,5,6]
 * Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 * The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 * Example 2:
 *
 * Input: nums1 = [1], m = 1, nums2 = [], n = 0
 * Output: [1]
 * Explanation: The arrays we are merging are [1] and [].
 * The result of the merge is [1].
 * Example 3:
 *
 * Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 * Output: [1]
 * Explanation: The arrays we are merging are [] and [1].
 * The result of the merge is [1].
 * Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
 *
 *
 * Constraints:
 *
 * nums1.length == m + n
 * nums2.length == n
 * 0 <= m, n <= 200
 * 1 <= m + n <= 200
 * -109 <= nums1[i], nums2[j] <= 109
 *
 *
 * Follow up: Can you come up with an algorithm that runs in O(m + n) time?
 * */
class Solution {
    public static void main(String[] args) {
        final char[][] board = new char[9][9];
        final String[] boardString = new String[] {
                "53..7....",
                "6..195...",
                ".98....6.",
                "8...6...3",
                "4..8.3..1",
                "7...2...6",
                ".6....28.",
                "...419..5",
                "....8..79",
        };

        for (int i = 0; i < 9; i++)
            board[i] = boardString[i].toCharArray();

        new Solution().solveSudoku(board);

        for (char[] charArray : board) {
            for (char c : charArray)
                System.out.print(c + " ");
            System.out.println();
        }
    }

    public void solveSudoku(char[][] board) {
        solveSudoku(board, 0, 0);
    }

    public boolean solveSudoku(char[][] board, int i, int j) {
        if (i >= 9)
            return solveSudoku(board, 0, j + 1);
        if (j >= 9)
            return true; // solution found

        System.out.println(i + " " + j);
        if (board[i][j] != '.')
            return solveSudoku(board, i + 1, j);

        for (char attempt : "123456789".toCharArray()) {
            final char originalChar = board[i][j];
            board[i][j] = attempt;
            if (validateGivenPoint(board, i, j))
                if (solveSudoku(board, i + 1, j))
                    return true;
            board[i][j] = originalChar;
        }
        return false;
    }

    /**
     * separates the inner grid that the point belongs to
     * 
     * @param board
     * @param pointI
     * @param pointJ
     * @return
     */
    private char[][] separateInnerGrid(char[][] board, int pointI, int pointJ) {
        char[][] innerGrid = new char[3][3];

        final int startI = (pointI / 3) * 3, startJ = (pointJ / 3) * 3;
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
                innerGrid[i][j] = board[i + startI][j + startJ];

        return innerGrid;
    }

    private boolean validateGivenPoint(char[][] board, int row, int col) {
        // validate the current colum and row
        for (int index = 0; index < 9; index++) {
            if (index != col && board[row][index] == board[row][col])
                return false;
            if (index != row && board[index][col] == board[row][col])
                return false;
        }

        // validate the current inner gird
        final int innerGridRow = row % 3, innerGridCol = col % 3;
        final char[][] innerGrid = separateInnerGrid(board, row, col);
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
                if (innerGridRow != i && innerGridCol != j && innerGrid[i][j] == innerGrid[innerGridRow][innerGridCol])
                    return false;

        return true;
    }
}