# typed: true
# frozen_string_literal: true

module LeetCode
  # 105. Construct Binary Tree from Preorder and Inorder Traversal
  module LC105
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given preorder and inorder traversal of a tree, construct the binary tree.
    #
    # Examples:
    # Input: preorder = [3, 9, 20, 15, 7], inorder = [9, 3, 15, 20, 7]
    # Output:
    #      3
    #     / \
    #    9  20
    #      /  \
    #     15   7
    #
    # Notes:
    # - You may assume that duplicates do not exist in the tree.
    #
    # @param preorder {Array<Integer>}
    # @param inorder {Array<Integer>}
    # @return {TreeNode}
    def build_tree(preorder, inorder)
      return if preorder.empty? || inorder.empty?

      root_value = preorder.shift
      root_index = inorder.find_index(root_value)

      root_node = TreeNode.new(root_value)
      root_node.left = build_tree(preorder, inorder.take(root_index))
      root_node.right = build_tree(preorder, inorder.drop(root_index + 1))

      root_node
    end
  end
end
