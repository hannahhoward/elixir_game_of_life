defmodule GameOfLife do
  import GameOfLife.Triples
  import GameOfLife.FateCalculator
  import GameOfLife.List2d
  
  def bool_sum(triple) do
    Enum.reduce triple, 0, fn(elem, acc) ->
      acc + ((elem && 1) || 0)
    end
  end

  def dec_if_true({true, n}) do
    {true, n-1}
  end

  def dec_if_true({val, n}) do
    {val, n}
  end

  def next_board(board) do
    column_triples = Enum.map board, &(triples(&1, false))
    triple_sums = map_2d column_triples, &(bool_sum(&1))
    transpose_sums = List.zip(triple_sums) |> Enum.map(&Tuple.to_list(&1))
    row_triples = Enum.map transpose_sums, &(triples(&1, 0))
    sums = map_2d row_triples, &Enum.sum(&1)
    state_neighbor_tuples = zip_2d board, sums
    revised_state_neighbor_tuples = map_2d state_neighbor_tuples, &dec_if_true(&1)
    map_2d revised_state_neighbor_tuples, fn({state, neighbor_count}) ->
      next_fate(state, neighbor_count)
    end
  end
end
