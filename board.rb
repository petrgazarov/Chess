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
end
