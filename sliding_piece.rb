class SlidingPiece < Piece

  def moves
    result = []
    deltas.each do |delta|
      result += make_branch(delta)
    end

    result
  end

  def occupied?(pos)
    board[pos]
  end

  private

  def make_branch(delta)
    result = []
    1.upto(Board::SIZE - 1) do |idx|
      x = delta[0] * idx + position[0]
      y = delta[1] * idx + position[1]

      return result if !Board.on_board?([x, y])

      if board[[x, y]] && board[[x, y]].color == color
        return result
      elsif board[[x, y]] && board[[x, y]].color != color
        result << [x, y]
        return result
      end

      result << [x, y]
    end

    result
  end

end
