# typed: true
# frozen_string_literal: true

module LeetCode
  # 108. Convert Sorted Array to Binary Search Tree
  module LC108
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given an array where elements are sorted in ascending order,
    # convert it to a height balanced BST.
    #
    # For this problem, a height-balanced binary tree is defined as a binary tree
    # in which the depth of the two subtrees of every node never differ by more than 1.
    #
    # Examples:
    # Input: [-10, -3, 0, 5, 9]
    # Output:
    #        0
    #       / \
    #     -3   9
    #     /   /
    #   -10  5
    #
    # @param list {Array<Integer>}
    # @return {TreeNode}
    def sorted_array_to_bst(list)
      return if list.empty?

      mid = list.length / 2

      left = list.take(mid)
      right = list.drop(mid + 1)

      node = TreeNode.new(list[mid])
      node.left = sorted_array_to_bst(left)
      node.right = sorted_array_to_bst(right)

      node
    end
  end
end
