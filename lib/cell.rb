class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def cell_empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !fired_upon? && !cell_empty?
      @ship.hit
    end
    @fired_upon = true

  end

  def render(show_ship = false)
    if !fired_upon? && cell_empty?
      @render = "."
    elsif show_ship == true && !cell_empty?
      @render ="S"
    elsif !fired_upon? && !cell_empty?
      @render = "."
    elsif fired_upon? && cell_empty?
      @render = "M"
    elsif fired_upon? && !cell_empty? && @ship.health == 0
      @render = "X"
    elsif fired_upon? && !cell_empty?
      @render = "H"
    end
  end

end
