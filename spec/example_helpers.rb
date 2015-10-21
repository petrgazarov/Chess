module ExampleHelpers
  # Below possible moves are for a white piece.
  # Assume piece position [3, 3] unless noted otherwise.
  def bishop_empty_board_moves
    [[0, 0], [1, 1], [2, 2], [4, 4], [5, 5], [6, 6], [7, 7],
     [0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0]]
  end

  def bishop_initial_setup_board_moves
    [[2, 2], [4, 4], [5, 5], [1, 5], [2, 4], [4, 2], [5, 1], [1, 1]]
  end

  def king_empty_board_moves
    [[2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]]
  end

  # piece position [5, 2]
  def king_initial_setup_board_moves
    [[5, 1], [4, 1], [4, 2], [4, 3], [5, 3]]
  end

  def knight_empty_board_moves
    [[1, 2], [1, 4], [2, 1], [4, 1], [5, 2], [5, 4], [4, 5], [2, 5]]
  end

  def knight_initial_setup_board_moves
    [[1, 2], [1, 4], [2, 1], [4, 1], [5, 2], [5, 4], [4, 5], [2, 5]]
  end

  def pawn_empty_board_moves
    [[2, 3]]
  end

  def pawn_initial_setup_board_moves
    [[1, 2], [1, 4]]
  end

  def queen_empty_board_moves
    rook_empty_board_moves + bishop_empty_board_moves
  end

  def queen_initial_setup_board_moves
    rook_initial_setup_board_moves + bishop_initial_setup_board_moves
  end

  def rook_empty_board_moves
    [[2, 3], [1, 3], [0, 3], [4, 3], [5, 3], [6, 3], [7, 3],
     [3, 2], [3, 1], [3, 0], [3, 4], [3, 5], [3, 6], [3, 7]]
  end

  def rook_initial_setup_board_moves
    [[2, 3], [1, 3], [4, 3], [5, 3], [3, 2], [3, 1],
     [3, 0], [3, 4], [3, 5], [3, 6], [3, 7]]
  end

  def set_up_allow_for_piece(subject_piece, board, black_piece, white_piece)
    allow(subject_piece).to receive(:occupied?) do |pos|
      occupied = [
        [1, 1], [1, 5], [1, 3], [1, 2], [1, 4], [6, 0], [6, 6], [6, 3], [6, 1], [6, 2]
      ]
      occupied.include?(pos) ? true : false
    end

    allow(black_piece).to receive(:same_color?) { |color| color == :black }
    allow(white_piece).to receive(:same_color?) { |color| color == :white }

    allow(board).to receive(:[]) do |pos|
      if [[1, 1], [1, 5], [1, 3], [1, 2], [1, 4]].include?(pos)
        black_piece
      elsif [[6, 0], [6, 6], [6, 3], [6, 1], [6, 2]].include?(pos)
        white_piece
      end
    end
  end

  def set_up_allow_for_pawn(pawn, black_piece, white_piece)
    allow(black_piece).to receive(:color).and_return(:black)
    allow(white_piece).to receive(:color).and_return(:white)
    allow(pawn).to receive(:first_pos).and_return []
  end
end
