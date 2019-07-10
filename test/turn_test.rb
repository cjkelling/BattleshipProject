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
    assert_instance_of Turn, @turn
  end

  def test_shot_coordinate_valid
    assert_equal false, @computer_board.valid_coordinate?(["D5"])
    assert_equal true, @computer_board.valid_coordinate?(["A3"])
  end

end
