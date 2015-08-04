class Board
  SIZE = 8

  attr_accessor :grid

  def initialize
    @grid = Array.new(SIZE) { Array.new(SIZE) }
  end

  def in_check?(color)

  end

  def move(start_pos, end_pos)

  end

  def [](pos)
    grid[pos[0], pos[1]]
  end

  def []=(pos, value)
    self.grid[pos[0], pos[1]] = value
  end

  def dup
    new_board = self.map do |row|
      row.map do |piece|
        new_piece = piece.dup
        new_piece.pos = piece.position.dup
        new_piece
      end
    end
    new_board
  end
end
