# frozen_string_literal: true

module LeetCode
  # 106. Construct Binary Tree from Inorder and Postorder Traversal
  module LC106
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree
    # and postorder is the postorder traversal of the same tree, construct and return the binary tree.
    #
    # Examples:
    # Input: inorder = [9, 3, 15, 20, 7], postorder = [9, 15, 7, 20, 3]
    # Output: [3, 9, 20, null, null, 15, 7]
    #
    # Input: inorder = [-1], postorder = [-1]
    # Output: [-1]
    #
    # @param {Array<Integer>} inorder
    # @param {Array<Integer>} postorder
    # @return {TreeNode}
    def build_tree(inorder, postorder)
      return if inorder.empty? || postorder.empty?

      root_value = postorder.pop
      root_index = inorder.index(root_value)

      root = TreeNode.new(root_value)
      root.right = build_tree(inorder[(root_index + 1)..], postorder)
      root.left = build_tree(inorder[...root_index], postorder)

      root
    end
  end
end
