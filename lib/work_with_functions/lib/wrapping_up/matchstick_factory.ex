defmodule MatchstickFactory do
  @box_size_map %{
    big: 50,
    medium: 20,
    small: 5
  }
  @big_amt 50
  @med_amt 20
  @sml_amt 5
  @out_map %{}


  def calc_box([size | tail], box_map) do
    remainder = box_map.remaining_matchsticks
    merge_map = %{
      size => div(remainder, @box_size_map[size]),
      remaining_matchsticks: rem(remainder, @box_size_map[size])
    }

    calc_box(tail, Map.merge(box_map, merge_map))
  end

  def calc_box([], box_map) do
    box_map
  end


  def boxes(count) do
    calc_box [:big, :medium, :small], %{remaining_matchsticks: count}
  end
end
