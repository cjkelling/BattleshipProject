require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
    assert_instance_of Hash, @board.cells
  end

  def test_board_cells
    assert @board.cells
  end

  def test_valid_coordinates
    assert_equal true, @board.valid_coordinate?('A1')
    refute_equal true, @board.valid_coordinate?('A5')
  end

end
