require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe Board do
  describe "::on_board?" do
    it "returns false when position is not on the board" do
      expect(Board.on_board?([0, Board::SIZE + 1])).to eq false
    end
    it "returns true when position is on the board" do
      expect(Board.on_board?([Board::SIZE - 1, 0])).to eq true
    end
  end

  describe "#initialize" do
    context "when called without arguments" do
      it "populates white pieces correctly"
      it "populates black pieces correctly"
      it "does not populate spaces that should be empty at game start"
    end

    context "when passed a 'false' argument" do
      it "does not populate the board"
    end
  end

  describe "#in_check?" do
    it "calls #find_piece_on_board"
    it "calls #find_vulnerability"

    context "when king is in check" do
      it "returns true"
    end

    context "when king is not in check" do
      it "returns false"
    end
  end

  describe "#move" do
    context "when no piece exists on starting position" do
      it "raises MoveError"
    end

    context "when starting position is same as ending position" do
      it "raises MoveError"
    end

    context "when ending position is not among available moves of the piece" do
      it "raises MoveError"
    end

    context "when the move will put the player in check" do
      it "raises MoveError"
    end

    context "when the selected piece is not the color of the current player" do
      it "raises MoveError"
    end

    context "when move is valid" do
      it "calls #move!"
      it "moves the piece"
    end
  end

  describe "#[]" do
    it "gets the grid value for the given position"
  end

  describe "#[]=" do
    it "sets the grid value for the given position"
  end

  describe "#dup" do
    it "creates a new board instance"
    it "copies layout of the original board"
    it "calls #dup on each of the Pieces on the original board"
  end

  describe "#checkmate?" do
    it "checks valid moves of pieces of the current player"
    it "returns true if there is checkmate"
    it "return false if there is no checkmate"
  end
end
