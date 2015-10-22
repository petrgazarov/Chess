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


end
