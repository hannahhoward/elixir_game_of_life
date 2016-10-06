defmodule RemoveSelfFromSumsTest do
  use ExUnit.Case
  doctest GameOfLife.RemoveSelfFromSums
  import GameOfLife.RemoveSelfFromSums

  test "decrements sums if self cell is alive" do
    state_neighbor_tuples = [[{true, 3}, {false, 3}], [{false, 4}, {true, 2}]]
    assert remove_self_from_sums(state_neighbor_tuples) == [
      [{true, 2}, {false, 3}],
      [{false, 4}, {true, 1}]
    ]
  end 
end