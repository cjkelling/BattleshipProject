require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def setup
    @name = 'Cruiser'
    @length = 3
    @ship = Ship.new(@name, @length)
  end

  def test_ship_exists
    assert_instance_of Ship, @ship
  end

  def test_ship_attributes
    assert_equal 'Cruiser', @ship.name
    assert_equal 3, @ship.length
    assert_equal 3, @ship.health
  end

  def test_ship_sunk
    refute @ship.sunk?
    @ship.hit
    assert_equal 2, @ship.health
    @ship.hit
    assert_equal 1, @ship.health
    @ship.hit
    assert_equal 0, @ship.health
    assert @ship.sunk?
    @ship.hit
    assert_equal 0, @ship.health
  end

end
