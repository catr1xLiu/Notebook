import time
from typing import Any, Callable, List, Set

PRINT_PROCESS = False

class Sudoku:
    def __init__(self, initial_board:List[List[str]]):
        '''
        Creates a new Sudoku puzzle
        '''

        # Whether each grid on the board can be modified. 
        # Grids that are initial provided in the problem are NOT modifiable.
        self.modifiable:List[List[bool]] = []

        # Stores the current soduku board in an integer array, 0 represents blank
        self.board:List[List[int]] = []

        self.cursor_x:int = 0
        self.cursor_y:int = 0

        self.modified_stack:List[List[int]] = []

        for i in range(9):
            _:List[bool] = []
            self.modifiable.append(_)
            self.board.append([])
            for j in range(9):
                grid_val = initial_board[i][j]
                self.modifiable[i].append(grid_val == '.')
                if grid_val == '.':
                    self.board[i].append(0)
                else:
                    self.board[i].append(int(grid_val))
    
    def next_grid(self) -> bool:
        '''
        Move the cursor to the next modifiable grid
        Returns: False if the current grid is the last, True otherwise
        '''

        while True:
            self.cursor_x += 1
            if self.cursor_x >= 9:
                self.cursor_x = 0
                self.cursor_y += 1
            if self.cursor_y >= 9:
                break
            if self.modifiable[self.cursor_x][self.cursor_y]:
                return True
        
        return False
    
    def previous_grid(self) -> bool:
        self.board[self.cursor_x][self.cursor_y] = 0
        if self.modified_stack:
            self.cursor_x, self.cursor_y = self.modified_stack.pop()
            return True
        return False
    
    def modify(self) -> bool:
        '''
        Attempts to increase 
        If it is impossible to increase, returns false
        '''
        eliminates:Set[int] = set()

        # Elinates all exisitng values on the horizontal and vertical line
        for i in range(9):
            eliminates.add(self.board[i][self.cursor_y])
            eliminates.add(self.board[self.cursor_x][i])
        
        # Elinates all exisitng values in the small 3x3 grid
        initial_x = int(self.cursor_x / 3) * 3
        initial_y = int(self.cursor_y / 3) * 3
        for i in range(3):
            for j in range(3):
                eliminates.add(self.board[initial_x + i][initial_y + j])
        
        for i in range(self.board[self.cursor_x][self.cursor_y] + 1, 10):
            if i not in eliminates:
                self.board[self.cursor_x][self.cursor_y] = i
                return True
        return False

    def iterate(self) -> bool:
        '''
        Make an attempt to fill in the current grid and move to the next grid.
        If it is impossible to fill the current grid, trace back to the previous grid.
        Returns False if the last modifiable grid is filled, marking the puzzle as complete; Returns True otherwise.
        '''

        # Attempts to modify the current grid
        if self.modify():
            # If success, move to the next grid
            self.modified_stack.append([self.cursor_x, self.cursor_y])
            return self.next_grid()
        
        # If it is impossible to modify the current grid, we trace back to the previously modified grid 
        x, y = self.cursor_x, self.cursor_y
        if not self.previous_grid():
            raise RuntimeError(f"Cannot TraceBack from {x}, {y}.")
        return True

    def solve(self):
        if not self.modifiable[self.cursor_x][self.cursor_y]:
            self.next_grid()
        while self.iterate():
            if PRINT_PROCESS:
                print(f"\rWorking on: ({self.cursor_x}, {self.cursor_y})", end="", flush=True)
    
    def print(self):
        print()
        for i in self.board:
            print(i)

    def output(self, target:List[List[str]]):
        for i in range(9):
            for j in range(9):
                target[i][j] = str(self.board[i][j])
                target[i][j] = target[i][j].replace("0", ".")

def with_timer(func:Callable[..., Any]):
    def wrapper(*args:Any, **kwargs:Any):
        start = time.perf_counter()
        ret = func(*args, **kwargs)
        end = time.perf_counter()
        print(f"time used: {(end-start)} seconds")
        return ret
    return wrapper

class Solution:
    @with_timer
    def solveSudoku(self, board: List[List[str]]) -> None:
        sudoku = Sudoku(board)
        sudoku.solve()
        sudoku.output(board)
        sudoku.print()


if __name__ == '__main__':
    board = [
        ["5","3",".",".","7",".",".",".","."],
        ["6",".",".","1","9","5",".",".","."],
        [".","9","8",".",".",".",".","6","."],
        ["8",".",".",".","6",".",".",".","3"],
        ["4",".",".","8",".","3",".",".","1"],
        ["7",".",".",".","2",".",".",".","6"],
        [".","6",".",".",".",".","2","8","."],
        [".",".",".","4","1","9",".",".","5"],
        [".",".",".",".","8",".",".","7","9"]]
    board = [[".",".",".",".",".",".",".",".","."],[".","9",".",".","1",".",".","3","."],[".",".","6",".","2",".","7",".","."],[".",".",".","3",".","4",".",".","."],["2","1",".",".",".",".",".","9","8"],[".",".",".",".",".",".",".",".","."],[".",".","2","5",".","6","4",".","."],[".","8",".",".",".",".",".","1","."],[".",".",".",".",".",".",".",".","."]]
    Solution().solveSudoku(board)
    print(board)
    
