# frozen_string_literal: true

module LeetCode
  # 102. Binary Tree Level Order Traversal
  module LC102
    # Description:
    # Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: [[3],[9, 20],[15, 7]]
    #
    # Input: root = [1]
    # Output: [[1]]
    #
    # Input: root = []
    # Output: []
    #
    # @param {TreeNode} root
    # @return {Array<Array<Integer>>}
    def level_order(root)
      stack = []
      result = []

      stack.push([root]) if root

      until stack.empty?
        curr_level = stack.pop
        next_level = []

        curr_level.each_with_index { |node, i|
          next_level.push(node.left) if node.left
          next_level.push(node.right) if node.right

          curr_level[i] = node.val
        }

        stack.push(next_level) if !next_level.empty?
        result.push(curr_level)
      end

      result
    end
  end
end
