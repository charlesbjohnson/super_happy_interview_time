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
      result = private_methods.grep(/^has_path_sum_\d+$/).map { |m| send(m, root, target_sum) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def has_path_sum_1(root, target_sum)
      rec = ->(node, sum) {
        return false if !node
        return sum + node.val == target_sum if !node.left && !node.right

        rec.call(node.left, sum + node.val) || rec.call(node.right, sum + node.val)
      }

      rec.call(root, 0)
    end

    def has_path_sum_2(root, target_sum)
      stack = [[root, 0]].compact

      until stack.empty?
        node, sum = stack.pop

        next if !node
        return true if sum + node.val == target_sum && !node.left && !node.right

        stack.push([node.right, sum + node.val]) if node.right
        stack.push([node.left, sum + node.val]) if node.left
      end

      false
    end
  end
end
