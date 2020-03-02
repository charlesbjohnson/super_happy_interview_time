# typed: true
# frozen_string_literal: true

require "config"

require "data_structures/binary_tree"
require "ctci/ctci_c4_p8"

module CTCI
  module C4
    class TestP8 < Minitest::Test
      include P8

      def setup
        nodes = [[1, [2, 3]], [2, [4, 5]], [3, [6, 7]]]
        @tree = DataStructures::BinaryTree.from(nodes, 1)
      end

      def test_returns_true_if_tree_contains_subtree
        smaller = DataStructures::BinaryTree.from([[2, [4, 5]]], 2)
        assert contains_subtree?(@tree.root, smaller.root)
      end

      def test_returns_false_if_tree_does_not_contain_subtree
        smaller = DataStructures::BinaryTree.from([[1, [2, 3]]], 1)
        refute contains_subtree?(@tree.root, smaller.root)
      end
    end
  end
end
