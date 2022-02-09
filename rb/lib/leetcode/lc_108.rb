# frozen_string_literal: true

module LeetCode
  # 108. Convert Sorted Array to Binary Search Tree
  module LC108
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # Given an integer array nums where the elements are sorted in ascending order,
    # convert it to a height-balanced binary search tree.
    #
    # A height-balanced binary tree is a binary tree in which the depth of
    # the two subtrees of every node never differs by more than one.
    #
    # Examples:
    # Input: nums = [-10, -3, 0, 5, 9]
    # Output: [0, -3, 9, -10, null, 5]
    #
    # Input: nums = [1, 3]
    # Output: [3, 1]
    #
    # @param {Array<Integer>} nums
    # @return {TreeNode}
    def sorted_array_to_bst(nums)
      r_sorted_array_to_bst(nums, 0, nums.length - 1)
    end

    private

    def r_sorted_array_to_bst(nums, l, r)
      return if l > r
      return TreeNode.new(nums[l]) if l == r

      m = ((r - l + 1) / 2) + l

      TreeNode.new(
        nums[m],
        r_sorted_array_to_bst(nums, l, m - 1),
        r_sorted_array_to_bst(nums, m + 1, r)
      )
    end
  end
end
