require './lib/board'
require './lib/cell'
require './lib/computer'
require './lib/ship'
require './lib/turn'

def main_menu
  puts 'Welcome to BATTLESHIP'
  puts 'Enter p to play. Enter q to quit.'
  input = gets.chomp

  if input == q
    exit
  elsif input == p
    run program
  else
    ask to reenter input
  end

end

def setup
  @computer_board = Board.new
  @player_board = Board.new

  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)

  @computer_board.computer_place
  computer places ships randomly

  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  puts @player_board.render

    1 2 3 4
  A . . . .
  B . . . .
  C . . . .
  D . . . .

  puts "Enter the squares for the Cruiser (3 spaces):"
  > A1 A2 A3

  puts @player_board.render(true)
    1 2 3 4
  A S S S .
  B . . . .
  C . . . .
  D . . . .

  puts "Enter the squares for the Submarine (2 spaces):"
  > C1 C3
  puts "Those are invalid coordinates. Please try again:"
  > D2 D3

end

def turn

  displays boards

=============COMPUTER BOARD=============
  1 2 3 4
A M . . M
B . . . .
C . . . .
D . . . .
==============PLAYER BOARD==============
  1 2 3 4
A S S S .
B . M . .
C M . S .
D . . S .

  puts "Enter the coordinate for your shot:"
  > D5
  puts "Please enter a valid coordinate:"
  > A1
  puts "You have already fired on this cell. Please choose another cell."
  >C3

  puts "Your shot on C3 was a miss."
  puts "My shot on C1 was a miss."

end

def results
  puts "You won!" || puts "I won!"
end
