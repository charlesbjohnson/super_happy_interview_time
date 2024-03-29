# frozen_string_literal: true

module LeetCode
  # 110. Balanced Binary Tree
  module LC110
    # Description:
    # Given a binary tree, determine if it is height-balanced.
    #
    # For this problem, a height-balanced binary tree is defined as:
    # a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
    #
    # Examples:
    # Input: root = [3, 9, 20, null, null, 15, 7]
    # Output: true
    #
    # Input: root = [1, 2, 2, 3, 3, null, null, 4, 4]
    # Output: false
    #
    # Input: root = []
    # Output: true
    #
    # @param {TreeNode} root
    # @return {Boolean}
    def is_balanced(root)
      rec = ->(root) {
        return [true, 0] if !root

        l_bal, l = rec.call(root.left)
        r_bal, r = rec.call(root.right)

        [l_bal && r_bal && (l - r).abs <= 1, [l, r].max + 1]
      }

      rec.call(root)[0]
    end
  end
end
