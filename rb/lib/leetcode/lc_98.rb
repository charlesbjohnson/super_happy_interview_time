# frozen_string_literal: true

module LeetCode
  # 98. Validate Binary Search Tree
  module LC98
    # Description:
    # Given the root of a binary tree, determine if it is a valid binary search tree (BST).
    #
    # A valid BST is defined as follows:
    # - The left subtree of a node contains only nodes with keys less than the node's key.
    # - The right subtree of a node contains only nodes with keys greater than the node's key.
    # - Both the left and right subtrees must also be binary search trees.
    #
    # Examples:
    # Input: root = [2, 1, 3]
    # Output: true
    #
    # Input: root = [5, 1, 4, null, null, 3, 6]
    # Output: false
    #
    # @param {TreeNode} root
    # @return {Boolean}
    def is_valid_bst(root)
      r_is_valid_bst(root, -Float::INFINITY, Float::INFINITY)
    end

    private

    def r_is_valid_bst(root, min, max)
      return true if !root
      return false if root.val <= min || root.val >= max

      r_is_valid_bst(root.left, min, root.val) && r_is_valid_bst(root.right, root.val, max)
    end
  end
end
