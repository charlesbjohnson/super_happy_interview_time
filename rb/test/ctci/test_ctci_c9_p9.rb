# typed: true
# frozen_string_literal: true

require "config"
require "ctci/ctci_c9_p9"

module CTCI
  module C9
    class TestP9 < Minitest::Test
      include P9

      def test_returns_all_possible_queen_placements_on_chess_board
        # Best I can do. Not writing this one out by hand.
        # https://en.wikipedia.org/wiki/Eight_queens_puzzle#Counting_solutions
        assert_equal 92, queen_placements.size
      end
    end
  end
end
