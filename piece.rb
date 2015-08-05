class Piece
  DELTAS_DIAG = [[-1, -1],
                 [-1,  1],
                 [ 1, -1],
                 [ 1,  1]
               ]

  DELTAS_HORIZ_VERT = [[-1,  0],
                       [ 0, -1],
                       [ 0,  1],
                       [ 1,  0]
                     ]

  attr_accessor :position, :board
  attr_reader :color

  def initialize(pos, board, color)
    @position = pos
    @board = board
    @color = color
  end

  def valid_moves
    moves.select do |pos|
      !move_into_check?(pos)
    end
  end

  def move_into_check?(pos)
    new_board = board.dup
    new_board.move!(position, pos)
    new_board.in_check?(color)
  end
end
