require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def setup
    @name = "Cruiser"
    @length = 3
    @ship = Ship.new(@name, @length)
  end

  def test_ship_exists
    assert_instance_of Ship, @ship
  end

  def test_ship_attributes
    assert_equal "Cruiser", @ship.name
    assert_equal 3, @ship.length
    assert_equal 3, @ship.health
  end

  def test_ship_sunk
    refute @ship.sunk?
    @ship.hit
    @ship.hit
    @ship.hit
    assert @ship.sunk?
  end


end
