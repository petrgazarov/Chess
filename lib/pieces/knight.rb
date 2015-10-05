class Knight < SteppingPiece
  DELTAS = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def deltas
    DELTAS
  end

  def to_s
    if color == :black
      "\u265E".encode('utf-8')
    else
      "\u2658".encode('utf-8')
    end
  end
end
