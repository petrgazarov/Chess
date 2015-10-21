RSpec.shared_examples "empty_board" do
  let(:empty_board) { double(:empty_board, empty: true) }
end

RSpec.shared_examples "initial_board" do
  let(:initial_board) { double(:initial_board, empty: true) }
end

RSpec.shared_examples "pos" do
  let(:pos) { double(:pos) }
end

RSpec.shared_examples "black_piece" do
  let(:black_piece) { double(:black_piece, same_color) }
end
