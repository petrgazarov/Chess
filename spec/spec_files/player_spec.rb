require 'play'
require 'example_group_helpers'
require 'example_helpers'

RSpec.describe Player do
  describe "#initialize" do
    it "sets name and color as attributes accessible from outside the class scope" do
      player = Player.new("Test", :black)

      expect(player.name).to eq("Test")
      expect(player.color).to eq(:black)
    end
  end
end
