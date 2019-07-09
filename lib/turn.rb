class Turn

  def initialize(computer_board, player_board, ships_computer, ships_player)
    @computer_board = computer_board
    @player_board = player_board
    @ships_computer = ships_computer
    @ships_player = ships_player
  end

  def take_turns
    loop do
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

      if @ships_computer.find_all {|ship| ship.health > 0}.length == 0
        return "player"
      end

      computer_options = @player_board.cells.keys
      computer_guess = computer_options.sample(1)
      computer_options.delete(computer_guess[0])

      @player_board.cells[computer_guess[0]].fire_upon
      @player_board.cells[computer_guess[0]].render

      if @ships_player.find_all {|ship| ship.health > 0}.length == 0
        return "computer"
      end

      if @player_board.cells[computer_guess[0]].render == "M"
        puts "The computer's shot on #{computer_guess[0]} was a miss."
      elsif @player_board.cells[computer_guess[0]].render == "H"
        puts "The computer's shot on #{computer_guess[0]} was a hit."
      elsif @player_board.cells[computer_guess[0]].render == "X"
        puts "The computer's shot on #{computer_guess[0]} was a hit and sunk your ship."
      end

      if @computer_board.cells[player_guess].render == "M"
        puts "Your shot on #{player_guess} was a miss."
      elsif @computer_board.cells[player_guess].render == "H"
        puts "Your shot on #{player_guess} was a hit."
      elsif @computer_board.cells[player_guess].render == "X"
        puts "Your shot on #{player_guess} was a hit and sunk the computer's ship."
      end
      puts ""
      puts ""
    end
  end
end
