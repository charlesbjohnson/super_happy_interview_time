# frozen_string_literal: true

module LeetCode
  # 94. Binary Tree Inorder Traversal
  module LC94
    # Description:
    # Given a binary tree, return the inorder traversal of its nodes' values.
    #
    # Follow up: Recursive solution is trivial, could you do it iteratively?
    #
    # Examples:
    # Input: root = [1, null, 2, 3]
    # Output: [1, 3, 2]
    #
    # Input: root = []
    # Output: []
    #
    # Input: root = [1]
    # Output: [1]
    #
    # @param {TreeNode} root
    # @return {Array<Integer>}
    def inorder_traversal(root)
      result = []

      stack = []
      stack.push([root, false]) if root

      until stack.empty?
        node, visited = stack.pop

        if visited || (!node.left && !node.right)
          result.push(node.val)
        else
          stack.push([node.right, false]) if node.right
          stack.push([node, true])
          stack.push([node.left, false]) if node.left
        end
      end

      result
    end
  end
end
