# frozen_string_literal: true

module LeetCode
  # 117. Populating Next Right Pointers in Each Node II
  module LC117
    # Description:
    # Given a binary tree
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
    # Input: root = [1, 2, 3, 4, 5, null, 7]
    # Output: [1, #, 2, 3, #, 4, 5, 7, #]
    #
    # Input: root = []
    # Output: []
    #
    # @param {Node} root
    # @return {Node}
    def connect(root)
      return root if !root || (!root.left && !root.right)

      cursor = root.next

      while cursor
        if cursor.left || cursor.right
          (root.right || root.left).next = cursor.left || cursor.right
          break
        end

        cursor = cursor.next
      end

      root.left.next = root.right if root.left && !root.left.next

      connect(root.right)
      connect(root.left)

      root
    end
  end
end
