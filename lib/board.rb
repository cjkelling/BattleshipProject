class Board
  attr_reader :cells

  def initialize
    @cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4'),
      }
  end

  def valid_coordinate?(input)
    if @cells.keys.include?(input) == true
      true
    end
  end

  def valid_placement?(ship, coordinates)
    array = []
    ship.length == coordinates.count
    coordinates.each do |coordinate|
      array << coordinate.chars
    end
  end

end

"Each given coordinate string needs to be broken down into its
individual letter and number. Then the rule needs to say
that the ship coordinates can only move 1 letter or 1 number away from the
original, but it can't change both. This will prevent diagonal
movement."
