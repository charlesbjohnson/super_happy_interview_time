# frozen_string_literal: true

module LeetCode
  # 116. Populating Next Right Pointers in Each Node
  module LC116
    # Description:
    # You are given a perfect binary tree where all leaves are on the same level, and every parent has two children.
    #
    # The binary tree has the following definition:
    # struct Node {
    #   int val;
    #   Node *left;
    #   Node *right;
    #   Node *next;
    # }
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
      result = private_methods.grep(/^connect_\d+$/).map { |m| send(m, root.clone) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def connect_1(root)
      queue = [root].compact

      until queue.empty?
        node = queue.shift

        if node.left
          node.left.next = node.right
          queue.push(node.left)
        end

        if node.right
          node.right.next = node.next&.left
          queue.push(node.right)
        end
      end

      root
    end

    def connect_2(root)
      level = root

      while level
        node = level

        while node
          node.left.next = node.right if node.left
          node.right.next = node.next&.left if node.right
          node = node.next
        end

        level = level.left
      end

      root
    end
  end
end
