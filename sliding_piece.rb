class SlidingPiece < Piece
  DELTAS_DIAG = SlidingPiece.generate_diags

  DELTAS_HORIZ_VERT = SlidingPiece.generate_horiz_vert

  def self.generate_diags
    result = [[],[],[],[]]
    1.upto(Board::SIZE - 1) do |idx|
      result[0] << [idx, idx]
      result[1] << [idx, -idx]
      result[2] << [-idx, idx]
      result[3] << [-idx, -idx]
    end
    result
  end

  def self.generate_horiz_vert
    result = [[],[],[],[]]
    1.upto(Board::SIZE - 1) do |idx|
      result[0] << [idx, 0]
      result[1] << [-idx, 0]
      result[2] << [0, idx]
      result[3] << [0, -idx]
    end
    result
  end

  def moves
    x, y = position[0], position[1]
    move_dirs.map do |row, col|
      [row + x, col + y]
    end
  end

  def occupied?(pos)
    board[pos]
  end

  private

  def check_branch

  end

end
