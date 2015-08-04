class SlidingPiece < Piece

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
    result = []
    deltas.each do |branch|
      result += check_branch(branch)
    end

    result
  end

  def occupied?(pos)
    board[pos]
  end

  private

  def check_branch(branch)
    result = []
    branch.each do |pos|
      return result if board[pos]
      result << pos
    end

    result
  end

end
