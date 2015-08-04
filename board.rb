class Board
  SIZE = 8

  attr_accessor :grid

  def initialize
    @grid = Array.new(SIZE) { Array.new(SIZE) }
  end
end
