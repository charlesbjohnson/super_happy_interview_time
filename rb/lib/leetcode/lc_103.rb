# frozen_string_literal: true

module LeetCode
  # 103. Binary Tree Zigzag Level Order Traversal
  module LC103
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given a binary tree, return the zigzag level order traversal of its nodes' values.
    # (ie, from left to right, then right to left for the next level and alternate between).
    #
    # Examples:
    # Input:
    #     3
    #    / \
    #   9  20
    #     /  \
    #    15   7
    #
    # Output: [[3], [20, 9], [15, 7]]
    #
    # @param tree {TreeNode}
    # @return {Array<Array<Integer>>}
    def zigzag_level_order(tree)
      return [] unless tree

      queue = [[tree]]
      values = []

      counter = 0

      until queue.empty?
        nodes = queue.shift

        visit = []
        value = []

        nodes.each do |node|
          next unless node

          visit.push(node.left) if node.left
          visit.push(node.right) if node.right
          value.push(node.val)
        end

        value.reverse! if counter.odd?
        counter += 1

        queue.push(visit) unless visit.empty?
        values.push(value)
      end

      values
    end
  end
end
