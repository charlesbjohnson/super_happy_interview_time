# frozen_string_literal: true

module LeetCode
  # 104. Maximum Depth of Binary Tree
  module LC104
    TreeNode = Struct.new(:val, :left, :right)

    def max_depth_recurse(node, depth)
      return depth unless node

      left = max_depth_recurse(node.left, depth + 1)
      right = max_depth_recurse(node.right, depth + 1)

      left > right ? left : right
    end

    # Description:
    # Given a binary tree, find its maximum depth.
    # The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
    #
    # Examples:
    # Input:
    #     3
    #    / \
    #   9  20
    #     /  \
    #    15   7
    # Output: 3
    #
    # @param tree {TreeNode}
    # @return {Integer}
    def max_depth(tree)
      max_depth_recurse(tree, 0)
    end
  end
end
