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

  def declare_expect_for_populating_board(grid, color)
      row = color == :white ? 7 : 0
      pawn_row = color == :white ? 6 : 1

      grid[pawn_row].each do |pawn|
      expect(pawn).to be_a(Pawn)
    end
    grid[row].each_with_index do |piece, idx|
      expect(piece).to be_a(Rook) if idx == 0 || idx == 7
      expect(piece).to be_a(Knight) if idx == 1 || idx == 6
      expect(piece).to be_a(Bishop) if idx == 2 || idx == 5
      expect(piece).to be_a(Queen) if idx == 3
      expect(piece).to be_a(King) if idx == 4
    end
  end

  def declare_expect_for_dupped_board(orig_board, dupp_board, check_pieces_dup = true)
    # expects grid to be a square matrix

    0.upto(orig_board.grid.length - 1) do |row|
      0.upto(orig_board.grid[0].length - 1) do |col|
        orig_board_cell = orig_board.grid[row][col]
        dup_board_cell = dupp_board.grid[row][col]

        if orig_board_cell.nil?
          return false if !dup_board_cell.nil?
        elsif check_pieces_dup
          return false if orig_board_cell == dup_board_cell
        elsif orig_board_cell.class != dup_board_cell.class           ||
                orig_board_cell.position != dup_board_cell.position   ||
                orig_board_cell.color != dup_board_cell.color
          return false
        end

        true
      end
    end
  end

  def board_in_check(checkmate = false)
    board = Board.new
    grid = board.grid

    [[0, 4], [0, 5], [1, 2], [7, 2], [7, 3], [1, 6], [6, 7]].each do |row, col|
      grid[row][col] = nil
    end
    grid[2][2] = Pawn.new([2, 2], board, :black)
    grid[2][6] = Pawn.new([2, 6], board, :black)
    grid[2][7] = Bishop.new([2, 7], board, :black)
    grid[6][3] = Queen.new([6, 3], board, :black)

    grid[5][1] = Pawn.new([5, 1], board, :white)
    grid[4][3] = Pawn.new([4, 3], board, :white)
    grid[5][7] = Pawn.new([5, 7], board, :white)

    if checkmate
      grid[7][1] = nil
      grid[5][0] = Knight.new([5, 0], board, :white)
    end

    board
  end

  def board_before_check
    board = Board.new
    grid = board.grid

    [[0, 3], [1, 2]].each { |row, col| grid[row][col] = nil }
    grid[2][2] = Pawn.new([2, 2], board, :black)
    grid[3][0] = Queen.new([3, 0], board, :black)

    board
  end
end
