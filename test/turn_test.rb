require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test

  def test_display_boards
    p "=============COMPUTER BOARD============="
    p "=============PLAYER BOARD============="
      "#{@player_board.render(true)}"
  end

end
