# typed: true
# frozen_string_literal: true

require("config")
require("ctci/ctci_c9_p4")

module CTCI
  module C9
    class TestP4 < Minitest::Test
      include(P4)

      def test_returns_all_subsets_of_sets
        assert_equal([[]], subsets_of_set([]))

        assert_equal([[], [1]], subsets_of_set([1]))

        assert_equal([[], [1], [2], [1, 2]].to_set, subsets_of_set([1, 2]).to_set)

        assert_equal([[], [1], [2], [3],
                      [1, 2], [1, 3], [2, 3],
                      [1, 2, 3]].to_set, subsets_of_set([1, 2, 3]).to_set)

        assert_equal([[], [1], [2], [3], [4],
                      [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4],
                      [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4],
                      [1, 2, 3, 4]].to_set, subsets_of_set([1, 2, 3, 4]).to_set)
      end
    end
  end
end
