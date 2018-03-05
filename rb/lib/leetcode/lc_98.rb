# frozen_string_literal: true

module LeetCode
  # 98. Validate Binary Search Tree
  module LC98
    TreeNode = Struct.new(:val, :left, :right)

    def valid_bst_recurse(node, items)
      return true unless node

      return false unless valid_bst_recurse(node.left, items)

      return false if items.last && node.val <= items.last
      items.push(node.val)

      return false unless valid_bst_recurse(node.right, items)

      true
    end

    # Description:
    # Given a binary tree, determine if it is a valid binary search tree (BST).
    #
    # Assume a BST is defined as follows:
    #
    # - The left subtree of a node contains only nodes with keys less than the node's key.
    # - The right subtree of a node contains only nodes with keys greater than the node's key.
    # - Both the left and right subtrees must also be binary search trees.
    #
    # Examples:
    # - 1:
    #   Input:
    #     2
    #    / \
    #   1   3
    #   Output: true
    #
    # - 2:
    #   Input:
    #     1
    #    / \
    #   2   3
    #   Output: false
    #
    # @param tree {TreeNode}
    # @return {Boolean}
    def valid_bst?(tree)
      valid_bst_recurse(tree, [])
    end

    alias is_valid_bst valid_bst?
  end
end
