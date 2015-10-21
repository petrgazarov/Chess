require 'play'

describe Bishop do

  include_examples("pos")
  include_examples("empty_board")

  subject(:bishop) { Bishop.new([3, 3], empty_board, :white) }

  describe "#moves" do
    context "when position is [3, 3] on empty board" do
      let(:moves) { [[0, 0], [1, 1], [2, 2], [4, 4], [5, 5], [6, 6], [7, 7],
                     [0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0]]
                  }

      it "returns correct possible moves" do
        allow(bishop).to receive(:occupied?).and_return false
        expect(bishop.moves.sort).to eq(moves.sort)
      end
    end

    context "when position is [3, 3] on board with initial setup" do
      let(:moves) { [[2, 2], [4, 4], [5, 5], [1, 5], [2, 4], [4, 2], [5, 1], [1, 1]] }

      it "returns correct possible moves" do
        allow(bishop).to receive(:occupied?) do |pos|
          occupied = [[1, 1], [1, 5], [6, 0], [6, 6]]
          occupied.include?(pos) ? true : false
        end

        allow(board).to receive(:[]) do |pos|

        end

        expect(bishop.moves.sort).to eq(moves.sort)
      end
    end
  end
end
