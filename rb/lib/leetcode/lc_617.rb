# typed: true
# frozen_string_literal: true

module LeetCode
  # 617. Merge Two Binary Trees
  module LC617
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given two binary trees and imagine that when you put one of them to cover the other,
    # some nodes of the two trees are overlapped while the others are not.
    #
    # You need to merge them into a new binary tree.
    # The merge rule is that if two nodes overlap,
    # then sum node values up as the new value of the merged node.
    # Otherwise, the NOT null node will be used as the node of new tree.
    #
    # Examples:
    # Input:
    #      left        right
    #       1           2
    #      / \         / \
    #     3   2       1   3
    #    /             \   \
    #   5               4   7
    # Output:
    #       3
    #      / \
    #     4   5
    #    / \   \
    #   5   4   7
    #
    # Notes:
    # - The merging process must start from the root nodes of both trees.
    #
    # @param left {TreeNode}
    # @param left {TreeNode}
    # @return {TreeNode}
    def merge_trees(left, right)
      return if !left && !right

      merged = TreeNode.new(0)

      val = 0
      left_children = [nil, nil]
      right_children = [nil, nil]

      if left
        val += left.val
        left_children = [left.left, left.right]
      end

      if right
        val += right.val
        right_children = [right.left, right.right]
      end

      merged.val = val
      merged.left = merge_trees(left_children[0], right_children[0])
      merged.right = merge_trees(left_children[1], right_children[1])

      merged
    end
  end
end
