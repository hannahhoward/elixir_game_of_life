defmodule TriplesTest do
  use ExUnit.Case
  doctest GameOfLife.Triples
  import GameOfLife.Triples

  test "creates triples" do
    assert triples([1, 2, 3, 4, 5], false) == [
      [false, 1, 2],
      [1, 2, 3],
      [2, 3, 4],
      [3, 4, 5],
      [4, 5, false]
    ]
  end 
end