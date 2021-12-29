# frozen_string_literal: true

module LeetCode
  # 101. Symmetric Tree
  module LC101
    # Description:
    # Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
    #
    # Follow up: Could you solve it both recursively and iteratively?
    #
    # Examples:
    # Input: root = [1, 2, 2, 3, 4, 4, 3]
    # Output: true
    #
    # Input: root = [1, 2, 2, null, 3, null, 3]
    # Output: false
    #
    # @param {TreeNode} root
    # @return {Boolean}
    def is_symmetric(root)
      stack = []
      stack.push([root.left, root.right]) if root.left || root.right

      until stack.empty?
        left, right = stack.pop

        return false if !left && right || left && !right || left.val != right.val

        stack.push([left.left, right.right]) if left.left || right.right
        stack.push([left.right, right.left]) if left.right || right.left
      end

      true
    end
  end
end
