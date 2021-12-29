# frozen_string_literal: true

module LeetCode
  # 105. Construct Binary Tree from Preorder and Inorder Traversal
  module LC105
    TreeNode = Helpers::LeetCode::BinaryTree::TreeNode

    # Description:
    # Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree
    # and inorder is the inorder traversal of the same tree, construct and return the binary tree.
    #
    # Examples:
    # Input: preorder = [3, 9, 20, 15, 7], inorder = [9, 3, 15, 20, 7]
    # Output: [3, 9, 20, null, null, 15, 7]
    #
    # Input: preorder = [-1], inorder = [-1]
    # Output: [-1]
    #
    # @param {Array<Integer>} preorder
    # @param {Array<Integer>} inorder
    # @return {TreeNode}
    def build_tree(preorder, inorder)
      return if preorder.empty? || inorder.empty?

      root_value = preorder.shift
      root_index = inorder.find_index(root_value)

      root = TreeNode.new(root_value)
      root.left = build_tree(preorder, inorder[...root_index])
      root.right = build_tree(preorder, inorder[(root_index + 1)..])

      root
    end
  end
end
