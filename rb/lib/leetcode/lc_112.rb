# frozen_string_literal: true

module LeetCode
  # 112. Path Sum
  module LC112
    # Description:
    # Given the root of a binary tree and an integer targetSum,
    # return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.
    #
    # Examples:
    # Input: root = [5, 4, 8, 11, null, 13, 4, 7, 2, null, null, null, 1], targetSum = 22
    # Output: true
    #
    # Input: root = [1, 2, 3], targetSum = 5
    # Output: false
    #
    # Input: root = [], targetSum = 0
    # Output: false
    #
    # @param {TreeNode} root
    # @param {Integer} target_sum
    # @return {Boolean}
    def has_path_sum(root, target_sum)
      stack = []
      stack.push([root, target_sum]) if root

      until stack.empty?
        node, sum = stack.pop

        return true if !node.left && !node.right && node.val == sum

        stack.push([node.right, sum - node.val]) if node.right
        stack.push([node.left, sum - node.val]) if node.left
      end

      false
    end
  end
end
