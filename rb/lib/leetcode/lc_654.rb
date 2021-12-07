# frozen_string_literal: true

module LeetCode
  # 654. Maximum Binary Tree
  module LC654
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given an integer array with no duplicates,
    # A maximum tree building on this array is defined as follows:
    #
    # - The root is the maximum number in the array.
    # - The left subtree is the maximum tree constructed from left part subarray divided by the maximum number.
    # - The right subtree is the maximum tree constructed from right part subarray divided by the maximum number.
    #
    # Construct the maximum tree from the given array and output the root node of the new tree.
    #
    # Examples:
    # Input: [3, 2, 1, 6, 0, 5]
    # Output:
    #       6
    #      / \
    #     /   \
    #    /     \
    #   3       5
    #   \      /
    #    2    0
    #     \
    #      1
    #
    # Notes:
    # - The size of the given array will be in the range [1, 1000].
    #
    # @param list {Array<Integer>}
    # @return {TreeNode}
    def construct_maximum_binary_tree(list)
      return if list.empty?

      max, i = list.each.with_index.max

      left = list.take(i)
      right = list.drop(i + 1)

      node = TreeNode.new(max)
      node.left = construct_maximum_binary_tree(left)
      node.right = construct_maximum_binary_tree(right)

      node
    end
  end
end
