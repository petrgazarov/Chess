require 'play'

describe Bishop do

  include_examples("pos")
  include_examples("empty_board")

  subject(:bishop) { Bishop.new([3, 3], board, :white) }

  describe "#moves" do
    context "position is [3, 3] on empty board" do
      let(:moves) { [[0, 0], [1, 1], [2, 2], [4, 4], [5, 5], [6, 6], [7, 7],
                     [0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0]]
                  }
      it "returns correct move options" do
        expect(bishop.moves.sort).to eq(moves.sort)
      end
    end
  end
end
