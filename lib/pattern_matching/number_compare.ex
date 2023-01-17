defmodule NumberCompare do
  def greater(number0, number1) do
    check(number0 => number1, number0, number1)
  end

  defp check(true, number, _) do: number
  defp check(false, _, number1) do: number1
end
