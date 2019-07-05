require './lib/board'
require './lib/cell'
require './lib/ship'

def main_menu
  puts 'Welcome to BATTLESHIP'
  puts 'Enter P to play. Enter Q to quit.'
  input = gets.chomp.upcase

  loop do
    if input == "Q"
      exit
    elsif input == "P"
      play_game
      puts 'Enter P to play. Enter Q to quit.'
      input = gets.chomp.upcase
    else
      puts "That is not a valid input. Please enter P to play. Enter Q to quit."
      input = gets.chomp.upcase
    end
  end
end

def play_game
  setup
  take_turns
  print_results
end

def setup
  @computer_board = Board.new
  @player_board = Board.new

  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  #
  # @computer_board.computer_place(@cruiser)
  # @computer_board.computer_place(@submarine)

  puts ""
  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  puts ""

  @player_board.board_render

  puts ""
  puts "Enter the squares for the Cruiser (3 spaces):"
  player_input = gets.chomp.upcase.split(" ")

  until @player_board.valid_coordinate?(player_input) && @player_board.valid_placement?(@cruiser, player_input)
      puts "Those are invalid coordinates. Please try again:"
      player_input = gets.chomp.upcase.split(" ")
  end

  @player_board.place(@cruiser, player_input)

  puts ""
  puts "Enter the squares for the Submarine (2 spaces):"
  player_input = gets.chomp.upcase.split(" ")

  until @player_board.valid_coordinate?(player_input) && @player_board.valid_placement?(@submarine, player_input)
    puts "Those are invalid coordinates. Please try again:"
    player_input = gets.chomp.upcase.split(" ")
  end

  @player_board.place(@submarine, player_input)

  @player_board.board_render
end

def take_turns
  puts "I'm taking turns"
end

def print_results
  puts "I'm giving you results"
end


main_menu
#
#
# def turn
#
#   displays boards
#
# =============COMPUTER BOARD=============
#   1 2 3 4
# A M . . M
# B . . . .
# C . . . .
# D . . . .
# ==============PLAYER BOARD==============
#   1 2 3 4
# A S S S .
# B . M . .
# C M . S .
# D . . S .
#
#   puts "Enter the coordinate for your shot:"
#   > D5
#   puts "Please enter a valid coordinate:"
#   > A1
#   puts "You have already fired on this cell. Please choose another cell."
#   >C3
#
#   puts "Your shot on C3 was a miss."
#   puts "My shot on C1 was a miss."
#
# end
#
#
# def results
#   puts "You won!" || puts "I won!"
# end
