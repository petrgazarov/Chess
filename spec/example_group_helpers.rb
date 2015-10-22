module ExampleGroupHelpers
  def include_examples_for_piece_tests
    include_examples("empty_board")
    include_examples("initial_board")
    include_examples("black_piece")
    include_examples("white_piece")
  end
end
