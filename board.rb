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
