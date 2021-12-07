# frozen_string_literal: true

module LeetCode
  # 116. Populating Next Right Pointers in Each Node
  module LC116
    TreeLinkNode = Struct.new(:val, :left, :right, :next)

    # Description:
    # Given a binary tree, populate each next pointer to point to its next right node.
    # If there is no next right node, the next pointer should be set to NULL.
    #
    # Initially, all next pointers are set to NULL.
    #
    # Examples:
    # Input:
    #        1
    #      /  \
    #     2    3
    #    / \  / \
    #   4  5  6  7
    #
    # Output:
    #        1--> NULL
    #      /  \
    #     2--->3 -> NULL
    #    / \  / \
    #   4->5->6->7 -> NULL
    #
    # Notes:
    # - You may only use constant extra space.
    # - You may assume that it is a perfect binary tree (ie, all leaves are at the same level, and every parent has two children).
    #
    # @param tree {TreeLinkNode}
    # @return {nil}
    def connect(tree)
      return unless tree

      tree.left.next = tree.right if tree.left
      tree.right.next = tree.next.left if tree.right && tree.next && tree.next.left

      connect(tree.left)
      connect(tree.right)

      nil
    end
  end
end
