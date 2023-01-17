defmodule WorkingWithFunctions.WrappingUp do
  @bread_cost 0.10
  @milk_bottle_cost 2.0
  @cake_cost 15.0

  def calculate_cost(breads, milks, cakes) do
    (breads * @bread_cost) + (milks * @milk_bottle_cost) + (cakes * @cake_cost)
  end
end
