class Queen < SlidingPiece

  def deltas
    DELTAS_DIAG + DELTAS_HORIZ_VERT
  end

  def to_s
    if color == :black
      "\u265B".encode('utf-8')
    else
      "\u2655".encode('utf-8')
    end
  end
end
