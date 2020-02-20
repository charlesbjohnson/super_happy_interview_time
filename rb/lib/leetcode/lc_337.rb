# typed: true
# frozen_string_literal: true

module LeetCode
  # 337. House Robber III
  module LC337
    TreeNode = Struct.new(:val, :left, :right)

    def rob_recurse(tree, amount, robbed_parent, cache)
      return amount unless tree

      cache.left = TreeNode.new(nil) if tree.left && !cache.left
      cache.right = TreeNode.new(nil) if tree.right && !cache.right

      unless cache.val
        no_steal_l = rob_recurse(tree.left, amount, false, cache.left)
        no_steal_r = rob_recurse(tree.right, amount, false, cache.right)

        no_steal = no_steal_l + no_steal_r
        steal = -Float::INFINITY

        unless robbed_parent
          steal_l = rob_recurse(tree.left, amount, true, cache.left)
          steal_r = rob_recurse(tree.right, amount, true, cache.right)
          steal = steal_l + steal_r + tree.val
        end

        cache.val = [no_steal, steal]
      end

      return cache.val.first if robbed_parent

      cache.val.max
    end

    # Description:
    # The thief has found himself a new place for his thievery again.
    # There is only one entrance to this area, called the "root."
    # Besides the root, each house has one and only one parent house.
    # After a tour, the smart thief realized that "all houses in this place forms a binary tree".
    # It will automatically contact the police if two directly-linked houses were broken into on the same night.
    #
    # Determine the maximum amount of money the thief can rob tonight without alerting the police.
    #
    # Examples:
    # - 1:
    #   Input:
    #     ->3
    #      / \
    #     2   3
    #      \   \
    #     ->3  ->1
    #   Output: 7
    #   Explanation: 3->3->1
    #
    # - 2:
    #   Input:
    #         3
    #        / \
    #     ->4 ->5
    #      / \   \
    #     1   3   1
    #   Output: 9
    #   Explanation: 4->5
    #
    # @param tree {TreeNode}
    # @return {Integer}
    def rob(tree)
      rob_recurse(tree, 0, false, TreeNode.new(nil))
    end
  end
end
