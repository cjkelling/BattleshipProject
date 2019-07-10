class Turn

  def initialize(computer_board, player_board, ships_computer, ships_player)
    @computer_board = computer_board
    @player_board = player_board
    @ships_computer = ships_computer
    @ships_player = ships_player

    @computer_options = @player_board.cells.keys
  end

  def all_ships_sunk?
    @ships_computer.all? {|ship| ship.sunk?} || @ships_player.all? {|ship| ship.sunk?}
  end

  def take_turns
    until all_ships_sunk?
      puts ""
      puts "=============COMPUTER BOARD============="
      @computer_board.board_render
      puts ""
      puts "=============PLAYER BOARD============="
      @player_board.board_render(true)
      puts ""

      ready_to_fire = false
      player_guess = nil
      while !ready_to_fire
        puts "Enter the coordinate for your shot:"
        player_guess = gets.chomp.upcase
        if !@computer_board.valid_coordinate?([player_guess])
          puts "Please choose a valid coordinate:"
        elsif @computer_board.cells[player_guess].fired_upon?
          puts "You have already fired on this cell. Please choose another cell:"
        else
          ready_to_fire = true
        end
      end

      @computer_board.cells[player_guess].fire_upon
      @computer_board.cells[player_guess].render(true)


      @computer_guess = @computer_options.sample
      @computer_options.delete(@computer_guess)

      @player_board.cells[@computer_guess].fire_upon
      @player_board.cells[@computer_guess].render

      if @player_board.cells[@computer_guess].render == "M"
        puts "The computer's shot on #{@computer_guess} was a miss."
      elsif @player_board.cells[@computer_guess].render == "H"
        puts "The computer's shot on #{@computer_guess} was a hit."
      elsif @player_board.cells[@computer_guess].render == "X"
        puts "The computer's shot on #{@computer_guess} was a hit and sunk your ship."
      end

      if @computer_board.cells[player_guess].render == "M"
        puts "Your shot on #{player_guess} was a miss."
      elsif @computer_board.cells[player_guess].render == "H"
        puts "Your shot on #{player_guess} was a hit."
      elsif @computer_board.cells[player_guess].render == "X"
        puts "Your shot on #{player_guess} was a hit and sunk the computer's ship."
      puts ""
      puts ""
    end
    end
  end


  def final_results
    puts ""
    puts "=============COMPUTER BOARD============="
    @computer_board.board_render(true)
    puts ""
    puts "=============PLAYER BOARD============="
    @player_board.board_render(true)
    puts ""
    if @ships_computer.find_all {|ship| ship.health > 0}.length == 0
      puts "You sunk all the computers ships. You win!"
    elsif @ships_player.find_all {|ship| ship.health > 0}.length == 0
      puts "The computer sunk all your ships. It won!"
    end
  end

end
