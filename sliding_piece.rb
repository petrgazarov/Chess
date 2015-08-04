class SlidingPiece < Piece
  DELTAS_DIAG = SlidingPiece.generate_digonals

  DELTAS_HORIZ_VERT = SlidingPiece.generate_horiz_vert

  def self.generate_digonals
    result = []
    1.upto(Board::SIZE - 1) do |idx|
      result += [[idx, idx], [idx, -idx], [-idx, idx], [-idx, -idx]]
    end
    result
  end

  def self.generate_horiz_vert
    result = []
    1.upto(Board::SIZE - 1) do |idx|
      result += [[idx, 0], [-idx, 0], [0, idx], [0, -idx]]
    end
    result
  end

  def moves
    move_dirs
  end


end
