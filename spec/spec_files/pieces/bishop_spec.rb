require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe Bishop do
  extend ExampleGroupHelpers

  include_examples_for_piece_tests

  let(:empty_board_bishop) { Bishop.new([3, 3], empty_board, :white) }
  let(:initial_board_bishop) { Bishop.new([3, 3], initial_board, :white) }

  describe "#moves" do
    context "when position is [3, 3] on empty board" do
      let(:moves) { bishop_empty_board_moves }

      it "returns correct possible moves" do
        extend ExampleHelpers

        allow(empty_board_bishop).to receive(:occupied?).and_return false
        expect(empty_board_bishop.moves.sort).to eq(moves.sort)
      end
    end

    context "when position is [3, 3] on board with initial setup" do
      let(:moves) { bishop_initial_setup_board_moves }

      it "returns correct possible moves" do
        extend ExampleHelpers

        set_up_allow_for_piece(
          initial_board_bishop, initial_board, black_piece, white_piece
        )
        expect(initial_board_bishop.moves.sort).to eq(moves.sort)
      end
    end
  end
end
