defmodule GameOfLife.Triples do
  @doc """
  converts a list of elements into a list of 3 element lists with the previous, current, and next element in the original
  list

  default is what to use if previous or next elements do not exist (for the first/last element in the list)
  ## Example

     iex> triples([1,2,3], "apples")
     [["apples", 1, 2], [1,2,3], [2,3,"apples"]]
  """
  @spec triples(list :: [any], default :: any) :: [[any]]
  def triples(list, default) do
    triple_iterate(default, list, default)
  end

  @spec triple_iterate(prev :: any, list :: [any], default :: any) :: [[any]]
  defp triple_iterate(prev, [], default) do
    [prev, default, default]
  end

  defp triple_iterate(prev, [cur | []], default) do
    [[prev, cur, default]]
  end

  defp triple_iterate(prev, [cur | remaining], default) do
    [next | _ ] = remaining
    [[prev, cur, next] | triple_iterate(cur, remaining, default) ]
  end
end
