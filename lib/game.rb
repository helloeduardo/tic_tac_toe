class Game
  attr_reader :players, :board

  def initialize(player1, player2)
    @players = [player1, player2]
    @board = Board.new
  end

  def current_player
    @players[0]
  end

  def switch_player
    @players.reverse!
  end

  def place_token(cell)
    if @board.valid_cell?(cell)
      @board.update(cell, current_player.token)
    else
      puts "Sorry, not a valid number. Please try again"
      switch_player
    end
  end

  def over?
    board.win? || board.draw?
  end



end
