require "./guessinggame"
puts "Starting the game"
game = GuessingGame.new

until game.finished?
  print "Enter a quess:"
  number = gets.chomp.to_i
  game.guess(number)
end

if game.won?
  puts "You won!"
else
  puts "You lost!"
end
