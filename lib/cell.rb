class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def ship
    @ship
    
  end

  def empty?
    Cell.empty?
    if @ship != nil
      Cell.empty?
    end
  end

end
