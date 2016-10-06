defmodule GameOfLife do
  import GameOfLife.FateCalculator
  import GameOfLife.List2d
  import GameOfLife.ThreeByThreeSums
  import GameOfLife.RemoveSelfFromSums
  
  def next_board(board) do
    sums = three_by_three_sums(board)

    zip_2d(board, sums)
    |> remove_self_from_sums
    |> map_2d (fn({state, neighbor_count}) ->
      next_fate(state, neighbor_count)
    end)

  end
end
