# Tic Tac Toe
require_relative 'lib'
require_relative 'game'

puts "Hi, it's Tic Tac Toe game"

print "Please, enter Player 1 name: "
player_1_name = gets.chomp

print "Please, enter Player 2 name: "
player_2_name = gets.chomp

game = Game.new(Player.new(1, player_1_name), Player.new(2, player_2_name), Board.new)
game.start