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


def setup
  @computer_board = Board.new
  @player_board = Board.new

  @ships = []
  @ships << @cruiser = Ship.new("Cruiser", 3)
  @ships << @submarine = Ship.new("Submarine", 2)

  puts ""
  puts "The computer has laid out #{@ships.count} ships on their board."
  puts "You now need to place your #{@ships.count} ships."
  puts ""

  @player_board.render

  @ships.each do |ship|
    @computer_board.computer_place(ship)
    puts ""
    puts "Enter the squares for the #{ship.name}(#{ship.length} spaces):"
    player_input = gets.chomp.upcase.split(" ")
    until @player_board.valid_placement?(ship, player_input)
      puts "Those are invalid coordinates. Please try again:"
      player_input = gets.chomp.upcase.split(" ")
    end
    @player_board.place(ship, player_input)
  end

  puts "========== Computer Board =========="
  @computer_board.render(true)
  puts "========== Player Board =========="
  @player_board.render(true)

end

def take_turns
  puts "I'm taking turns"
end

def print_results
  puts "I'm giving you results"
end

def play_game
  setup
  take_turns
  print_results
end

main_menu

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
