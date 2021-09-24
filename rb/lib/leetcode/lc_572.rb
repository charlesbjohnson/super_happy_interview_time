# typed: true
# frozen_string_literal: true

module LeetCode
  # 572. Subtree of Another Tree
  module LC572
    TreeNode = Struct.new(:val, :left, :right)

    def subtree_recurse(left, right, matching)
      return true if !left && !right

      return false if left && !right || !left && right
      return false if matching && left.val != right.val

      return true if left.val == right.val && subtree_recurse(left.left, right.left, true) && subtree_recurse(left.right, right.right, true)

      subtree_recurse(left.left, right, false) || subtree_recurse(left.right, right, false)
    end

    # Description:
    # Given two non-empty binary trees left and right, check whether tree right has exactly the same structure and node values with a subtree of left.
    # A subtree of left is a tree consists of a node in left and all of the node's descendants.
    # The tree left could also be considered as a subtree of itself.
    #
    # Examples:
    # - 1:
    #   Input:
    #       left       right
    #         3          4
    #        / \        / \
    #       4   5      1   2
    #      / \
    #     1   2
    #   Output: true
    #
    # - 2:
    #   Input:
    #     left       right
    #       3          4
    #      / \        / \
    #     4   5      1   2
    #    / \
    #   1   2
    #      /
    #     0
    #   Output: false
    #
    # @param left {TreeNode}
    # @param right {TreeNode}
    # @return {Boolean}
    def subtree?(left, right)
      subtree_recurse(left, right, false)
    end

    alias_method(:is_subtree, :subtree?)
  end
end
