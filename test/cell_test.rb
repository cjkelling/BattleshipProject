require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @name = "Cruiser"
    @length = 3
    @ship = Ship.new(@name, @length)
    @coordinate = "B4"
    @cell = Cell.new(@coordinate)
  end

  def test_empty_cell_attributes
    assert_equal "B4", @cell.coordinate
    assert_nil @cell.ship
    assert @cell.empty?
    refute @cell.fired_upon?
  end

  def test_place_ship
    @cell.place_ship(@ship)
    refute @cell.empty?
    assert_instance_of Ship, @cell.ship
  end

  def test_fired_upon
    @cell.place_ship(@ship)
    @cell.fire_upon
    assert_equal 2, @ship.health
    assert @cell.fired_upon?
  end

end
