defmodule GameOfLife.List2d do
  def map_2d(list_2d, cb) do
    Enum.map list_2d, fn(row) ->
      Enum.map row, &cb.(&1)
    end
  end

  def zip_2d(list1_2d, list2_2d) do
    Enum.zip(list1_2d, list2_2d) |>
      Enum.map(fn({row1, row2}) -> 
        Enum.zip(row1, row2)
      end)
  end
end