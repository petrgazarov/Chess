require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe Board do
  extend ExampleGroupHelpers

  describe "::on_board?" do
    it "returns false when position is not on the board" do
      expect(Board.on_board?([0, Board::SIZE + 1])).to eq false
    end
    it "returns true when position is on the board" do
      expect(Board.on_board?([Board::SIZE - 1, 0])).to eq true
    end
  end

  describe "#initialize" do
    it "sets grid attribute to a matrix array equal in length to board's SIZE constant" do
      empty_initialized_board = Board.new(false)

      expect(empty_initialized_board.grid.length).to eq(Board::SIZE)
      empty_initialized_board.grid.each do |row|
        expect(row.length).to eq(Board::SIZE)
      end
    end

    context "when passed a 'false' argument" do
      it "does not populate the board" do
        empty_initialized_board = Board.new(false)

        expect(empty_initialized_board.grid.flatten.compact).to be_empty
      end
    end

    context "when called without arguments" do
      before (:all) do
        @initialized_board_with_setup = Board.new
        @grid = @initialized_board_with_setup.grid
      end

      it "populates white pieces correctly" do
        extend ExampleHelpers

        declare_expect_for_populating_board(@grid, :white)
      end
      it "populates black pieces correctly" do
        extend ExampleHelpers

        declare_expect_for_populating_board(@grid, :black)
      end
      it "does not populate spaces that should be empty at game start" do
        2.upto(5) do |i|
          expect(@grid[i].compact).to be_empty
        end
      end
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
