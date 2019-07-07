require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class ComputerTest < Minitest::Test

  def setup
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_place_ship
    @computer_board.computer_place
    @computer_board.render(true)
  end

end
