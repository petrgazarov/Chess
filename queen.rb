class Queen < SlidingPiece



  def move_dirs
    DELTAS_DIAG + DELTAS_HORIZ_VERT
  end

end
