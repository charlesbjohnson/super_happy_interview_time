# frozen_string_literal: true

module LeetCode
  # 637. Average of Levels in Binary Tree
  module LC637
    # Description:
    # Given the root of a binary tree, return the average value of the nodes on each level in the form of an array.
    # Answers within 10^-5 of the actual answer will be accepted.
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: [3.00000, 14.50000, 11.00000]
    #
    # Input: root = [3, 9, 20, 15, 7]
    # Output: [3.00000, 14.50000, 11.00000]
    #
    # @param {TreeNode} root
    # @return {Array<Float>}
    def average_of_levels(root)
      result = []
      level = [root]

      until level.empty?
        n_level = []
        sum = 0

        level.each { |node|
          sum += node.val
          n_level.push(node.left) if node.left
          n_level.push(node.right) if node.right
        }

        result.push(sum.fdiv(level.length))
        level = n_level
      end

      result
    end
  end
end
