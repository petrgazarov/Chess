require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe Piece do
  before(:all) do
    @board = double("board")
    @piece = Piece.new([3, 3], @board, :black)
  end
  describe "#initialize" do
    it "sets position, board and color as instance variables" do
      expect(@piece.position).to eq([3, 3])
      expect(@piece.board).to eq(@board)
      expect(@piece.color).to eq(:black)
    end
  end

  describe "#dup" do
    before(:all) do
      @new_board = double("board")
      @dupped_piece = @piece.dup(@new_board)
    end
    it "returns a new instance of Piece" do
      expect(@dupped_piece).not_to equal(@piece)
    end

    it "returns a piece with same color and position and with the given board" do
      expect(@dupped_piece.color).to eq(@piece.color)
      expect(@dupped_piece.position).to eq(@piece.position)
      expect(@dupped_piece.board).to eq(@new_board)
    end
  end

  describe "#same_color?" do
    it "returns true if given the same color" do
      expect(@piece.same_color?(:black)).to eq true
    end
    it "returns false if given the opposite color" do
      expect(@piece.same_color?(:white)).to eq false
    end
  end

  describe "#occupied" do
    it "returns true if position is occupied"
    it "returns false if position is empty"
  end
end
