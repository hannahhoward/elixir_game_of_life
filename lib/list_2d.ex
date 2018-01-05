defmodule GameOfLife.List2d do
  @moduledoc """
  utility functions for lists of lists
  """

  @doc """
  Given a list of lists, applies a transformation to every element in each single list in the lists of lists,
  and returns returns a list of lists of the results

  ## Examples
    
    iex> map([[1,2],[3,4]], fn x -> x*2 end)
    [[2,4],[6,8]]

  """
  @spec map(list_2d :: [[...]], cb :: (any -> any)) :: [[...]]
  def map(list_2d, cb) do
    Enum.map list_2d, fn(row) ->
      Enum.map row, &cb.(&1)
    end
  end

  @doc """
  Given two differents list of lists (of same size in both dimmentions), generates a list of lists where each
  element is a touple of the corresponding elements from each of the source lists

  ## Examples

    iex> zip([[1,2],[3,4]],[["a","b"],["c", "d"]])
    [[{1,"a"},{2,"b"}],[{3,"c"},{4,"d"}]]
  """
  @spec zip(list1_2d :: [[...]], list2_2d :: [[...]]) :: [[...]]
  def zip(list1_2d, list2_2d) do
    Enum.zip(list1_2d, list2_2d) |>
      Enum.map(fn({row1, row2}) -> 
        Enum.zip(row1, row2)
      end)
  end

  @doc """
  Given a list of lists, returns a list of lists where the nth list in the returned list of lists
  is a list of the nth element take from every list in the source list of lists

  ## Examples

    iex> transpose([[1,2],[3,4]])
    [[1,3],[2,4]]
  """
  @spec transpose(list_2d :: [[...]]) :: [[...]]
  def transpose(list_2d) do
    List.zip(list_2d) |> Enum.map(&Tuple.to_list(&1))
  end
end