# frozen_string_literal: true

module LeetCode
  # 117. Populating Next Right Pointers in Each Node II
  module LC117
    # Description:
    # Given a binary tree:
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
    # Input: root = [1, 2, 3, 4, 5, null, 7]
    # Output: [1, #, 2, 3, #, 4, 5, 7, #]
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
        p_node = queue.shift

        n_node = p_node.next
        n_node = n_node.next while n_node && (!n_node.left && !n_node.right)

        p_node.left.next = p_node.right || n_node&.left || n_node&.right if p_node.left
        p_node.right.next = n_node&.left || n_node&.right if p_node.right

        queue.push(p_node.left) if p_node.left
        queue.push(p_node.right) if p_node.right
      end

      root
    end

    def connect_2(root)
      p_level = root
      n_level = nil

      while p_level
        p_node = p_level

        while p_node
          n_node = p_node.next
          n_node = n_node.next while n_node && (!n_node.left && !n_node.right)

          p_node.left.next = p_node.right || n_node&.left || n_node&.right if p_node.left
          p_node.right.next = n_node&.left || n_node&.right if p_node.right

          n_level ||= p_node.left || p_node.right
          p_node = n_node
        end

        p_level = n_level
        n_level = nil
      end

      root
    end
  end
end
