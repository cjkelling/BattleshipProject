class Cell
  attr_reader :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def block
    block = nil
    if Ship == @coordinate
      block << Ship
    end
  end

end
