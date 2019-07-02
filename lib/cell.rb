class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !fired_upon? && !empty?
      @ship.hit
    end
    @fired_upon = true
  end

  def render(occupied = false)
    if !empty? && occupied == true
      @render = "S"
    elsif !fired_upon? && empty?
      @render = "."
    elsif fired_upon? && empty?
      @render = "M"
    elsif fired_upon? && !empty? && @ship.health == 0
      @render = "X"
    elsif fired_upon? && !empty?
      @render = "H"
    end
  end
end
