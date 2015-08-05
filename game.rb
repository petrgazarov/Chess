class Game
  attr_accessor :board, :player_white, :player_black

  def initialize(name1, name2)
    @board = Board.new
    @player_white = HumanPlayer.new(name1)
    @player_black = HumanPlayer.new(name2)
  end


end
