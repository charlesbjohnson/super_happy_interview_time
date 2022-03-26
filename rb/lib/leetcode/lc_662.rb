# frozen_string_literal: true

module LeetCode
  # 662. Maximum Width of Binary Tree
  module LC662
    # Description:
    # Given the root of a binary tree, return the maximum width of the given tree.
    #
    # The maximum width of a tree is the maximum width among all levels.
    #
    # The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes),
    # where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.
    #
    # It is guaranteed that the answer will in the range of a 32-bit signed integer.
    #
    # Examples:
    # Input: root = [1, 3, 2, 5, 3, null, 9]
    # Output: 4
    #
    # Input: root = [1, 3, 2, 5, null, null, 9, 6, null, 7]
    # Output: 7
    #
    # Input: root = [1, 3, 2, 5]
    # Output: 2
    #
    # @param {TreeNode} root
    # @return {Integer}
    def width_of_binary_tree(root)
      result = 0
      queue = [[root, 0]]

      until queue.empty?
        l = queue[0][1]
        r = l

        queue.length.times {
          node, i = queue.shift

          queue.push([node.left, (i * 2)]) if node.left
          queue.push([node.right, (i * 2) + 1]) if node.right

          r = i
        }

        result = [result, r - l + 1].max
      end

      result
    end
  end
end
