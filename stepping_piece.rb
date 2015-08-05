class SteppingPiece < Piece

  def moves
    result = []
    x, y = position[0], position[1]
    positions = deltas.map { |row, col| [row + x, col + y] }
    
    positions.each do |pos|
      if Board.on_board?(pos)
        next if board[pos] && board[pos].color == color
        result << pos
      end
    end

    result
  end
end
