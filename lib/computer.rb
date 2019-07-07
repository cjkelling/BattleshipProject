class Computer
  attr_reader :computer_board

  def initialize
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def computer_place
    coordinates_cruiser = @computer_board.cells.keys.sample(3)
    coordinates_sub = @computer_board.cells.keys.sample(2)

    @computer_board.place(@cruiser, coordinates_cruiser)
    @computer_board.place(@submarine, coordinates_sub)
  end

end
