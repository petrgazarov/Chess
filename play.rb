require 'byebug'
require 'colorize'
require './lib/piece'
require './lib/stepping_piece'
require './lib/sliding_piece'
require './lib/pieces/king'
require './lib/pieces/queen'
require './lib/pieces/bishop'
require './lib/pieces/knight'
require './lib/pieces/rook'
require './lib/pieces/pawn'
require './lib/keypress'
require './lib/game'
require './lib/player'
require './lib/human_player'
require './lib/board'

if __FILE__ == $PROGRAM_NAME
  Game.new("White", "Black")
end
