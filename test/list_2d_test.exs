defmodule List2dTest do
  use ExUnit.Case
  import GameOfLife.List2d
  doctest GameOfLife.List2d
  
  test "map" do
    list_2d = [[1,2], [3, 4], [5,6]]
    times2_2d = map list_2d, fn(x) -> x*2 end
    assert times2_2d == [[2,4], [6,8], [10, 12]]
  end 
  
  test "zip" do
    num_list_2d = [[1,2], [3, 4], [5,6]]
    letter_list_2d = [["a","b"],["c","d"],["e","f"]]
    tuples_2d = zip num_list_2d, letter_list_2d
    assert tuples_2d == [[{1, "a"},{2, "b"}], [{3, "c"},{4, "d"}], [{5, "e"}, {6, "f"}]]
  end 
end