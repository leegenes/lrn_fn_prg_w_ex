defmodule WrapUp do
  def max(list), do: maxof(list, nil)
  def min(list), do: minof(list, nil)

  defp maxof([], max), do: max
  defp maxof([head | tail], max) do
    {new_max, _} = sort_compare(head, max)
    maxof(tail, new_max)
  end

  defp minof([], min), do: min
  defp minof([head | tail], min) do
    {_, new_min} = sort_compare(head, min)
    minof(tail, new_min)
  end

  defp sort_compare(a, nil), do: {a, a}
  defp sort_compare(a, b) when a >= b, do: {a, b}
  defp sort_compare(a, b) when a < b, do: {b, a}
end
