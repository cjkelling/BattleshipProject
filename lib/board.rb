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

  def valid_coordinate?(input)
    if @cells.keys.include?(input)
      true
    end
  end

  def valid_placement?(ship, coordinates)
    unless ship.length == coordinates.count
      return false
    end

    array_of_empties = coordinates.map do |coord|
      @cells[coord].empty?
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

  def render(playing = false)
    puts(
    "  1 2 3 4 \n" +
    "A . . . . \n" +
    "B . . . . \n" +
    "C . . . . \n" +
    "D . . . . \n"
    )

    if playing == true
      puts (
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
      )
    end
  end

  def computer_place
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

<<<<<<< HEAD
    coordinates_cruiser = @cells.keys.sample(3)

    # coordinates_sub = @cells.keys.slice(@cells.keys.sample.to_i, 2)


    # if valid_placement?(cruiser, coordinates_cruiser)
    #   place(cruiser, coordinates_cruiser)
    # end
    # #
    # # if valid_placement?(submarine, coordinates_sub)
    #   place(submarine, coordinates_sub)
    # # end
    p coordinates_cruiser
    # p coordinates_sub
  end
=======
    coordinates_cruiser = []
    coordinates_submarine = []

    loop do
      coordinates_cruiser = @cells.keys.sample(3)
      if valid_placement?(cruiser, coordinates_cruiser)
        place(cruiser, coordinates_cruiser)
        break
      end
    end

    loop do
      coordinates_submarine = @cells.keys.sample(2)
      if valid_placement?(submarine, coordinates_submarine)
        place(submarine, coordinates_submarine)
        break
      end
    end

  end

>>>>>>> cd1854e76fb6b9938685fcfdc84585688debf0ba
end
