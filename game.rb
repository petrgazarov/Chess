class Game
  attr_accessor :board, :player_white, :player_black, :current_player

  def initialize(name1, name2)
    @board = Board.new
    @player_white = HumanPlayer.new(name1)
    @player_black = HumanPlayer.new(name2)
    @current_player = player_white
  end

  def switch_players
    if current_player == player_white
      self.current_player = player_black
    else
      self.current_player = player_white
    end
  end

  def play
    until won?
      play_turn
    end
    declare_winner
  end

  def play_turn

    switch_players
  end

  def declare_winner
    switch_players
    puts "#{current_player} wins!"
  end
end
