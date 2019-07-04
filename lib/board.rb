class Board
  attr_reader :cells

  def initialize
    @cells = {
      'A1' => Cell.new('A1'), 'A2' => Cell.new('A2'), 'A3' => Cell.new('A3'), 'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'), 'B2' => Cell.new('B2'), 'B3' => Cell.new('B3'), 'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'), 'C2' => Cell.new('C2'), 'C3' => Cell.new('C3'), 'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'), 'D2' => Cell.new('D2'), 'D3' => Cell.new('D3'), 'D4' => Cell.new('D4'),
      }
  end

  def valid_coordinate?(input)

    if @cells.keys.include?(input) == true
      true
    end

  end

  def valid_placement?(ship, coordinates)

    unless ship.length == coordinates.count
      return false
    end

    row_array = []
    column_array = []

    coordinates.each do |cooradate|
      array = cooradate.chars
      row_array << array[0].ord
      column_array << array[1].to_i
    end

    row_array.sort!
    column_array.sort!

    if row_array.uniq.length == 1
      return validate_array?(column_array)
    end

    if column_array.uniq.length == 1
      return validate_array?(row_array)
    end

  end

  def validate_array?(array)
      start = array.first
      range = (start..start + array.length - 1)
      array == range.to_a
  end

end
