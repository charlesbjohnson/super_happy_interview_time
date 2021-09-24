# typed: true
# frozen_string_literal: true

module LeetCode
  # 538. Convert BST to Greater Tree
  module LC538
    TreeNode = Struct.new(:val, :left, :right)

    def convert_bst_recurse(tree, greater)
      return greater unless tree

      right = convert_bst_recurse(tree.right, greater)
      tree.val += right
      convert_bst_recurse(tree.left, tree.val)
    end

    # Description:
    # Given a Binary Search Tree (BST), convert it to a Greater Tree such that
    # every key of the original BST is changed to the original key plus sum of all keys
    # greater than the original key in BST.
    #
    # Examples:
    # Input:
    #     5
    #    / \
    #   2  13
    #
    # Output:
    #     18
    #    /  \
    #   20  13
    #
    #
    # @param tree {TreeNode}
    # @return {TreeNode}
    def convert_bst(tree)
      return unless tree

      convert_bst_recurse(tree, 0)
      tree
    end
  end
end
