defmodule GameOfLife do
  @moduledoc """
  Calculate the next board for Conways game of life
  """
  import GameOfLife.FateCalculator
  import GameOfLife.ThreeByThreeSums
  import GameOfLife.RemoveSelfFromSums
  alias GameOfLife.List2d

  @doc """
  Given a board for Conways Game of Life, represented as a list of lists of booleans (true = alive, false = dead)
  return the next state of the board according to the rules of [Conways game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

  ## Examples

    iex> next_board([[false, false, true], [true, true, false], [true, false, true]])
    [[false, true, false],[true, false, true],[true, false, false]]
  """
  def next_board(board) do
    board
    |> List2d.zip(three_by_three_sums(board))
    |> remove_self_from_sums()
    |> List2d.map(fn({state, neighbor_count}) -> next_fate(state, neighbor_count) end)
  end
end
