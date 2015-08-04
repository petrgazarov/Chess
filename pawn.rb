class Pawn < Piece
  attr_accessor :first

  def initialize(pos, board)
    @first = true
    super(pos, board)
  end

  def moves
    result = []
    x, y = position[0], position[1]
    result << [x - 1, y] unless occupied?([x - 1, y])
    result << [x - 2, y] unless first == false || occupied?([x - 2, y])
    result << [x - 1, y - 1] if occupied?([y - 1, x - 1])
    result << [x - 1, y + 1] if occupied?([y - 1, x + 1])
    self.first = false
    result
  end

  def occupied?(pos)
    board[pos]
  end
end
