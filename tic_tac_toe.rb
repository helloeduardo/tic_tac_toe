require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'

puts "Welcome to this command line game of Tic Tac Toe!"

print "Player 1 (X's): What is your name?: "
player1 = Player.new(gets.chomp, "X")
print "Player 2 (O's): What is your name?: "
player2 = Player.new(gets.chomp, "O")

puts "Alright #{player1.name} and #{player2.name}, lets get started!"
game = Game.new(player1, player2)

until game.over? do
  game.board.display
  puts "#{game.current_player.name}, where would you like to place your token?"
  print "Enter a tile number (1-9): "
  game.place_token(gets.chomp)
  game.switch_player
end

game.board.display
if game.win?
  puts "Congratulations #{game.last_player.name}, you've won!"
else
  puts "Draw! Oh well!"
end
