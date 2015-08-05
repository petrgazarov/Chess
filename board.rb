class Board
  SIZE = 8

  def self.on_board?(pos)
    pos.all? { |coord| coord.between?(0, SIZE - 1) }
  end

  attr_accessor :grid

  def initialize(grid = nil)
    if grid
      @grid = grid
    else
      @grid = Array.new(SIZE) { Array.new(SIZE) }
      populate
    end
  end

  def populate
    populate_white
    populate_black
  end

  def populate_white
    (0...SIZE).each do |idx|
      self[[SIZE - 2, idx]] = Pawn.new([SIZE - 2, idx], self, :white)
    end

    self[[SIZE - 1, 0]] = Rook.new([SIZE - 1, 0], self, :white)
    self[[SIZE - 1, 7]] = Rook.new([SIZE - 1, 7], self, :white)
    self[[SIZE - 1, 2]] = Bishop.new([SIZE - 1, 2], self, :white)
    self[[SIZE - 1, 5]] = Bishop.new([SIZE - 1, 5], self, :white)
    self[[SIZE - 1, 1]] = Knight.new([SIZE - 1, 1], self, :white)
    self[[SIZE - 1, 6]] = Knight.new([SIZE - 1, 6], self, :white)
    self[[SIZE - 1, 3]] = Queen.new([SIZE - 1, 3], self, :white)
    self[[SIZE - 1, 4]] = King.new([SIZE - 1, 4], self, :white)
  end

  def populate_black
    (0..7).each do |idx|
      self[[1, idx]] = Pawn.new([1, idx], self, :black)
    end

    self[[0, 0]] = Rook.new([0, 0], self, :black)
    self[[0, 7]] = Rook.new([0, 7], self, :black)
    self[[0, 2]] = Bishop.new([0, 2], self, :black)
    self[[0, 5]] = Bishop.new([0, 5], self, :black)
    self[[0, 1]] = Knight.new([0, 1], self, :black)
    self[[0, 6]] = Knight.new([0, 6], self, :black)
    self[[0, 3]] = Queen.new([0, 3], self, :black)
    self[[0, 4]] = King.new([0, 4], self, :black)
  end

  def render
    iterate_through_board do |x, y|
      if self[[x, y]]
        space = " #{self[[x, y]].to_s} "
      else
        space = "   "
      end
      if (x.even? && y.even?) || (x.odd? && y.odd?)
        print space
      else
        print space.on_white
      end
      print "\n" if y == SIZE - 1
    end
  end

  def in_check?(color)
    king_pos = find_piece_on_board(King, color)
    find_vulnerability(king_pos, color)
  end

  def move(start_pos, end_pos)
    raise MoveError.new("No piece on starting position!") unless self[start_pos]

    moves = self[start_pos].moves
    if !moves.include?(end_pos)
      raise MoveError.new("That piece can't move there!")
    elsif self[start_pos].move_into_check?(end_pos)
      raise MoveError.new("That move would put you in check!")
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
    new_board = Board.new

    grid.each_with_index do |row, x|
      row.each_with_index do |square, y|
        if square
          new_board[[x, y]] = square.dup
          new_board[[x, y]].position = square.position.dup
          new_board[[x, y]].board = new_board
        else
          new_board[[x, y]] = nil
        end
      end
    end

    new_board
  end

  # def assign_duped_board
  #   grid.each do |row|
  #     row.each do |square|
  #       square ? square.board = self : nil
  #     end
  #   end
  #   self
  # end

  def find_piece_on_board(piece, color)
    iterate_through_board do |x, y|
      if self[[x, y]].is_a?(piece) && self[[x, y]].color == color
        return [x, y]
      end
    end
    false
  end

  def find_vulnerability(pos, color)
    iterate_through_board do |x, y|
      if self[[x,y]] &&
          self[[x, y]].color != color &&
          self[[x, y]].moves.include?(pos)
        return true
      end
    end
    false
  end

  def iterate_through_board(&prc)
    (0...SIZE).each do |x|
      (0...SIZE).each do |y|
        prc.call(x, y)
      end
    end
    nil
  end

  def checkmate?(color)
    iterate_through_board do |x, y|
  end

end

class MoveError < StandardError
end
