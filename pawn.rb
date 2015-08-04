class Pawn < Piece
  attr_accessor :first

  def initialize
    @first = true
    super
  end

  def moves
    result = []
    result << [pos[0], pos[1] + 1] unless occupied?([pos[0], pos[1] + 1])
    result << [pos[0] - 1, pos[1] - 1] unless occupied?()
  end

  def occupied?(pos)
    board[pos]
  end
end
