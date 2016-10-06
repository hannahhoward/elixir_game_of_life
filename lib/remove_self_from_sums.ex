defmodule GameOfLife.RemoveSelfFromSums do
  import GameOfLife.List2d

  def dec_if_true({true, n}) do
    {true, n-1}
  end

  def dec_if_true({val, n}) do
    {val, n}
  end

  def remove_self_from_sums(state_neighbor_tuples) do
    map_2d state_neighbor_tuples, &dec_if_true(&1)
  end
end
