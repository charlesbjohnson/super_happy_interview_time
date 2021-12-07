# frozen_string_literal: true

module LeetCode
  # 102. Binary Tree Level Order Traversal
  module LC102
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
    #
    # Examples:
    # Input:
    #     3
    #    / \
    #   9  20
    #     /  \
    #    15   7
    # Output: [[3], [9, 20], [15, 7]]
    #
    # @param tree {TreeNode}
    # @return {Array<Array<Integer>>}
    def level_order(tree)
      return [] unless tree

      queue = [[tree]]
      values = []

      until queue.empty?
        nodes = queue.shift

        visit = []
        value = []

        nodes.each { |node|
          next unless node

          visit.push(node.left) if node.left
          visit.push(node.right) if node.right
          value.push(node.val)
        }

        queue.push(visit) unless visit.empty?
        values.push(value)
      end

      values
    end
  end
end
