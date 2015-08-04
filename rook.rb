class Rook < SlidingPiece

  def deltas
    DELTAS_HORIZ_VERT
  end

  def to_s
    if color == :black
      "\u265C".encode('utf-8')
    else
      "\u2656".encode('utf-8')
    end
  end
end
