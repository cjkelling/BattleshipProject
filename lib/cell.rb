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

  def fire_upon
    ship = Ship.new(name, health)
    @ship << ship
    @ship.health -= 1
  end

  def fired_upon?
    if @cell.fire_upon
      true
    end
  end

end
