class Turn
  attr_reader :board

def intiialize
  @board = board
end

def render_name
  if @board.cells.render == "M"
    puts "was a miss"
  elsif @board.cells.render == "H"
    puts "was a hit"
  elsif @board.cells.render == "X"
    puts "sunk their #{ship.name}"
  end
end

end
