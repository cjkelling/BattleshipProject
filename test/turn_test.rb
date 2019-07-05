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

    @ships_computer = []
    @ships_player = []
    @ships_computer << @cruiser = Ship.new("Cruiser", 3)
    @ships_computer << @submarine = Ship.new("Submarine", 2)
    @ships_player << @cruiser = Ship.new("Cruiser", 3)
    @ships_player << @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @computer_board
    assert_instance_of Board, @player_board
  end

  def test_display_boards
    assert_equal
  end

end
