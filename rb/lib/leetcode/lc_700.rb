# frozen_string_literal: true

module LeetCode
  # 700. Search in a Binary Search Tree
  module LC700
    # Description:
    # You are given the root of a binary search tree (BST) and an integer val.
    #
    # Find the node in the BST that the node's value equals val and return the subtree rooted with that node.
    # If such a node does not exist, return null.
    #
    # Examples:
    # Input: root = [4, 2, 7, 1, 3], val = 2
    # Output: [2, 1, 3]
    #
    # Input: root = [4, 2, 7, 1, 3], val = 5
    # Output: []
    #
    # @param {TreeNode} root
    # @param {Integer} val
    # @return {TreeNode}
    def search_bst(root, val)
      return if !root

      case val <=> root.val
      when 0
        root
      when -1
        search_bst(root.left, val)
      when 1
        search_bst(root.right, val)
      end
    end
  end
end
