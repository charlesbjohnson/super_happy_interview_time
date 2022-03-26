# frozen_string_literal: true

module LeetCode
  # 107. Binary Tree Level Order Traversal II
  module LC107
    # Description:
    # Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values.
    # (i.e., from left to right, level by level from leaf to root).
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: [[15, 7], [9, 20], [3]]
    #
    # Input: root = [1]
    # Output: [[1]]
    #
    # Input: root = []
    # Output: []
    #
    # @param {TreeNode} root
    # @return {Array<Array<Integer>>}
    def level_order_bottom(root)
      result = private_methods.grep(/^level_order_bottom_\d+$/).map { |m| send(m, root) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def level_order_bottom_1(root)
      result = []

      p_level = [root].compact
      n_level = []

      until p_level.empty?
        p_level.each_with_index { |node, i|
          p_level[i] = node.val
          n_level.push(node.left) if node.left
          n_level.push(node.right) if node.right
        }

        result.unshift(p_level)

        p_level = n_level
        n_level = []
      end

      result
    end

    def level_order_bottom_2(root)
      result = []
      queue = [root].compact

      until queue.empty?
        level = []

        queue.length.times {
          node = queue.shift

          level.push(node.val)

          queue.push(node.left) if node.left
          queue.push(node.right) if node.right
        }

        result.unshift(level) if !level.empty?
      end

      result
    end
  end
end
