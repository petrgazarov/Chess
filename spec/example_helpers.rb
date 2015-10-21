module ExampleHelpers
  def bishop_empty_board_positions
    [[0, 0], [1, 1], [2, 2], [4, 4], [5, 5], [6, 6], [7, 7],
     [0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0]]
  end

  def bishop_initial_setup_board_positions
    [[2, 2], [4, 4], [5, 5], [1, 5], [2, 4], [4, 2], [5, 1], [1, 1]]
  end

  def set_up_allow_for_piece(subject_piece, board, black_piece, white_piece)
    allow(subject_piece).to receive(:occupied?) do |pos|
      occupied = [[1, 1], [1, 5], [1, 3], [1, 2], [1, 4], [6, 0], [6, 6], [6, 3]]
      occupied.include?(pos) ? true : false
    end


    allow(black_piece).to receive(:same_color?) { |color| color == :black }
    allow(white_piece).to receive(:same_color?) { |color| color == :white }

    allow(board).to receive(:[]) do |pos|
      if [[1, 1], [1, 5], [1, 3], [1, 2], [1, 4]].include?(pos)
        black_piece
      elsif [[6, 0], [6, 6], [6, 3]].include?(pos)
        white_piece
      end
    end
  end
end
