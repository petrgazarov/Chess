class SlidingPiece < Piece

  def moves
    result = []
    deltas.each do |delta|
      result += make_branch(delta)
    end

    result
  end

  private

  def make_branch(delta)
    result = []
    1.upto(Board::SIZE - 1) do |idx|
      pos = [(delta[0] * idx + position[0]), (delta[1] * idx + position[1])]

      return result if !Board.on_board?(pos)

      if occupied?(pos)
        result << pos if !board[pos].same_color?(color)
        return result
      end

      result << pos
    end

    result
  end
end
