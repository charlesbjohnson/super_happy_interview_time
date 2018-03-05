# frozen_string_literal: true

module LeetCode
  # 112. Path Sum
  module LC112
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given a binary tree and a sum, determine if the tree has a root-to-leaf path
    # such that adding up all the values along the path equals the given sum.
    #
    # Examples:
    # Input:
    #       tree, sum = 22
    #         5
    #        / \
    #       4   8
    #      /   / \
    #     11  13  4
    #    /  \      \
    #   7    2      1
    # Output: true
    # Explanation: 5->4->11->2
    #
    # @param tree {TreeNode}
    # @param sum {Integer}
    # @return {Boolean}
    def path_sum?(tree, sum)
      return false unless tree
      return (sum - tree.val).zero? if !tree.left && !tree.right
      path_sum?(tree.left, sum - tree.val) || path_sum?(tree.right, sum - tree.val)
    end

    alias has_path_sum path_sum?
  end
end
