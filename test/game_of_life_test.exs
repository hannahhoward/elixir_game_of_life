defmodule GameOfLifeTest do
  use ExUnit.Case
  import GameOfLife
  doctest GameOfLife
  
  test "calculates the next board" do
    initial_board = [
      [false, false, true], 
      [true, true, false], 
      [true, false, true]]
    assert next_board(initial_board) == [
      [false, true, false],
      [true, false, true],
      [true, false, false]
    ]
  end 
end
