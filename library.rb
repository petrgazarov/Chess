require 'byebug'
require 'colorize'
require_relative 'game'
require_relative 'board'
require_relative 'piece'
require_relative 'stepping_piece'
require_relative 'sliding_piece'
require_relative 'king'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'pawn'

if __FILE__ == $PROGRAM_NAME

  test = Board.new
  test[[3,5]] = Knight.new([3,5], test, :white)
  #test.move([1, 5], [2, 5])
  test.render
  #p test[[1,1]].move_into_check?([2,1])
  p test.in_check?(:black)
end
