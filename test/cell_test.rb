require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @coordinate = "B4"
    @cell = Cell.new(@coordinate)
  end

  def test_cell_exists
    assert_instance_of Cell, @cell
  end

  def test_cell_attributes
    assert_equal @coordinate, @cell.coordinate
    assert_equal nil, @cell.ship
    assert @cell.empty?
  end

end
