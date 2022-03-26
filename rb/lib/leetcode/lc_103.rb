# frozen_string_literal: true

module LeetCode
  # 103. Binary Tree Zigzag Level Order Traversal
  module LC103
    # Description:
    # Given the root of a binary tree, return the zigzag level order traversal of its nodes' values.
    # (i.e., from left to right, then right to left for the next level and alternate between).
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: [[3], [20, 9], [15, 7]]
    #
    # Input: root = [1]
    # Output: [[1]]
    #
    # Input: root = []
    # Output: []
    #
    # @param {TreeNode} root
    # @return {Array<Array<Integer>>}
    def zigzag_level_order(root)
      result = private_methods.grep(/^zigzag_level_order_\d+$/).map { |m| send(m, root) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def zigzag_level_order_1(root)
      result = []

      p_level = [root].compact
      n_level = []

      until p_level.empty?
        p_level.each_with_index { |node, i|
          p_level[i] = node.val
          n_level.push(node.left) if node.left
          n_level.push(node.right) if node.right
        }

        p_level.reverse! if result.length.odd?
        result.push(p_level)

        p_level = n_level
        n_level = []
      end

      result
    end

    def zigzag_level_order_2(root)
      result = []
      queue = [root].compact

      until queue.empty?
        level = []

        queue.length.times {
          node = queue.shift

          level.public_send((result.length.odd? ? :unshift : :push), node.val)

          queue.push(node.left) if node.left
          queue.push(node.right) if node.right
        }

        result.push(level) if !level.empty?
      end

      result
    end
  end
end
