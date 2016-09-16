defmodule GameOfLife.Triples do
  def triples(list, default) do
    triple_iterate(default, list, default)
  end

  def triple_iterate(prev, [], default) do
    [prev, default, default]
  end

  def triple_iterate(prev, [cur | []], default) do
    [[prev, cur, default]]
  end

  def triple_iterate(prev, [cur | remaining], default) do
    [next | _ ] = remaining
    [[prev, cur, next] | triple_iterate(cur, remaining, default) ]
  end
end
