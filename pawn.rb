class Pawn < Piece
  attr_accessor :first

  def initialize(pos, board, color)
    @first = true
    super(pos, board, color)
  end

  def moves
    result = []
    x, y = position[0], position[1]
    color == :black ? direction = 1 : direction = -1
    result << [x + direction, y] unless occupied?([x + direction, y])
    result << [x + direction * 2, y] unless first == false || occupied?([x + direction * 2, y])
    result << [x + direction, y - 1] if occupied?([x + direction, y - 1])
    result << [x + direction, y + 1] if occupied?([x + direction, y + 1])
    self.first = false
    result
  end

  def occupied?(pos)
    board[pos]
  end

  def to_s
    if color == :black
      "\u265F".encode('utf-8')
    else
      "\u2659".encode('utf-8')
    end
  end
end
