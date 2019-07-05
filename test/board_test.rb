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
    @computer_board = Board.new
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

  def test_valid_coordinate
    assert @board.valid_coordinate?('A1')
    assert @board.valid_coordinate?('D4')
    refute @board.valid_coordinate?('A5')
    refute @board.valid_coordinate?('E1')
    refute @board.valid_coordinate?('A22')
  end

  def test_valid_length
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert @board.valid_placement?(@submarine, ["C2", "C3"])
  end

  def test_coordinates_consecutive
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A1", "C1"])
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_place_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert cell_1, cell_1.ship
    assert cell_2, cell_2.ship
    assert cell_3, cell_3.ship
    assert cell_1.ship == cell_2.ship && cell_3.ship
  end

  def test_overlapping_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])

    refute @board.valid_placement?(@submarine, ["A1", "B1"])
    assert @board.valid_placement?(@submarine, ["B1", "C1"])
  end

  # def test_render
  #   @board.place(@cruiser, ["A1", "A2", "A3"])
  #   @board.render
  #   @board.render(true)
  #   @board.cells["A1"].fire_upon
  #   @board.render(true)
  #   @board.cells["A2"].fire_upon
  #   @board.cells["A3"].fire_upon
  #   @board.render(true)
  #   @board.cells["D3"].fire_upon
  #   @board.render(true)
  # end

  def test_place_computer_ship
    @computer_board.computer_place
    @computer_board.render(true)
  end

  def test_place_ship
    @computer_board.computer_place
    @computer_board.render(true)
  end

end
