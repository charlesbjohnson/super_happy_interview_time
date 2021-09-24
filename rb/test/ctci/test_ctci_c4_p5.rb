# typed: true
# frozen_string_literal: true

require("config")

require("data_structures/binary_tree")
require("ctci/ctci_c4_p5")

module CTCI
  module C4
    class TestP5 < Minitest::Test
      include(P5)

      def setup
        nodes = [[3, [1, 4]], [1, [0, 2]]]
        @tree = DataStructures::BinaryTree.from(nodes, 3)
      end

      def test_returns_true_if_tree_is_binary_search_tree
        assert(binary_search_tree?(@tree.root))
      end

      def test_returns_false_if_tree_is_not_binary_search_tree
        nodes = [[2, [1, 4]], [1, [0, 3]]]
        @tree = DataStructures::BinaryTree.from(nodes, 2)

        refute(binary_search_tree?(@tree.root))
      end

      def test_returns_true_if_single
        nodes = [1]
        @tree = DataStructures::BinaryTree.from(nodes, 1)

        assert(binary_search_tree?(@tree.root))
      end

      def test_returns_true_if_empty
        assert(binary_search_tree?(nil))
      end
    end
  end
end
