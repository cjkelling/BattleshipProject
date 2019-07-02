class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @cell == nil
  end

  def place_ship(ship)
    @ship = ship
    @cell = @ship
  end

end
