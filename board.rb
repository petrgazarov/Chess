class Board
  SIZE = 8
  PIECE_ORDER = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

  def self.on_board?(pos)
    pos.all? { |coord| coord.between?(0, SIZE - 1) }
  end

  attr_accessor :grid

  def initialize(should_populate = true)
    @grid = Array.new(SIZE) { Array.new(SIZE) }
    [:white, :black].each { |color| populate(color) } if should_populate
  end

  def populate(color)
    row = (color == :white ? 7 : 0)
    pawn_row = (color == :white ? 6 : 1)

    (0...SIZE).each do |idx|
      self[[pawn_row, idx]] = Pawn.new([pawn_row, idx], self, color)
    end

    PIECE_ORDER.each_with_index do |piece_class, column|
      pos = [row, column]
      self[pos] = piece_class.new(pos, self, color)
    end
  end

  def render(cursor_pos = nil)
    system "clear" or system "cls"
    (0...SIZE).each do |x|
      (0...SIZE).each do |y|
        if self[[x, y]]
          space = " #{self[[x, y]].to_s} "
        else
          space = "   "
        end
        if [x, y] == cursor_pos
          print space.on_red
        elsif (x.even? && y.even?) || (x.odd? && y.odd?)
          print space
        else
          print space.on_white
        end
        print "\n" if y == SIZE - 1
      end
    end
  end

  def in_check?(color)
    king_pos = find_piece_on_board(King, color)
    find_vulnerability(king_pos, color)
  end

  def move(player_color, start_pos, end_pos)
    raise MoveError.new("No piece on starting position!") unless self[start_pos]

    moves = self[start_pos].moves
    if start_pos == end_pos
      raise MoveError.new("You must move your piece!")
    elsif !moves.include?(end_pos)
      raise MoveError.new("That piece can't move there!")
    elsif self[start_pos].move_into_check?(end_pos)
      raise MoveError.new("That move would put you in check!")
    elsif !self[start_pos].same_color?(player_color)
      raise MoveError.new("You can only move pieces of your color!")
    end

    move!(start_pos, end_pos)
  end

  def move!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].position = end_pos
    self[start_pos] = nil
  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    self.grid[pos[0]][pos[1]] = value
  end

  def dup
    new_board = Board.new(false)
    pieces.each { |piece| new_board[piece.position] = piece.dup(new_board) }
    new_board
  end

  def find_piece_on_board(piece, color)
    pieces.each do |piece_on_board|
      if piece_on_board.is_a?(piece) && piece_on_board.same_color?(color)
        return piece_on_board.position
      end
    end
    false
  end

  def find_vulnerability(pos, color)
    pieces.each do |piece|
      return true if !piece.same_color?(color) && piece.moves.include?(pos)
    end
    false
  end

  def checkmate?(color)
    result = []
    pieces.each { |piece| result += piece.valid_moves if piece.same_color?(color) }
    result.empty?
  end

  def pieces
    grid.flatten.compact
  end
end

class MoveError < StandardError
end
