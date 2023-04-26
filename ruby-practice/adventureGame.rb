# text-based adventure game, to the following specification:
#The user starts by facing forward. They can move right, left, or forward. 
#If they move right, they die (there's a goblin). If they move left, they die (there's a werewolf). 
#If they move forward, they live. They have to do this twice to win.

move_number = 1

while true do
  puts "You are facing forward. You can move left, right or forward."

  users_move = gets.chomp
  
  if users_move == "left"
    puts "You lost, werewolf ate you!"
    break
  elsif users_move == "right"
    puts "You lost, goblin killed you!"
    break
  elsif users_move == "forward"
    if move_number >= 2
      puts "You won!" 
      break
    end
  else 
    puts "Invalid move, go again"
  end
  move_number += 1
end
  