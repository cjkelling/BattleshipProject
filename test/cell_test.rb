require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @name = "Cruiser"
    @length = 2
    @ship = Ship.new(@name, @length)
    @coordinate = "B4"
    @coordinate_2 = "C3"
    @cell = Cell.new(@coordinate)
    @cell_2 = Cell.new(@coordinate_2)
  end

  def test_empty_cell_attributes
    assert_equal "B4", @cell.coordinate
    assert_nil @cell.ship
    assert @cell.cell_empty?
    refute @cell.fired_upon?
  end

  def test_place_ship
    @cell.place_ship(@ship)
    refute @cell.cell_empty?
    assert_instance_of Ship, @cell.ship

    @cell_2.place_ship(@ship)
    refute @cell_2.cell_empty?
    assert_instance_of Ship, @cell_2.ship
  end

  def test_fired_upon
    @cell.place_ship(@ship)
    @cell.fire_upon
    assert_equal 1, @ship.health
    assert @cell.fired_upon?
  end

  def test_cell_render

    assert_equal '.', @cell.render
    @cell.fire_upon
    assert_equal 'M', @cell.render
    assert_equal '.', @cell_2.render
  end

  def test_ship_placed_and_hit
    @cell.place_ship(@ship)
    @cell_2.place_ship(@ship)
    assert_equal 'S', @cell_2.render(true)
    @cell_2.fire_upon
    assert_equal 'H', @cell_2.render(true)
    assert_equal false, @ship.sunk?
    @cell.fire_upon
    assert_equal 'X', @cell.render(true)
    assert_equal true, @ship.sunk?
  end

end
