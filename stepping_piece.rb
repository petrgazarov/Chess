class SteppingPiece < Piece

  def moves
    result = []
    x, y = position[0], position[1]
    positions = deltas.map { |row, col| [row + x, col + y] }
    positions.each { |pos| result << pos unless board[pos] }
    result
  end
end
