class SteppingPiece < Piece

  def moves
    result = []
    x, y = position
    positions = deltas.map { |row, col| [row + x, col + y] }

    positions.each do |pos|
      if Board.on_board?(pos)
        next if occupied?(pos) && board[pos].same_color?(color)
        result << pos
      end
    end

    result
  end
end
