# frozen_string_literal: true

module LeetCode
  # 113. Path Sum II
  module LC113
    # Description:
    # Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum.
    # Each path should be returned as a list of the node values, not node references.
    #
    # A root-to-leaf path is a path starting from the root and ending at any leaf node.
    # A leaf is a node with no children.
    #
    # Examples:
    # Input: root = [5, 4, 8, 11, null, 13, 4, 7, 2, null, null, 5, 1], targetSum = 22
    # Output: [[5, 4, 11, 2], [5, 8, 4, 5]]
    #
    # Input: root = [1, 2, 3], targetSum = 5
    # Output: []
    #
    # Input: root = [1, 2], targetSum = 0
    # Output: []
    #
    # @param {TreeNode} root
    # @param {Integer} target_sum
    # @return {Array<Array<Integer>>}
    def path_sum(root, target_sum)
      result = private_methods.grep(/^path_sum_\d+$/).map { |m| send(m, root, target_sum) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def path_sum_1(root, target_sum)
      result = []

      rec = ->(node, path) {
        if !node.left && !node.right
          result.push(path + [node.val]) if path.sum + node.val == target_sum
          return
        end

        path.push(node.val)
        rec.call(node.left, path) if node.left
        rec.call(node.right, path) if node.right
        path.pop
      }

      rec.call(root, []) if root
      result
    end

    def path_sum_2(root, target_sum)
      result = []

      stack = []
      path = []

      stack.push([root, false]) if root

      until stack.empty?
        node, backtrack = stack.pop

        if backtrack
          path.pop
          next
        end

        if !node.left && !node.right
          result.push(path + [node.val]) if path.sum + node.val == target_sum
          next
        end

        path.push(node.val)

        stack.push([node, true])
        stack.push([node.right, false]) if node.right
        stack.push([node.left, false]) if node.left
      end

      result
    end
  end
end
