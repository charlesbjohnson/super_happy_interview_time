# frozen_string_literal: true

module LeetCode
  # 236. Lowest Common Ancestor of a Binary Tree
  module LC236
    # Description:
    # Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
    #
    # According to the definition of LCA on Wikipedia:
    # “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants
    # (where we allow a node to be a descendant of itself).”
    #
    # Examples:
    # Input: root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], p = 5, q = 1
    # Output: 3
    #
    # Input: root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4], p = 5, q = 4
    # Output: 5
    #
    # Input: root = [1, 2], p = 1, q = 2
    # Output: 1
    #
    # @param {TreeNode} root
    # @param {TreeNode} p
    # @param {TreeNode} q
    # @return {TreeNode}
    def lowest_common_ancestor(root, p, q)
      return root if !root || root == p || root == q

      left = lowest_common_ancestor(root.left, p, q)
      right = lowest_common_ancestor(root.right, p, q)

      left && right ? root : left || right
    end
  end
end
