# frozen_string_literal: true

module LeetCode
  # 701. Insert into a Binary Search Tree
  module LC701
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # You are given the root node of a binary search tree (BST) and a value to insert into the tree.
    # Return the root node of the BST after the insertion.
    # It is guaranteed that the new value does not exist in the original BST.
    #
    # Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion.
    # You can return any of them.
    #
    # Examples:
    # Input: root = [4, 2, 7, 1, 3], val = 5
    # Output: [4, 2, 7, 1, 3, 5]
    #
    # Input: root = [40, 20, 60, 10, 30, 50, 70], val = 25
    # Output: [40, 20, 60, 10, 30, 50, 70, null, null, 25]
    #
    # Input: root = [4, 2, 7, 1, 3, null, null, null, null, null, null], val = 5
    # Output: [4, 2, 7, 1, 3, 5]
    #
    # @param {TreeNode} root
    # @param {Integer} val
    # @return {TreeNode}
    def insert_into_bst(root, val)
      return TreeNode.new(val) if !root

      case val <=> root.val
      when -1
        root.left = insert_into_bst(root.left, val)
      when 1
        root.right = insert_into_bst(root.right, val)
      end

      root
    end
  end
end
