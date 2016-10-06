defmodule FateCalculatorTest do
  use ExUnit.Case
  doctest GameOfLife.FateCalculator
  import GameOfLife.FateCalculator

  test "living cell" do
    assert next_fate(true, 0) == false
    assert next_fate(true, 1) == false
    assert next_fate(true, 2) == true
    assert next_fate(true, 3) == true
    assert next_fate(true, 4) == false
    assert next_fate(true, 5) == false
    assert next_fate(true, 6) == false
    assert next_fate(true, 7) == false
    assert next_fate(true, 8) == false
  end

  test "dead cell" do
    assert next_fate(false, 0) == false
    assert next_fate(false, 1) == false
    assert next_fate(false, 2) == false
    assert next_fate(false, 3) == true
    assert next_fate(false, 4) == false
    assert next_fate(false, 5) == false
    assert next_fate(false, 6) == false
    assert next_fate(false, 7) == false
    assert next_fate(false, 8) == false
  end
end
