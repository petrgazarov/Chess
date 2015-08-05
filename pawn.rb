class Pawn < Piece

  attr_reader :first_pos

  def initialize(pos, board, color)
    @first_pos = pos.dup
    super(pos, board, color)
  end

  def moves
    result = []
    direction = (color == :black ? 1 : -1)

    result += normal_moves(direction)
    result += capture_moves(direction)

    result
  end

  def normal_moves(direction)
    x, y = position
    result = []

    result << [x + direction, y] unless occupied?([x + direction, y])
    result << [x + direction * 2, y] unless first_pos != position ||
      occupied?([x + direction * 2, y])

    result
  end

  def capture_moves(direction)
    x, y = position
    result = []

    pawn_capture_deltas = [[direction, -1], [direction, 1]]
    pawn_capture_deltas.each do |delta|
      pos = [x + delta[0], y + delta[1]]
      result << pos if Board.on_board?(pos) &&
        occupied?(pos) &&
        !same_color?(board[pos].color)
    end

    result
  end

  def to_s
    if color == :black
      "\u265F".encode('utf-8')
    else
      "\u2659".encode('utf-8')
    end
  end
end
