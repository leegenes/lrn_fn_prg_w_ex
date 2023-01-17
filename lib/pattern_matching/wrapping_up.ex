defmodule WrappingUp do
  def points_spent(%{str: str, dex: dex, int: int}) do
    str * 2 + (dex + int) * 3
  end

  def winner(board) do
    as_list = board |> Tuple.to_list()
    possibilities = rows(as_list) ++ cols(as_list) ++ diags(as_list)

    result = case check(possibilities) do
      :exit -> :no_winner
      player -> {:winner, player}
    end

    result

  end

  def rows(board_list) do
    Enum.chunk_every(board_list, 3)
  end

  def cols(board) do
      board
      |> Enum.with_index(fn el, idx -> {el, rem(idx, 3)} end)
      |> Enum.reduce(
        [[], [], []],
        fn {val, idx}, acc -> List.update_at(acc, idx, fn col -> [val | col] end) end
      )
  end

  def diags(board) do

    diag_idx = [[0,4,8], [2,4,6]]
    w_idx = board
    |> Enum.with_index()

    diagonals = [Enum.filter(w_idx, fn {_, idx} -> idx in Enum.at(diag_idx, 0) end)]
    diagonals = [Enum.filter(w_idx, fn {_, idx} -> idx in Enum.at(diag_idx, 1) end) | diagonals]
    Enum.map(
      diagonals,
      fn x -> Enum.map(x, fn xx -> elem(xx, 0) end) end)
  end

  def check([[a, a, a] | _]) do
    a
  end
  def check([_ | tail]) do
    check(tail)
  end
  def check([]) do
    :exit
  end

  def tax_rules(salary) do
    tax_rate = cond do
      salary <= 2000 -> 0
      salary <= 3000 -> 0.05
      salary <= 6000 -> 0.1
      salary > 6000 -> 0.15
    end

    salary * tax_rate
  end
end
