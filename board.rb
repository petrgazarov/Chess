class Board
  SIZE = 8

  def self.on_board?(pos)
    pos.all? { |coord| coord.between?(0,SIZE) }
  end

  attr_accessor :grid

  def initialize
    @grid = Array.new(SIZE) { Array.new(SIZE) }
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
    (0...SIZE).each do |x|
      (0...SIZE).each do |y|
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
      end
      print "\n"
    end
  end

  def in_check?(color)

  end

  def move(start_pos, end_pos)

  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    self.grid[pos[0]][pos[1]] = value
  end

  def dup
    new_board = self.map do |row|
      row.map do |square|
        if square
          new_piece = square.dup
          new_piece.pos = square.position.dup
          new_piece
        else
          nil
        end
      end
    end
    new_board.assign_duped_board
  end

  private
  def assign_duped_board
    self.each do |row|
      row.each do |square|
        square ? square.board = self : nil
      end
    end
    self
  end
end
