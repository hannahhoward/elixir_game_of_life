# GameOfLife

A solution to Conways Game of Life in Elixir

This solution represents the board as a list of list of booleans, where `true` means that cell is alive and `false` means the cell is dead. The decision to use Elixir/Erlang Lists presents several challenges -- because Lists don't have indexed access (a simpler solution might simply use Tuples or Maps). However, it felt like an interesting challenge the solve. The solution I came up with goes something like this:

1. From the board, generate a new list of lists where each element is itself a 3x3 list of the corresponding element on the board AS WELL AS all of its neighbors
2. From the list of list of 3x3's, generate a list of lists where each element is the sum of alive cells in the 3x3
4. Zip together the 3x3 sums with the original board
5. From the zipped up original+3x3 sums, generate a new version where each original is paired up wiht a the 3x3 sum, but has it's value taken out of the sum -- so it's just the sum of alive neighbors. You now have a list of lists where each element is the current status, plus the number of alive neighbors
6. Now, simply iterate that list of lists and apply the rules of conway's game of life to generate the board.