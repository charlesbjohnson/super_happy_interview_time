# frozen_string_literal: true

module LeetCode
  # 145. Binary Tree Postorder Traversal
  module LC145
    # Description:
    # Given the root of a binary tree, return the postorder traversal of its nodes' values.
    #
    # Follow up: Recursive solution is trivial, could you do it iteratively?
    #
    # Examples:
    # Input: root = [1, null, 2, 3]
    # Output: [3, 2, 1]
    #
    # Input: root = []
    # Output: []
    #
    # Input: root = [1]
    # Output: [1]
    #
    # @param {TreeNode} root
    # @return {Array<Integer>}
    def postorder_traversal(root)
      stack = []
      result = []

      stack.push([root, false]) if root

      until stack.empty?
        node, visited = stack.pop

        if visited || (!node.left && !node.right)
          result.push(node.val)
        else
          stack.push([node, true])
          stack.push([node.right, false]) if node.right
          stack.push([node.left, false]) if node.left
        end
      end

      result
    end
  end
end
