class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"), +
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"), +
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"), +
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(inputs)
    inputs.all? do |input|
      @cells.keys.include?(input)
    end
  end

  def valid_placement?(ship, coordinates)
    unless ship.length == coordinates.count
      return false
    end

    array_of_empties = coordinates.map do |coord|
      @cells[coord].cell_empty?
    end

    if array_of_empties.include?(false)
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

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def board_render(playing = false)
    if playing == false
      puts (
        "  1 2 3 4 \n"
        "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n"
        "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n"
        "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n"
        "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
      )
      puts (
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
      )
  end

  def computer_place(ship)
    coordinates_ship = []

    loop do
      coordinates_ship = @cells.keys.sample(ship.length)
      if valid_placement?(ship, coordinates_ship)
        place(ship, coordinates_ship)
        break
      end
    end
  end

end
