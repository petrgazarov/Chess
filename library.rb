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
  test[[2,0]] = King.new([2,6], test, :white)
  p test[[1,1]].valid_moves
  test.render
  p test.in_check?(:white)

end
