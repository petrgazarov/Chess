require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe HumanPlayer do
  describe "#validate" do
    before(:all) do
      @player = HumanPlayer.new("Test", :white)
    end

    it "raises error if given non-numbers" do
      expect { @player.validate(["a", "b"]) }.to raise_error(ArgumentError)
    end

    it "raises error if given position that does not contain exactly 2 values" do
      expect { @player.validate([1, 2, 3]) }.to raise_error(InputError)
    end
    it "returns the position back if it is valid" do
      expect(@player.validate([1, 1])).to eq([1, 1])
    end
  end
end
