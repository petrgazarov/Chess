class SteppingPiece < Piece

  def moves
    result = []
    x, y = position[0], position[1]
    positions = deltas.map { |row, col| [row + x, col + y] }
    positions.each { |pos| result << pos if board[pos].nil? }
    result
  end
end
