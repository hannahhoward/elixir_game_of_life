defmodule ThreeByThreeSumsTest do
  use ExUnit.Case
  doctest GameOfLife.ThreeByThreeSums
  import GameOfLife.ThreeByThreeSums

  test "calculates sums of 3x3 grid around each cell" do
    initial_board = [[false, false, true], [true, true, false], [true, false, true]]
    assert three_by_three_sums(initial_board) == [
      [2, 3, 2],
      [3, 5, 3],
      [3, 4, 2]
    ]
  end 
end