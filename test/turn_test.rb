require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
  end

  def test_display_boards
    p "=============COMPUTER BOARD============="
    @computer_board.board_render


      @player_board.place(@submarine,["A1", "A2"])
    p "=============PLAYER BOARD============="
    @player_board.board_render
  end

end
