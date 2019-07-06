require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'pry'

class ComputerTest < Minitest::Test

  def test_place_ship
    @computer_board.place_pieces
    @computer_board.render(true)
  end

end
