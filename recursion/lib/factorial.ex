defmodule Recursion.Factorial do
  def factorial(n) when n in 0..1, do: 1
  def factorial(n), do: n * factorial(n - 1)
end
