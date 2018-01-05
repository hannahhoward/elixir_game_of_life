defmodule GameOfLife.FateCalculator do
  @moduledoc """
  a simple calculator of the next fate of a cell in Conway's game of life
  """

  @doc """
  Given a cells current status and it's number of alive neighbors, returns it's next status according to
  the rules of conway's game of life

  ## Examples
    
    iex> next_fate(true, 3)
    true

    iex> next_fate(true, 5)
    false

    iex> next_fate(false, 3)
    true

  """
  @spec next_fate(is_current_alive :: boolean, num_alive_neighbors :: integer) :: boolean
  def next_fate(_, 3), do: true
  def next_fate(true, 2), do: true
  def next_fate(_,_), do: false
end