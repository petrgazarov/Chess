class SteppingPiece < Piece

  def moves
    x, y = position[0], position[1]
    DELTAS.map do |row, col|
      [row + x, col + y]
    end
  end

end
