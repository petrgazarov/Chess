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
    result << [x + direction * 2, y] unless first == false ||
      occupied?([x + direction * 2, y])

    pawn_capture_deltas = [[direction, -1], [direction, 1]]
    pawn_capture_deltas.each do |delta|
      pos = [x + delta[0], y + delta[1]]
      result << pos if Board.on_board?(pos) &&
        occupied?(pos) &&
        board[pos].color != color
    end

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
