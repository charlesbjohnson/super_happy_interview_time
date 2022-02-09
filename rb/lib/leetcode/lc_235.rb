# frozen_string_literal: true

module LeetCode
  # 235. Lowest Common Ancestor of a Binary Search Tree
  module LC235
    # Description:
    # Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
    #
    # According to the definition of LCA on Wikipedia:
    # “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants
    # (where we allow a node to be a descendant of itself).”
    #
    # Examples:
    # Input: root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5], p = 2, q = 8
    # Output: 6
    #
    # Input: root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5], p = 2, q = 4
    # Output: 2
    #
    # Input: root = [2, 1], p = 2, q = 1
    # Output: 2
    #
    # @param {TreeNode} root
    # @param {TreeNode} p
    # @param {TreeNode} q
    # @return {TreeNode}
    def lowest_common_ancestor(root, p, q)
      return root if root == p || root == q || (root.val > p.val && root.val < q.val) || (root.val > q.val && root.val < p.val)

      if p.val < root.val && q.val < root.val
        lowest_common_ancestor(root.left, p, q)
      elsif p.val > root.val && q.val > root.val
        lowest_common_ancestor(root.right, p, q)
      end
    end
  end
end
