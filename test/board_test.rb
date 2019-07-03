require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
    assert_instance_of Hash, @board.cells
  end

  def test_board_cells
    assert @board.cells
  end

  def test_valid_coordinate
    assert_equal true, @board.valid_coordinate?('A1')
    refute_equal true, @board.valid_coordinate?('D5')
  end

  def test_valid_placement
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

end
