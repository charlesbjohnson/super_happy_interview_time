# frozen_string_literal: true

module LeetCode
  # 104. Maximum Depth of Binary Tree
  module LC104
    # Description:
    # Given the root of a binary tree, return its maximum depth.
    #
    # A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: 3
    #
    # Input: root = [1, null, 2]
    # Output: 2
    #
    # @param {TreeNode} root
    # @return {Integer}
    def max_depth(root)
      result = private_methods.grep(/^max_depth_\d+$/).map { |m| send(m, root) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_depth_1(root)
      root ? [max_depth(root.left) + 1, max_depth(root.right) + 1].max : 0
    end

    def max_depth_2(root)
      result = 0
      stack = [[root, 1]]

      until stack.empty?
        node, depth = stack.pop

        next if !node

        if !node.left && !node.right
          result = [result, depth].max
          next
        end

        stack.push([node.right, depth + 1])
        stack.push([node.left, depth + 1])
      end

      result
    end
  end
end
