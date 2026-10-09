# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'

system('clear') || system('cls')
puts '=== WELCOME TO CONNECT FOUR ==='
puts "Let's set up the players!\n"

# PLAYER 1
print "Enter Player 1's name: "
p1_name = gets.chomp
p1_name = 'Player 1' if p1_name.strip.empty?

print "Choose the emoji for #{p1_name} (e.g., 🔴, 🐱, 🚀):"
p1_marker = gets.chomp
p1_marker = '🔴' if p1_marker.strip.empty?

player1 = Player.new(p1_name, p1_marker)

puts "\n----------------------------------\n"

#PLAYER 2

print "Enter Player 2's name: "
p2_name = gets.chomp
p2_name = 'Player 2' if p2_name.strip.empty?

print "Choose the emoji for #{p2_name} (e.g., 🟡, 🐶, ⚡):"
p2_marker = gets.chomp
p2_marker = '🟡' if p2_marker.strip.empty?

if p2_marker == p1_marker
  p2_marker = '🟡'
  puts "⚠️ Marker same as Player 1's! Assigning default: 🟡"
end

player2 = Player.new(p2_name, p2_marker)

# GAME

game = Game.new(Board.new, [player1, player2])

system('clear') || system('cls')
puts "=== CONNECT FOUR: #{player1.name} (#{player1.marker}) VS #{player2.name} (#{player2.marker}) ==="
puts game.board.display

last_player = nil

until game.winner? || game.draw?
  puts "\n#{game.current_player} turn"
  print 'Choose a column from 0 to 6: '
  
  input = gets.chomp

  if input.match?(/^[0-6]$/)
    column = input.to_i

    last_player = game.current_player

    if game.play(column)
      system('clear') || system('cls')
      puts "=== CONNECT FOUR: #{player1.name} (#{player1.marker}) VS #{player2.name} (#{player2.marker}) ==="
      puts game.board.display
    else
      puts '⚠️ Column full! Choose another column.'
    end
  else
    puts '⚠️ Invalid input! Enter a number between 0 and 6.'
  end
end

if game.winner?
  puts "\n🎉 Game over! #{last_player} won! Congratulations! 🏆"
else
  puts "\n🤝 Game over! It's a draw! The board is full."
end