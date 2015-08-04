
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

  def initialize(pos, board)
    @position = pos
    @board = board
  end

  def valid_moves
    moves.select do |pos|
      Board.on_board?(pos) &&
        !move_into_check?(pos)
    end
  end

  def move_into_check?(pos)

  end

  def moves

  end
end
