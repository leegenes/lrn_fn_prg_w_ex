user_input = IO.gets "Write your ability score:"
{ability_score, _} = Integer.parse(user_input)
ability_modifier = (ability_score / 2)
IO.puts "Your ability modifier is #{ability_modifier}"
