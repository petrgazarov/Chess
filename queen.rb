class Queen < SlidingPiece

  def deltas
    DELTAS_DIAG + DELTAS_HORIZ_VERT
  end
end
