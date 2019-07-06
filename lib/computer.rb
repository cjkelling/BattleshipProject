class Computer

  @computer_board = Board.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)

  def computer_place
    coordinate = @computer_board.cells.keys.sample

    @computer_board.cells[coordinate].place_ship(@cruiser)
    @computer_board.cells[coordinate].place_ship(@submarine)
  end

end
