class Bishop < SlidingPiece

  def deltas
    DELTAS_DIAG
  end

  def to_s
    if color == :black
      "\u265D".encode('utf-8')
    else
      "\u2657".encode('utf-8')
    end
  end
end
