require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
<<<<<<< HEAD
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
=======
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
>>>>>>> 8f5362021e70e494aefe38653a334d0682cd4598
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

<<<<<<< HEAD
  def test_valid_coordinates
=======
  def test_valid_coordinate
>>>>>>> 8f5362021e70e494aefe38653a334d0682cd4598
    assert @board.valid_coordinate?('A1')
    assert @board.valid_coordinate?('D4')
    refute @board.valid_coordinate?('A5')
    refute @board.valid_coordinate?('E1')
    refute @board.valid_coordinate?('A22')
  end

<<<<<<< HEAD
  def test_valid_placement
    refute @board.valid_placement?(@cruiser, ['A1', 'A2'])
    refute @board.valid_placement?(@submarine, ['A2', 'A3', 'A4'])
    assert @board.valid_placement?(@submarine, ['C2', 'C3'])
=======
  def test_valid_length
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert @board.valid_placement?(@submarine, ["C2", "C3"])
>>>>>>> 8f5362021e70e494aefe38653a334d0682cd4598
  end

  def test_coordinates_consecutive
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A1", "C1"])
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
<<<<<<< HEAD
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
=======
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
>>>>>>> 8f5362021e70e494aefe38653a334d0682cd4598
  end

end
