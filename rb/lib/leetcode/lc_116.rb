# frozen_string_literal: true

module LeetCode
  # 116. Populating Next Right Pointers in Each Node
  module LC116
    # Description:
    # You are given a perfect binary tree where all leaves are on the same level, and every parent has two children.
    #
    # Populate each next pointer to point to its next right node.
    # If there is no next right node, the next pointer should be set to NULL.
    #
    # Initially, all next pointers are set to NULL.
    #
    # Follow-up:
    # - You may only use constant extra space.
    # - The recursive approach is fine. You may assume implicit stack space does not count as extra space for this problem.
    #
    # Examples:
    # Input: root = [1, 2, 3, 4, 5, 6, 7]
    # Output: [1, #, 2, 3, #, 4, 5, 6, 7, #]
    #
    # Input: root = []
    # Output: []
    #
    # @param {Node} root
    # @return {Node}
    def connect(root)
      return root if !root || (!root.left && !root.right)

      root.left.next = root.right
      root.right.next = root.next.left if root.next

      connect(root.left)
      connect(root.right)

      root
    end
  end
end
