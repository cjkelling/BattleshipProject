require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/turn'

def main_menu
  puts 'Welcome to BATTLESHIP'
  puts 'Enter P to play. Enter Q to quit.'
  input = gets.chomp.upcase

  loop do
    if input == "Q"
      exit
    elsif input == "P"
      add_ships
      puts 'Enter P to play. Enter Q to quit.'
      input = gets.chomp.upcase
    else
      puts "That is not a valid input. Please enter P to play. Enter Q to quit."
      input = gets.chomp.upcase
    end
  end
end

def board_setup
  @computer_board = Board.new
  @player_board = Board.new

  @ships_computer = []
  @ships_player = []
  @ships_computer << @cruiser = Ship.new("Cruiser", 3)
  @ships_computer << @submarine = Ship.new("Submarine", 2)
  @ships_computer << @ship = Ship.new(@ship.name, @ship.length)
  @ships_player << @cruiser = Ship.new("Cruiser", 3)
  @ships_player << @submarine = Ship.new("Submarine", 2)
  @ships_player << @ship = Ship.new(@ship.name, @ship.length)

  puts ""
  puts "The computer has laid out #{@ships_computer.count} ships on its board."
  puts "You now need to place your #{@ships_player.count} ships on your board."
  puts ""

  @player_board.board_render

  @ships_computer.each { |ship| @computer_board.computer_place(ship)}

  @ships_player.each do |ship|
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

def print_results(results)
  if results == "player"
    puts "You sunk the computer's last ship. You win!"
  elsif results == "computer"
    puts "The computer sunk your last ship. Computer wins!"
  end
end

def add_ships
  puts "Would you like to make your own ship? Press Y for yes, and N for no."
  input = gets.chomp.upcase
  if input == "N"
    play_game
  elsif input == "Y"
    puts "Give your ship a name:"
    name = gets.chomp.capitalize
    puts "Give your ship a length up to 4:"
    length = gets.chomp.to_i
    until length <= 4
      puts "That's too long. Shorten your damn ship!"
      length = gets.chomp.to_i
    end
    @ship = Ship.new(name, length)
  end
  play_game
end

def play_game
  board_setup
  turn = Turn.new(@computer_board, @player_board, @ships_computer, @ships_player)
  winner = turn.take_turns
  print_results(winner)
end

main_menu
