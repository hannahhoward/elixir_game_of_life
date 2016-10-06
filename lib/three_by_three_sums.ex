defmodule GameOfLife.ThreeByThreeSums do
  import GameOfLife.Triples
  import GameOfLife.List2d
  
  def bool_sum(triple) do
    Enum.reduce triple, 0, fn(elem, acc) ->
      acc + ((elem && 1) || 0)
    end
  end

  def three_by_three_sums(board) do
    Enum.map(board, fn(row) -> triples(row, false) end)
      |> map_2d(&(bool_sum(&1)))
      |> transpose 
      |> Enum.map(fn(column) -> triples(column, 0) end)
      |> map_2d(&Enum.sum(&1))
      |> transpose
  end
end