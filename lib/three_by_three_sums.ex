defmodule GameOfLife.ThreeByThreeSums do
  @moduledoc """
  for every cell on the board, calculate a sum of the number of alive cells of the cell and it's surrounding neighbors
  """

  import GameOfLife.Triples
  alias GameOfLife.List2d
  

  @doc """
  Given a list of lists of cell statuses, calculates a series of 3x3 sums of number of alive cells for a 
  given position on the board
  """
  @spec three_by_three_sums(board :: [[boolean]]) :: [[integer]]
  def three_by_three_sums(board) do
    Enum.map(board, fn(row) -> triples(row, false) end)
      |> List2d.map(&bool_sum/1)
      |> List2d.transpose 
      |> Enum.map(fn(column) -> triples(column, 0) end)
      |> List2d.map(&Enum.sum/1)
      |> List2d.transpose
  end

  @spec bool_sum(triple :: [boolean]) :: integer
  defp bool_sum(triple) do
    Enum.reduce triple, 0, fn(elem, acc) ->
      acc + ((elem && 1) || 0)
    end
  end
end