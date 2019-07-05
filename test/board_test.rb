require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
    assert_instance_of Hash, @board.cells
    assert_instance_of Ship, @cruiser
    assert_instance_of Ship, @submarine
  end

  def test_board_cells
    assert @board.cells
  end

  def test_valid_coordinates
    assert @board.valid_coordinate?('A1')
    assert @board.valid_coordinate?('D4')
    refute @board.valid_coordinate?('A5')
    refute @board.valid_coordinate?('E1')
    refute @board.valid_coordinate?('A22')
  end

  def test_valid_placement
    refute @board.valid_placement?(@cruiser, ['A1', 'A2'])
    refute @board.valid_placement?(@submarine, ['A2', 'A3', 'A4'])
    assert @board.valid_placement?(@submarine, ['C2', 'C3'])
  end

  def test_coordinates_consecutive
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A1", "C1"])
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
  end

end
