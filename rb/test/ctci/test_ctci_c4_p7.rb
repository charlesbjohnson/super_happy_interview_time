# frozen_string_literal: true

require("config")

require("data_structures/binary_tree")
require("ctci/ctci_c4_p7")

module CTCI
  module C4
    class TestP7 < Minitest::Test
      include(P7)

      def setup
        nodes = [[0, [1, 2]], [1, [3, 4]], [2, [5, 6]], [3, [7]], [5, [nil, 8]]]
        @tree = DataStructures::BinaryTree.from(nodes, 0)
      end

      def test_returns_first_ancestor_root
        assert_equal(@tree.root, first_ancestor(@tree.root,
          @tree.root.left.left,
          @tree.root.right))
      end

      def test_returns_first_ancestor_subtree
        assert_equal(@tree.root.left, first_ancestor(@tree.root,
          @tree.root.left.left.left,
          @tree.root.left.right))
      end

      def test_returns_node_if_it_is_ancestor
        assert_equal(@tree.root.right, first_ancestor(@tree.root,
          @tree.root.right.left.right,
          @tree.root.right))
      end

      def test_returns_nil_if_node_doesnt_exist_in_tree
        assert_nil(first_ancestor(@tree.root,
          @tree.root,
          DataStructures::BinaryTreeNode.new(10)))
      end
    end
  end
end
