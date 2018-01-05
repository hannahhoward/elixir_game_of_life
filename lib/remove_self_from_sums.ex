defmodule GameOfLife.RemoveSelfFromSums do
  @moduledoc """
  a tool for removing the cell itself from calculated 3 by 3 sums
  """

  alias GameOfLife.List2d

  @doc """
  given a list of lists, where each element is a cell state and the number of alive cells, 
  in the surrounding 3x3 area including the cell itself,
  returns a list of lists with the cell state, but the number of alive cells decremented by 1 if the cell itself is
  alive
  """
  @spec remove_self_from_sums(state_neighbor_tuples :: [[{boolean, integer}]]) :: [[{boolean, integer}]]
  def remove_self_from_sums(state_neighbor_tuples) do
    List2d.map state_neighbor_tuples, &dec_if_true/1
  end

  @spec dec_if_true({is_alive :: boolean, neighbor_sum_including_self :: integer}) :: { boolean, integer }
  defp dec_if_true({true, n}) do
    {true, n-1}
  end

  defp dec_if_true({val, n}) do
    {val, n}
  end

end
