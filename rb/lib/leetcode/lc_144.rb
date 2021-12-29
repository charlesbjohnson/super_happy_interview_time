# frozen_string_literal: true

module LeetCode
  # 144. Binary Tree Preorder Traversal
  module LC144
    # Description:
    # Given the root of a binary tree, return the preorder traversal of its nodes' values.
    #
    # Follow up: Recursive solution is trivial, could you do it iteratively?
    #
    # Examples:
    # Input: root = [1, null, 2, 3]
    # Output: [1, 2, 3]
    #
    # Input: root = []
    # Output: []
    #
    # Input: root = [1]
    # Output: [1]
    #
    # @param {TreeNode} root
    # @return {Array<Integer>}
    def preorder_traversal(root)
      stack = []
      result = []

      stack.push(root) if root

      until stack.empty?
        node = stack.pop

        result.push(node.val)
        stack.push(node.right) if node.right
        stack.push(node.left) if node.left
      end

      result
    end
  end
end
