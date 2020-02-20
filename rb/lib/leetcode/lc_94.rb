# typed: false
# frozen_string_literal: true

module LeetCode
  # 94. Binary Tree Inorder Traversal
  module LC94
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given a binary tree, return the inorder traversal of its nodes' values.
    #
    # Examples:
    # Input:
    #   1
    #    \
    #     2
    #    /
    #   3
    # Output: [1, 3, 2]
    #
    # Notes:
    # @param tree {TreeNode}
    # @return {Array<Integer>}
    def inorder_traversal(tree)
      cursor = tree
      stack = []

      values = []

      loop do
        break if !cursor && stack.empty?

        unless cursor
          cursor = stack.pop
          values.push(cursor.val)
          cursor = cursor.right
          next
        end

        stack.push(cursor)
        cursor = cursor.left
      end

      values
    end
  end
end
