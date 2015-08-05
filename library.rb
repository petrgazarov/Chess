require 'byebug'
require 'colorize'
require_relative 'keypress'
require_relative 'game'
require_relative 'piece'
require_relative 'stepping_piece'
require_relative 'sliding_piece'
require_relative 'king'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'pawn'
require_relative 'player'
require_relative 'board'

if __FILE__ == $PROGRAM_NAME

  Game.new("Petr", "Ryan")

end
