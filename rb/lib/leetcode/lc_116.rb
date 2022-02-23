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
      queue = [root]

      until queue.empty?
        node = queue.shift

        next if !node || (!node.left && !node.right)

        node.left.next = node.right
        node.right.next = node.next.left if node.next

        queue.push(node.left)
        queue.push(node.right)
      end

      root
    end
  end
end
