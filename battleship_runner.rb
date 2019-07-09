require './lib/board'
require './lib/cell'
require './lib/ship'
# require './lib/turn'

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
  @ships.push @cruiser = Ship.new("Cruiser", 3), @submarine = Ship.new("Submarine", 2)

  puts ""
  puts "The computer has laid out #{@ships.count} ships on their board."
  puts "You now need to place your #{@ships.count} ships on your board."
  puts ""

  @player_board.board_render

  @ships.each do |ship|
    @computer_board.computer_place(ship)
    puts ""
    puts "Enter the coordinates for your #{ship.name}(#{ship.length} spaces):"
    player_input = gets.chomp.upcase.split(" ")
    until @player_board.valid_coordinate?(player_input) && @player_board.valid_placement?(ship, player_input)
      puts "Those are invalid coordinates. Please try again:"
      player_input = gets.chomp.upcase.split(" ")
    end
    @player_board.place(ship, player_input)
  end
end

def take_turns
  loop do
    puts ""
    puts "=============COMPUTER BOARD============="
    @computer_board.board_render
    puts ""
    puts "=============PLAYER BOARD============="
    @player_board.board_render(true)
    puts ""

    puts "Enter the coordinate for your shot:"
    player_guess = gets.chomp.upcase

    until @computer_board.valid_coordinate?([player_guess])
      puts "Please choose a valid coordinate:"
      player_guess = gets.chomp.upcase
    end

    until @computer_board.cells[player_guess].fired_upon? == false
      puts "You have already fired on this cell. Please choose another cell:"
      player_guess = gets.chomp.upcase
    end

    @computer_board.cells[player_guess].fire_upon
    @computer_board.cells[player_guess].render(true)

    computer_options = @player_board.cells.keys
    computer_guess = computer_options.sample(1)
    computer_options.delete(computer_guess[0])

    @player_board.cells[computer_guess[0]].fire_upon
    @player_board.cells[computer_guess[0]].render

    if @player_board.cells[computer_guess[0]].render == "M"
      puts "Computer shot on #{computer_guess[0]} was a miss."
    elsif @player_board.cells[computer_guess[0]].render == "H"
      puts "Computer shot on #{computer_guess[0]} was a hit."
    elsif @player_board.cells[computer_guess[0]].render == "X"
      puts "Computer shot on #{computer_guess[0]} was a hit and sunk your ship."
    end

    if @computer_board.cells[player_guess].render == "M"
      puts "Player's shot on #{player_guess} was a miss."
    elsif @player_board.cells[player_guess].render == "H"
      puts "Player's shot on #{player_guess} was a hit."
    elsif @player_board.cells[player_guess].render == "X"
      puts "Player's shot on #{player_guess} was a hit and sunk their ship."
    end
  end
end

def print_results(results)
  if (results) == player
    puts "Player wins!"
  elsif (results) == computer
    puts "Computer wins!"
  end
end

def play_game
  setup
  take_turns
  print_results
end

main_menu

#
#   puts "Your shot on C3 was a miss."
#   puts "My shot on C1 was a miss."
