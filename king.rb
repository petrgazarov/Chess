class King < SteppingPiece

  def deltas
    DELTAS_DIAG + DELTAS_HORIZ_VERT
  end

  def to_s
    if color == :black
      "\u265A".encode('utf-8')
    else
      "\u2654".encode('utf-8')
    end
  end
end
