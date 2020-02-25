# typed: true
# frozen_string_literal: true

require "config"

require "data_structures/binary_tree"
require "ctci/ctci_c4_p9"

module CTCI
  module C4
    class TestP9 < Minitest::Test
      include P9

      def setup
        nodes = (0..2).map { |i| [i, [(i.succ * 2).pred, (i.succ * 2)]] }
        @tree = DataStructures::BinaryTree.from(nodes, 0)
      end

      def test_returns_paths_that_sum_to_value
        assert_equal [[1, 4], [0, 1, 4], [5]].sort, paths_to_sum(@tree.root, 5).sort
      end

      def test_returns_paths_that_sum_to_value_when_values_negative
        nodes = [[3, [1, 4]], [1, [-3, 2]], [4, [-1, 6]]]
        @tree = DataStructures::BinaryTree.from(nodes, 3)

        assert_equal [[1], [3, 1, -3]].sort, paths_to_sum(@tree.root, 1).sort
      end

      def test_returns_empty_if_empty
        assert_empty paths_to_sum(nil, 100)
      end

      def test_returns_empty_if_no_paths_sum_to_value
        assert_empty paths_to_sum(@tree.root, 100)
      end
    end
  end
end
