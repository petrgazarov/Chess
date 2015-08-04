require_relative 'library'

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
    (0..7).each do |idx|
      self[[6, idx]] = Pawn.new([6, idx], self)
    end

    self[[7, 0]] = Rook.new([7, 0], self)
    self[[7, 7]] = Rook.new([7, 7], self)
    self[[7, 1]] = Bishop.new([7, 1], self)
    self[[7, 6]] = Bishop.new([7, 6], self)
    self[[7, 2]] = Knight.new([7, 2], self)
    self[[7, 5]] = Knight.new([7, 5], self)
    self[[7, 4]] = Queen.new([7, 4], self)
    self[[7, 3]] = King.new([7, 3], self)
  end

  def populate_black
    (0..7).each do |idx|
      self[[1, idx]] = Pawn.new([1, idx], self)
    end

    self[[0, 0]] = Rook.new([0, 0], self)
    self[[0, 7]] = Rook.new([0, 7], self)
    self[[0, 1]] = Bishop.new([0, 1], self)
    self[[0, 6]] = Bishop.new([0, 6], self)
    self[[0, 2]] = Knight.new([0, 2], self)
    self[[0, 5]] = Knight.new([0, 5], self)
    self[[0, 3]] = Queen.new([0, 3], self)
    self[[0, 4]] = King.new([0, 4], self)
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
