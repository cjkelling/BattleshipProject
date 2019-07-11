require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/turn'
require 'pry'

loop do
  puts 'Welcome to BATTLESHIP'
  puts 'Enter P to play. Enter Q to quit.'
  input = gets.chomp.upcase

  until input == "P" || input == "Q"
    puts "That is not a valid input. Please enter P to play. Enter Q to quit."
    input = gets.chomp.upcase
  end
    if input == "Q"
      exit
    end


  @computer_board = Board.new
  @player_board = Board.new

  @ships_computer = []
  @ships_player = []
  @ships_computer << @cruiser = Ship.new("Cruiser", 3)
  @ships_computer << @submarine = Ship.new("Submarine", 2)
  @ships_player << @cruiser = Ship.new("Cruiser", 3)
  @ships_player << @submarine = Ship.new("Submarine", 2)

    puts "Would you like to make a ship? Press Y for yes, and N for no."
    input = gets.chomp.upcase
    if input == "N"
      puts "Sweet, you have a Cruiser and a Submarine!"
    elsif input == "Y"
      puts "How many (up to 3)?"
      answer = gets.chomp.to_i
      answer.times do
        puts "Give your ship a name:"
        name = gets.chomp.capitalize
          puts "Give your ship a length up to 4:"
          length = gets.chomp.to_i
          until length.between?(1,4)
            puts "numbers only!"
            puts "Give your ship a length up to 4:"
            length = gets.chomp.to_i
          end
        @ship = Ship.new(name, length)
        @ships_player << @ship = Ship.new(@ship.name, @ship.length)
        @ships_computer << @ship = Ship.new(@ship.name, @ship.length)
      end
    end

  puts ""
  puts "The computer has laid out #{@ships_computer.count} ships on its board."
  puts "You now need to place your #{@ships_player.count} ships on your board."
  puts ""

  @player_board.board_render

  @ships_computer.each { |ship| @computer_board.computer_place(ship)}

  @ships_player.each do |ship|
    puts ""
    puts "Enter the coordinates for your #{ship.name} (#{ship.length} spaces):"
    player_input = gets.chomp.upcase.split(" ")
    until @player_board.valid_coordinate?(player_input) && @player_board.valid_placement?(ship, player_input)
      puts "Those are invalid coordinates. Please try again:"
      player_input = gets.chomp.upcase.split(" ")
    end
    @player_board.place(ship, player_input)
  end


  turn = Turn.new(@computer_board, @player_board, @ships_computer, @ships_player)
  turn.take_turns
  turn.final_results
end
