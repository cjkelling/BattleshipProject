class Computer
  attr_reader :computer_board

  def initialize
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @sub = Ship.new("Submarine", 2)
  end

  def place_pieces
    keys = @computer_board.cells.keys
    @computer_board.place(@cruiser, keys.rand)
    @computer_board.place(@sub, keys.rand)
  end

end
