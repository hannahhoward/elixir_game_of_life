defmodule GameOfLife.FateCalculator do
  def next_fate(_, 3), do: true
  def next_fate(true, 2), do: true
  def next_fate(_,_), do: false
end