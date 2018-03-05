# frozen_string_literal: true

module LeetCode
  # 114. Flatten Binary Tree to Linked List
  module LC114
    TreeNode = Struct.new(:val, :left, :right)

    def join(left, right)
      return if !left && !right
      return left if left && !right
      return right if !left && right

      cursor = left
      cursor = cursor.right while cursor.right
      cursor.right = right

      left
    end

    # Description:
    # Given a binary tree, flatten it to a linked list in-place.
    #
    # Examples:
    # Input:
    #       1
    #      / \
    #     2   5
    #    / \   \
    #   3   4   6
    # Output:
    #   1
    #    \
    #     2
    #      \
    #       3
    #        \
    #         4
    #          \
    #           5
    #            \
    #             6
    #
    # Notes:
    # - Each node's right child points to the next node of a pre-order traversal.
    #
    # @param tree {TreeNode}
    # @return {nil}
    def flatten(tree)
      return unless tree

      left = flatten(tree.left)
      right = flatten(tree.right)

      tree.right = join(left, right)
      tree.left = nil

      tree
    end
  end
end
