# frozen_string_literal: true

module LeetCode
  # 226. Invert Binary Tree
  module LC226
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Invert a binary tree.
    #
    # Examples:
    # Input:
    #        4
    #      /   \
    #     2     7
    #    / \   / \
    #   1   3 6   9
    #
    # Output:
    #        4
    #      /   \
    #     7     2
    #    / \   / \
    #   9   6 3   1
    #
    # @param tree {TreeNode}
    # @return {TreeNode}
    def invert_tree(tree)
      return unless tree

      tree.left, tree.right = tree.right, tree.left

      invert_tree(tree.left)
      invert_tree(tree.right)

      tree
    end
  end
end
