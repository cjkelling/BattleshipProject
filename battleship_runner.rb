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

  @ships_computer = []
  @ships_player = []
  @ships_computer << @cruiser = Ship.new("Cruiser", 3)
  @ships_computer << @submarine = Ship.new("Submarine", 2)
  @ships_player << @cruiser = Ship.new("Cruiser", 3)
  @ships_player << @submarine = Ship.new("Submarine", 2)

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

def take_turns
  # turn = Turn.new
  loop do
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

    # if @computer_board[coordinates_ship].render.all? {|@computer_board[coordinates_ship]| == "X" print_results(player)}
    # end

    @computer_options = @player_board.cells.keys

    computer_guess = @computer_options.sample(1)
      @computer_options.delete(computer_guess[0])

    @player_board.cells[computer_guess[0]].fire_upon
    @player_board.cells[computer_guess[0]].render

    # if @player_board.cells.ship.all? {|ship| ship.sunk?}
    #   print_results(computer)
    # end

    if @player_board.cells[computer_guess[0]].render == "M"
      puts "The computer's shot on #{computer_guess[0]} was a miss."
    elsif @player_board.cells[computer_guess[0]].render == "H"
      puts "The computer's shot on #{computer_guess[0]} was a hit."
    elsif @player_board.cells[computer_guess[0]].render == "X"
      puts "The computer's shot on #{computer_guess[0]} was a hit and sunk your ship."
    end

    if @computer_board.cells[player_guess].render == "M"
      puts "Your shot on #{player_guess} was a miss."
    elsif @computer_board.cells[player_guess].render == "H"
      puts "Your shot on #{player_guess} was a hit."
    elsif @computer_board.cells[player_guess].render == "X"
      puts "Your shot on #{player_guess} was a hit and sunk the computer's ship."
    end
      puts ""
      puts ""
    end
end

def print_results
  if results == player
    puts "Player won!"
  elsif results == computer
    puts "Computer wins!"
  end
  # puts "You won!" || puts "I won!"
end

def play_game
  setup
  take_turns
  print_results
end

main_menu

#
# def results
#   puts "You won!" || puts "I won!"
# end
