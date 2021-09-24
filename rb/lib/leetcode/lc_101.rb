# typed: false
# frozen_string_literal: true

module LeetCode
  # 101. Symmetric Tree
  module LC101
    TreeNode = Struct.new(:val, :left, :right)

    # Description:
    # Given a binary tree, check whether it is a mirror of itself (ie. symmetric around its center).
    #
    # Examples:
    # - 1:
    #   Input:
    #       1
    #      / \
    #     2   2
    #    / \ / \
    #   3  4 4  3
    #   Output: true
    #
    # - 2:
    #   Input:
    #     1
    #    / \
    #   2   2
    #    \   \
    #    3    3
    #   Output: false
    #
    # Notes:
    # - Bonus points if you could solve it both recursively and iteratively.
    #
    # @param tree {TreeNode}
    # @return {Boolean}
    def symmetric?(tree)
      return true unless tree

      queue = [[tree]]

      until queue.empty?
        nodes = queue.shift

        values = nodes.map { |node| node ? node.val : nil }
        return false if values != values.reverse

        visit = nodes.reject(&:nil?).flat_map { |node| [node.left, node.right] }
        queue.push(visit) unless visit.empty?
      end

      true
    end

    alias_method(:is_symmetric, :symmetric?)
  end
end
