require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def setup
    @computer_board = Board.new
    @player_board = Board.new
    @turn = Turn.new(@computer_board, @player_board, @ships_computer, @ships_player)

    @ships_computer = []
    @ships_player = []
    @ships_computer << @cruiser = Ship.new("Cruiser", 3)
    @ships_computer << @submarine = Ship.new("Submarine", 2)
    @ships_player << @cruiser = Ship.new("Cruiser", 3)
    @ships_player << @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of @turn, Turn.new(@computer_board, @player_board, @ships_computer, @ships_player)
  end

  def test_display_boards
    assert_equal ("  1 2 3 4 \n" +
"A . . . . \n" +
"B . . . . \n" +
"C . . . . \n" +
"D . . . . \n"), @computer_board.board_render
  end

end
