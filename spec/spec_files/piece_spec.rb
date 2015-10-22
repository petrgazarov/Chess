require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe Piece do
  describe "#initialize" do
    it "sets position, board and color as instance variables" do
      board = double("board")
      piece = Piece.new([3, 3], board, :white)

      expect(piece.position).to eq([3, 3])
      expect(piece.board).to eq(board)
      expect(piece.color).to eq(:white)
    end
  end

  describe "#dup" do
    it "returns a new instance of Piece"
  end

  describe "#same_color?" do
    it "returns true if given the same color"
    it "returns false if given the opposite color"
  end

  describe "#occupied" do
    it "returns true if position is occupied"
    it "returns false if position is empty"
  end

  describe "#move_into_check?" do
    it "returns true if move will result in a check"
    it "returns false if move will not result in a check"
    it "does not modify the board"
  end
end
