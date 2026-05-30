package Sep2024.Q699FallingSquares;

import java.util.ArrayList;
import java.util.List;

public class Solution {
    public List<Integer> fallingSquares(int[][] positions) {
        final List<Square> squares = new ArrayList<>();
        final List<Integer> answers = new ArrayList<>();
        int currentAnswer = 0;
        for (int[] newSquare:positions) {
            int maxHeight = 0;
            for (Square square:squares)
                if (square.overLapsWith(newSquare[0], newSquare[1]))
                    maxHeight = Math.max(maxHeight, square.topEdgeHeightY);
            final Square newSquareInstance = new Square(newSquare[0], newSquare[1], maxHeight);
            squares.add(newSquareInstance);
            currentAnswer = Math.max(newSquareInstance.topEdgeHeightY, currentAnswer);
            answers.add(currentAnswer);
        }

        return answers;
    }

    class Square {
        public final int fromX, toX, topEdgeHeightY;

        Square(int fromX, int size, int startingHeightY) {
            this.fromX = fromX;
            this.toX = fromX + size;
            this.topEdgeHeightY = startingHeightY + size;
        }

        public boolean overLapsWith(int newSquareX, int newSquareSideLength) {
            return toX > newSquareX
                    && fromX < newSquareX + newSquareSideLength;
        }
    }
}
